//
//  ViewController.h
//  MatchIt
//
//  Created by Joanne Wang on 8/14/15.
//  Copyright (c) 2015 Joanne Wang. All rights reserved.
//
// Abstract class. Must implement methods as described below

#import <UIKit/UIKit.h>
#import "Deck.h"
#import "CardMatchingGame.h"

@interface ViewController : UIViewController

// protected
// for subclasses
- (Deck *)createDeck;
- (NSAttributedString *)titleForCard:(Card *)card;
- (UIImage *)backgroundImageForCard:(Card *)card;
- (int)getMatchNumber;


@property (strong, nonatomic, readonly) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic, readonly) IBOutlet UILabel *scoreLabel;

@end

