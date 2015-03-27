/**************************************************************************************************

	TidyDocumentSourceViewController
	 
	The source and tidy text view controller. Manages the two text fields, their interactions,
	and the type of display.
 

	The MIT License (MIT)

	Copyright (c) 2014 James S. Derry <http://www.balthisar.com>

	Permission is hereby granted, free of charge, to any person obtaining a copy of this software
	and associated documentation files (the "Software"), to deal in the Software without
	restriction, including without limitation the rights to use, copy, modify, merge, publish,
	distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the
	Software is furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in
	all copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
	BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
	NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
	DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

 **************************************************************************************************/

#import "TidyDocumentSourceViewController.h"
#import "CommonHeaders.h"

#import "MGSFragariaPreferences.h"
#import "MGSFragaria.h"
#import "SMLSyntaxError.h"
#import "JSDTidyModel.h"
#import "TidyDocument.h"


@implementation TidyDocumentSourceViewController


#pragma mark - Initialization and Deallocation


/*———————————————————————————————————————————————————————————————————*
	initVertical: - designated initializer
 *———————————————————————————————————————————————————————————————————*/
- (instancetype)initVertical:(BOOL)initVertical
{
	NSString *nibName = initVertical ? @"TidyDocumentSourceV" : @"TidyDocumentSourceH";

	if ((self = [super initWithNibName:nibName bundle:nil]))
	{
		_isVertical = initVertical;
		_viewsAreSynced = NO;
		_viewsAreDiffed = NO;
	}

	return self;
}


/*———————————————————————————————————————————————————————————————————*
	init
 *———————————————————————————————————————————————————————————————————*/
- (instancetype)init
{
	return [self initVertical:NO];
}


/*———————————————————————————————————————————————————————————————————*
	dealloc
 *———————————————————————————————————————————————————————————————————*/
- (void)dealloc
{
	[[NSNotificationCenter defaultCenter] removeObserver:self name:tidyNotifySourceTextRestored object:[[self representedObject] tidyProcess]];

	[[NSUserDefaults standardUserDefaults] removeObserver:self forKeyPath:JSDKeyAllowMacOSTextSubstitutions];
}

/*———————————————————————————————————————————————————————————————————*
	awakeFromNib
 *———————————————————————————————————————————————————————————————————*/
- (void)awakeFromNib
{
	/*
		NSNotifications from the document's sourceText, in case tidyProcess
		changes the sourceText.
	 */
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(handleTidySourceTextRestored:)
												 name:tidyNotifySourceTextRestored
											   object:[[self representedObject] tidyProcess]];

	/* KVO on user prefs to look for Text Substitution Preference Changes */
    [((TidyDocument*)self.representedObject).tidyProcess addObserver:self
                             forKeyPath:@"errorArray"
                                options:(NSKeyValueObservingOptionNew|NSKeyValueObservingOptionInitial)
                                context:NULL];

    /* KVO on the document's error array so that we can keep the error descriptions up to date. */
    [[NSUserDefaults standardUserDefaults] addObserver:self
                                            forKeyPath:JSDKeyAllowMacOSTextSubstitutions
                                               options:(NSKeyValueObservingOptionNew|NSKeyValueObservingOptionInitial)
                                               context:NULL];


    /* Interface Builder doesn't allow us to define custom bindings, so we have to bind the tidyTextView manually. */
    [self.tidyTextView bind:@"string" toObject:self.representedObject withKeyPath:@"tidyProcess.tidyText" options:nil];
}


#pragma mark - Delegate Methods


/*———————————————————————————————————————————————————————————————————*
	textDidChange:
		We arrived here by virtue of being the delegate of
		`sourcetextView`. Simply update the tidyProcess sourceText,
		and the event chain will eventually update everything
		else.
 *———————————————————————————————————————————————————————————————————*/
- (void)textDidChange:(NSNotification *)aNotification
{
	TidyDocument *localDocument = self.representedObject;

	/* Update the tidyProcess */

	localDocument.tidyProcess.sourceText = self.sourceTextView.string;

	/* Handle document dirty detection. */

	if ( (!localDocument.tidyProcess.isDirty) || (localDocument.tidyProcess.sourceText.length == 0) )
	{
		[localDocument updateChangeCount:NSChangeCleared];
	}
	else
	{
		[localDocument updateChangeCount:NSChangeDone];
	}
}

/*–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––*
	textView:doCommandBySelector:
		We're here because we're the delegate of `sourceTextView`.
		Allow the tab key to back in and out of this view.
 *–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––*/
