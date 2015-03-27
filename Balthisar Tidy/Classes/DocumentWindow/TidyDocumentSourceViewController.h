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

@import Cocoa;

#import "MGSDragOperationDelegate.h" // can't use module because of delegate support.

@class MGSFragariaView;


@interface TidyDocumentSourceViewController : NSViewController <NSTextViewDelegate, MGSDragOperationDelegate>

@property (assign) IBOutlet MGSFragariaView *sourceTextView;

@property (assign) IBOutlet MGSFragariaView *tidyTextView;

@property (assign) IBOutlet NSSplitView *splitterViews;

@property (assign) IBOutlet NSTextField *sourceLabel;

@property (assign) IBOutlet NSTextField *tidyLabel;


@property (readonly, assign) BOOL isVertical;

@property (assign) BOOL viewsAreSynced;

@property (assign) BOOL viewsAreDiffed;

@property (assign) NSUInteger pageGuidePosition;


- (instancetype)initVertical:(BOOL)initVertical;

- (void)setupViewAppearance;

- (void)centerSourceTextErrorUsingArrayController:(NSArrayController*)arrayController;


/* 
   We will use this to tickle when used externally, since setting the string
   directly doesn't trigger notifications.
 */
- (void)textDidChange:(NSNotification *)aNotification;


@end
