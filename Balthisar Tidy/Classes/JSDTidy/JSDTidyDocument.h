/**************************************************************************************************

	JSDTidyDocument.h

	A Cocoa wrapper for tidylib.
	

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

#import <Foundation/Foundation.h>
#import "tidy.h"
#import "tidyenum.h"


#pragma mark - Some defines


/*
	This prefix will prepend all TidyLib options stored in the prefs file. 
	You might want to use this in order to namespace your preferences if
	you choose to use Cocoa's native preferences system. TidyLib still
	supports Tidy's native configuration system, of course.
*/

#define tidyPrefPrefix @"-tidy-"


/*
	The default encoding styles that override the TidyLib-implemented
	character encodings. These are present in the header in case you
	want to provide your own defaults.
*/

#define tidyDefaultInputEncoding	NSUTF8StringEncoding
#define tidyDefaultLastEncoding		NSUTF8StringEncoding
#define tidyDefaultOutputEncoding	NSUTF8StringEncoding


#pragma mark - class JSDTidyDocument


@interface JSDTidyDocument : NSObject {
}

#pragma mark - Initialization and Deallocation


/*–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––*
	INITIALIZATION and DESTRUCTION
 *–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––*/

- (id)init;

- (void)dealloc;

/*
	The convenience initializers below assume that strings and data
	are already processed to NSString standard. File-based intializers
	will try to convert to NSString standard using the default tidy
	option `input-encoding`. (NSString nominally UTF16.)
	
	Given original text in this initalizers, the working text will
	be generated immediately.
*/

- (id)initWithString:(NSString *)value;

- (id)initWithData:(NSData *)data;

- (id)initWithFile:(NSString *)path;


#pragma mark - Encoding Support


/*–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––*
	ENCODING SUPPORT
 *–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––*/

/*
	The following class methods return convenience collections that
	might be useful in implementing a user interface for the
	encoding support of JSDTidyDocument. The dictionaries all
	return dictionaries with potentially useful information.

	The simple array is a list of all available encoding names
	in the localized language sorted in a localized manner.
 
	The dictionaries are dictionaries of the same data differing
	only by the key. The call contain `NSStringEncoding`,
	`LocalizedIndex`, and `LocalizedName`.
*/

+ (NSArray *)allAvailableEncodingLocalizedNames;

+ (NSDictionary *)availableEncodingDictionariesByLocalizedName;

+ (NSDictionary *)availableEncodingDictionariesByNSStringEncoding;

+ (NSDictionary *)availableEncodingDictionariesByLocalizedIndex;


#pragma mark - Text


/*–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––*
	TEXT - the important, good stuff.
 *–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––*/

/*
	originalText -- this allows an optional reference copy of the
	really original text as a convenience for changes, whereas
	workingText (elsewhere) may be modified in your application.
	
	The non-string set methods decode using the current encoding set
	in `input-encoding`.
*/

@property (strong) NSString *originalText;

- (void)setOriginalTextWithData:(NSData *)data;

- (void)setOriginalTextWithFile:(NSString *)path;


/*
	workingText -- this is the text that Tidy will actually tidy up.
	The non-string set methods decode using the current encoding
	setting in `input-encoding`.
*/

@property (strong) NSString *workingText;

- (void)setWorkingTextWithData:(NSData *)data;

- (void)setWorkingTextWithFile:(NSString *)path;


/*
	tidyText -- this is the text that Tidy generates from the
	workingText. Note that these are read-only.
*/

@property (readonly, strong) NSString *tidyText;

@property (readonly, weak) NSData *tidyTextAsData;

- (void)tidyTextToFile:(NSString *)path;


#pragma mark - Errors


/*–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––*
	ERRORS reported by tidy
 *–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––*/

@property (readonly, strong) NSString *errorText;			// Return the error text in traditional tidy format.

@property (readonly, strong) NSArray *errorArray;			// Error text as an array of |NSDictionary| of the errors.


#pragma mark - Text comparisons


/*–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––*
	TEXT COMPARISONS
 *–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––*/

// #TODO - these can be read-only properties.
- (bool)areEqualOriginalWorking;			// Are the original and working text identical?

- (bool)areEqualWorkingTidy;				// Are the working and tidy text identical?

- (bool)areEqualOriginalTidy;				// Are the orginal and tidy text identical?


#pragma mark - Options management


// TODO: invetigate possibilities for making all of this KVC compliant.
// TODO: a hell of a lot of these can be properties.

/*–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––*
	OPTIONS - methods for dealing with options
 *–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––*/

+ (NSArray *)			optionGetList;											// returns an NSArray of NSString for all options built into Tidy.