- (BOOL)textView:(NSTextView *)aTextView doCommandBySelector:(SEL)aSelector
{
	if (aSelector == @selector(insertTab:))
	{
		[aTextView.window selectNextKeyView:nil];
		return YES;
	}

	if (aSelector == @selector(insertBacktab:))
	{
		[aTextView.window selectPreviousKeyView:nil];
		return YES;
	}

	return NO;
}


/*–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––*
	concludeDragOperation:
		We're here because we're the concludeDragOperationDelegte
        of `sourceTextView`.
 *–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––*/
- (void)concludeDragOperation:(id <NSDraggingInfo>)sender
{
    NSPasteboard *pasteBoard = [sender draggingPasteboard];

    /**************************************************
     The pasteboard contains a list of file names
     **************************************************/
    if ( [[pasteBoard types] containsObject:NSFilenamesPboardType] )
    {
        NSArray *fileNames = [pasteBoard propertyListForType:@"NSFilenamesPboardType"];

        for (NSString *path in fileNames)
        {
            NSString *contents;

            /*************************************
             Mac OS X 10.10+: Will try to guess
             the encoding of the dragged in file
             *************************************/
            if ([NSString respondsToSelector:@selector(stringEncodingForData:encodingOptions:convertedString:usedLossyConversion:)])
            {
                NSData *rawData;
                if ((rawData = [NSData dataWithContentsOfFile:path]))
                {
                    [NSString stringEncodingForData:rawData encodingOptions:nil convertedString:&contents usedLossyConversion:nil];
                }
            }
            /*************************************
             Older Mac OS X can only accept UTF.
             *************************************/
            else
            {
                NSError *error;
                contents = [NSString stringWithContentsOfFile:path usedEncoding:nil error:&error];
                if (error)
                {
                    contents = nil;
                }
            }

            if (contents)
            {
                [self.sourceTextView.textView insertText:contents];
            }

		}
	}
}


#pragma mark - KVC and Notification Handling


/*———————————————————————————————————————————————————————————————————*
	observeValueForKeyPath:ofObject:change:context:
		Handle KVC Notifications:
		- the processor's sourceText changed.
 *———————————————————————————————————————————————————————————————————*/
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
	/* Handle changes to the preferences for allowing or disallowing Mac OS X Text Substitutions */
	if ((object == [NSUserDefaults standardUserDefaults]) && ([keyPath isEqualToString:JSDKeyAllowMacOSTextSubstitutions]))
	{
		[self.sourceTextView.textView setAutomaticQuoteSubstitutionEnabled:[[[NSUserDefaults standardUserDefaults] valueForKey:JSDKeyAllowMacOSTextSubstitutions] boolValue]];
		[self.sourceTextView.textView setAutomaticTextReplacementEnabled:[[[NSUserDefaults standardUserDefaults] valueForKey:JSDKeyAllowMacOSTextSubstitutions] boolValue]];
		[self.sourceTextView.textView setAutomaticDashSubstitutionEnabled:[[[NSUserDefaults standardUserDefaults] valueForKey:JSDKeyAllowMacOSTextSubstitutions] boolValue]];
	}

    if ((object == ((TidyDocument*)self.representedObject).tidyProcess) && ([keyPath isEqualToString:@"errorArray"]))
    {
        NSArray *localErrors = ((TidyDocument*)self.representedObject).tidyProcess.errorArray;
        NSMutableArray *highlightErrors = [[NSMutableArray alloc] init];

        for (NSDictionary *localError in localErrors)
        {
            SMLSyntaxError *newError = [SMLSyntaxError new];
            newError.errorDescription = localError[@"message"];
            newError.line = [localError[@"line"] intValue];
            newError.character = [localError[@"column"] intValue];
            newError.length = 1;
            newError.hidden = NO;
            [highlightErrors addObject:newError];
        }

        self.sourceTextView.syntaxErrors = highlightErrors;

        NSLog(@"%@", @"KVO ON THE ERROR ARRAY WORKS.");

    }
}


/*———————————————————————————————————————————————————————————————————*
	handleTidySourceTextRestored:
		Handle changes to the tidyProcess's sourceText property.
		The tidyProcess changed the sourceText for some reason,
		probably because the user changed input-encoding. Note
		that this event is only received if Tidy itself changes
		the sourceText, not as the result of outside setting.
		The event chain will eventually update everything else.
 *———————————————————————————————————————————————————————————————————*/
