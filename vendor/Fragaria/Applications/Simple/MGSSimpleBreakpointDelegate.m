//
//  MGSSimpleBreakpointDelegate.m
//  Fragaria
//
//  Created by Daniele Cattaneo on 29/01/15.
//
//

#import "MGSSimpleBreakpointDelegate.h"


@implementation MGSSimpleBreakpointDelegate


- (instancetype)init {
    self = [super init];
    breakpoints = [[NSMutableSet alloc] init];
    return self;
}


- (NSColor *)breakpointColourForLine:(NSUInteger)line ofFragaria:(MGSFragaria *)sender
{
    /* This is just a demo! A real app would have a more sophisticated way
     * of deciding a breakpoint's color. */
    
    if (line % 2 == 0)
        /* Non-standard-color breakpoint */
        return [NSColor orangeColor];
    
    if (line % 3 == 0)
        /* Transparent breakpoint */
        return [[NSColor greenColor] colorWithAlphaComponent:0.25];
    
    /* Standard color breakpoint */
    return nil;
}


- (void)toggleBreakpointForFile:(NSString*)file onLine:(int)line {
    NSNumber *lineNumber;
    
    lineNumber = [NSNumber numberWithInt:line];
    if ([breakpoints containsObject:lineNumber])
        [breakpoints removeObject:lineNumber];
    else
        [breakpoints addObject:lineNumber];
}


- (NSSet*)breakpointsForFile:(NSString*)file {
    return [breakpoints copy];
}




@end
