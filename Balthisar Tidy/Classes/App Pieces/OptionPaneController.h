/**************************************************************************************************

	OptionPaneController.h

	The main controller for the Tidy Options pane. Used separately by

	- document windows
	- the preferences window


	The MIT License (MIT)

	Copyright (c) 2001 to 2013 James S. Derry <http://www.balthisar.com>

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

#import <Cocoa/Cocoa.h>
#import "PreferenceController.h"
#import "JSDTableView.h"   // Required in header to support delegate protocol.
#import "JSDTidyOption.h"
#import "JSDTidyModel.h"


@interface OptionPaneController : NSObject <NSTableViewDataSource, JSDTableViewDelegate>


@property NSArray *optionsInEffect;                                // Only options in this list will be used.

@property JSDTidyModel *tidyDocument;                              // Expose the tidyDocument for its options values.

@property (assign) BOOL isInPreferencesView;                       // Controls some item visibility if in Preferences.


/**
	External exposure because we need to force reload the
	data sometimes.
	
	@todo refactor interface to this controller's model.
	Right now we're accessing this directly from the
	outside, and we really should have this controller
	host a key-value pair model, probably from the
	user preferences system. Right now this hackey way
	is only used in one spot, and it's bad design.
 */
@property (weak) IBOutlet NSTableView *theTable;                   // Expose the table.


- (instancetype)init;

- (void)putViewIntoView:(NSView *)dstView;                         // Put this controllers `view` into `dstView`.

@end