- (void)handleTidySourceTextRestored:(NSNotification *)note
{
	self.sourceTextView.string = ((TidyDocument*)self.representedObject).tidyProcess.sourceText;

	/* At this point, we're done loading the document */
	((TidyDocument*)self.representedObject).documentIsLoading = NO;
}


#pragma mark - Appearance Setup


/*———————————————————————————————————————————————————————————————————*
	setupViewAppearance
 *———————————————————————————————————————————————————————————————————*/
- (void)setupViewAppearance
{
    self.view.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
    [self.view setFrame:self.view.superview.bounds];

	void (^configureCommonViewSettings)(MGSFragariaView *) = ^(MGSFragariaView *aView) {

		NSUserDefaults *localDefaults = [NSUserDefaults standardUserDefaults];

		// @todo: rewrite Fragaria to avoid this bullshit. Can't set options without using defaults?
	    [localDefaults setObject:[NSArchiver archivedDataWithRootObject:[NSFont fontWithName:@"Menlo" size:[NSFont systemFontSize]]] forKey:MGSFragariaPrefsTextFont];
		[localDefaults setObject:@(40) forKey:MGSFragariaPrefsGutterWidth];

		aView.lineWrap = NO;
	    aView.syntaxDefinitionName = @"html";

		[aView.textView setAutomaticQuoteSubstitutionEnabled:[[localDefaults valueForKey:JSDKeyAllowMacOSTextSubstitutions] boolValue]];
		[aView.textView setAutomaticTextReplacementEnabled:[[localDefaults valueForKey:JSDKeyAllowMacOSTextSubstitutions] boolValue]];
		[aView.textView setAutomaticDashSubstitutionEnabled:[[localDefaults valueForKey:JSDKeyAllowMacOSTextSubstitutions] boolValue]];
	    [aView.textView setImportsGraphics:NO];
	    [aView.textView setAllowsImageEditing:NO];
	    [aView.textView setUsesFontPanel:NO];
	    [aView.textView setUsesRuler:NO];
	    [aView.textView setUsesInspectorBar:NO];
	    [aView.textView setUsesFindBar:NO];
	    [aView.textView setUsesFindPanel:NO];
	    [self.tidyTextView.textView setSelectable:YES];
	    [self.tidyTextView.textView setRichText:NO];
	};

	configureCommonViewSettings(self.sourceTextView);
	configureCommonViewSettings(self.tidyTextView);

	/* tidyTextView special settings. */

	[self.tidyTextView.textView setEditable:NO];
	[self.tidyTextView.textView setAllowsUndo:NO];

	// @todo: stupid Fragaria's preferences make this impossible to apply only to one instance currently.
//	[[NSUserDefaults standardUserDefaults] setObject:@(YES) forKey:MGSFragariaPrefsShowPageGuide];
//	[[NSUserDefaults standardUserDefaults] setObject:@(80) forKey:MGSFragariaPrefsShowPageGuideAtColumn];


	/* sourceTextView shouldn't accept every drop type */
	[self.sourceTextView.textView registerForDraggedTypes:@[NSFilenamesPboardType]];

}


/*———————————————————————————————————————————————————————————————————*
	centerSourceTextErrorUsingArrayController
		Perform error highlighting on the selected item in the
        arrayController, and center that line if possible. This is
        NOT the error highlighter, and is a response to the user
        selecting a row in the messages table.
 *———————————————————————————————————————————————————————————————————*/
- (void)centerSourceTextErrorUsingArrayController:(NSArrayController*)arrayController
{
	NSArray *localObjects = arrayController.arrangedObjects;

	NSUInteger errorViewRow = arrayController.selectionIndex;

	if (errorViewRow < [localObjects count])
	{
		NSInteger row = [localObjects[errorViewRow][@"line"] intValue];

		if (row > 0)
		{
            [self.sourceTextView goToLine:row centered:YES highlight:YES];
		}
	}

}


#pragma mark - Properties

- (void)setPageGuidePosition:(NSUInteger)pageGuidePosition
{
    // @todo: stupid Fragaria's preferences need to be reworked.
    [[NSUserDefaults standardUserDefaults] setObject:@(pageGuidePosition>0) forKey:MGSFragariaPrefsShowPageGuide];
    [[NSUserDefaults standardUserDefaults] setObject:@(pageGuidePosition) forKey:MGSFragariaPrefsShowPageGuideAtColumn];
}

- (NSUInteger)pageGuidePosition
{
    return [[NSUserDefaults standardUserDefaults] integerForKey:MGSFragariaPrefsShowPageGuideAtColumn];
}


@end