+ (int)					optionCount;											// returns the number of options built into Tidy.

+ (NSString *)			optionDocForId:(TidyOptionId)idf;						// returns TidyLib's description for the given ID.

+ (void)				optionDumpDocsToConsole;								// dumps all TidyLib descriptions to error console.

+ (TidyOptionId)		optionIdForName:(NSString *)name;						// returns the TidyOptionId for the given option name.

+ (NSString *)			optionNameForId:(TidyOptionId)idf;						// returns the name for the given TidyOptionId.

+ (TidyConfigCategory)	optionCategoryForId:(TidyOptionId)idf;					// returns the TidyConfigCategory for the given TidyOptionId.

+ (TidyOptionType)		optionTypeForId:(TidyOptionId)idf;						// returns the TidyOptionType: string, int, or bool.

+ (NSString *)			optionDefaultValueForId:(TidyOptionId)idf;				// returns the factory default value for the given TidyOptionId.

+ (bool)				optionIsReadOnlyForId:(TidyOptionId)idf;				// indicates whether the option is read-only.

+ (NSArray *)			optionPickListForId:(TidyOptionId)idf;					// returns an NSArray of NSString for the given TidyOptionId.

- (NSString *)			optionValueForId:(TidyOptionId)idf;						// returns the value for the item as an NSString

- (void)				setOptionValueForId:(TidyOptionId)idf					// sets the value for the given TidyOptionId.
							fromObject:(id)value;								// Works with NSString or NSNumber only!

- (void)				optionResetToDefaultForId:(TidyOptionId)id;				// resets the designated TidyOptionId to factory default

- (void)				optionResetAllToDefault;								// resets all options to factory default

- (void)				optionCopyFromDocument:(JSDTidyDocument *)theDocument;	// sets options based on those in theDocument.


// #TODO - Temporary to get signalling out of the OptionPaneController and into this class

@property (nonatomic) SEL action;								// Specify an |action| when options change.

@property (nonatomic, strong) id target;						// Specify a |target| for option changes.

//- (void)				signalOptionChange;		// #TODO - temp, invokes target-action when an option changes.

#pragma mark - Raw access exposure


/*–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––*
	RAW ACCESS EXPOSURE
 *–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––*/

// TODO: this is the working tidydoc, not the options-only version.
// TODO: this can be a property, and should be read-only.
- (TidyDoc)tidyDocument;						// Return the TidyDoc attached to this instance.


#pragma mark - Diagnostics and Repair


/*–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––*
	DIAGNOSTICS and REPAIR
 *–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––*/

- (void)processTidy;

// TODO: These can all be properties.
- (int) tidyDetectedHtmlVersion;	// Returns 0, 2, 3, 4, or 5.

- (bool)tidyDetectedXhtml;			// Determines whether the document is XHTML.

- (bool)tidyDetectedGenericXml;		// Determines if the document is generic XML.

- (int) tidyStatus;					// Returns 0 if there are no errors, 2 for doc errors, 1 for other.

- (uint)tidyErrorCount;				// Returns number of document errors.

- (uint)tidyWarningCount;			// Returns number of document warnings.

- (uint)tidyAccessWarningCount;		// Returns number of document accessibility warnings.


#pragma mark - Miscelleneous


/*–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––*
	MISCELLENEOUS - misc. Tidy methods supported
 *–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––*/

// TODO: These can all be properties.

- (NSString *)tidyReleaseDate;		// returns the TidyLib release date


#pragma mark - Configuration List Support


/*–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––*
	SUPPORTED CONFIG LIST SUPPORT
 *–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––*/

// TODO: I hate this. This loads a list of options statically from a file. Need a better means.
// In the mean time it should be private.
+ (NSArray *)loadConfigurationListFromResource:(NSString *)fileName ofType:(NSString *)fileType;	// get list of config options.


#pragma mark - Mac OS X Prefs Support


/*–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––*
	MAC OS PREFS SUPPORT
 *–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––*/

 + (void)addDefaultsToDictionary:(NSMutableDictionary *)defaultDictionary;	// sucks the defaults into a dictionary.

+ (void)addDefaultsToDictionary:(NSMutableDictionary *)defaultDictionary	// same as above, but with list of tidy options.
				   fromResource:(NSString *)fileName
						 ofType:(NSString *)fileType;

- (void)writeOptionValuesWithDefaults:(NSUserDefaults *)defaults;			// write the values right into prefs.

- (void)takeOptionValuesFromDefaults:(NSUserDefaults *)defaults;			// take config from passed-in defaults.


@end
