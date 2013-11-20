/**************************************************************************************************

	AppController.m

	part of Balthisar Tidy

	This main application controller ties together the |PreferenceController| and
	the |BatchController|. The |DocumentController| is implemented automatically and no
	special works needs to be done.


	The MIT License (MIT)

	Copyright (c) 2001 to 2013 James S. Derry <http://www.balthisar.com>

	Permission is hereby granted, free of charge, to any person obtaining a copy of this software
	and associated documentation files (the "Software"), to deal in the Software without
	restriction, including without limitation the rights to use, copy, modify, merge, publish,
	distribute, sublicense, and/or sell	copies of the Software, and to permit persons to whom the
	Software is	furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in
	all copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
	BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
	NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
	DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

 **************************************************************************************************/

#import <Cocoa/Cocoa.h>
#import "AppController.h"
#import "PreferenceController.h"
#import "BatchController.h"


#pragma mark -
#pragma mark Non-Public iVars, Properties, and Method declarations

@interface AppController ()

	@property (readonly, nonatomic) PreferenceController *thePreferenceController;
	@property (readonly, nonatomic) BatchController *theBatchController;

@end


#pragma mark -
#pragma mark Implementation

@implementation AppController


#pragma mark -
#pragma mark initializers and deallocs


/*–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––*
	When the app is initialized pass off registering of the user
	defaults to the |PreferenceController|.
 *–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––*/
+(void)initialize
{
    [PreferenceController registerUserDefaults];
}


/*–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––*
	dealloc
 *–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––*/
- (void)dealloc
{
    [[self thePreferenceController] release];
    [[self theBatchController] release];
    [super dealloc];
}


#pragma mark -
#pragma mark Handle showing preferences and batch windows.


/*–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––*
	Show the preferences window.
 *–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––*/
- (IBAction)showPreferences:(id)sender
{
    if (![self thePreferenceController])
	{
        _thePreferenceController = [[PreferenceController alloc] init];
    }

    [[self thePreferenceController] showWindow:self];
}


/*–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––*
	Show the batch window.
 *–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––*/
- (IBAction)showBatch:(id)sender
{
    if (![self theBatchController])
	{
        _theBatchController = [[BatchController alloc] init];
    }

    [[self theBatchController] showWindow:self];
}

@end
