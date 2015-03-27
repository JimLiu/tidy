//
//  MGSFragariaViewPrivate.h
//  Fragaria
//
//  Created by Jim Derry on 3/25/15.
//
//

@class MGSSyntaxErrorController;
@class MGSPreferencesObserver;


#pragma mark - Class Extension


@interface MGSFragariaView()


#pragma mark - System Components


/** The controller which manages and displays the syntax errors in Fragaria's
 *  text view and gutter view. */
@property (readonly) MGSSyntaxErrorController *syntaxErrorController;

/** Fragaria's preferences observer, used for supporting the default preference
 *  panels.  */
@property (readonly) MGSPreferencesObserver *preferencesObserver;


@end

