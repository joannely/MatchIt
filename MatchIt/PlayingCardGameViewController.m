//
//  PlayingCardGameViewController.m
//  MatchIt
//
//  Created by Joanne Wang on 8/26/15.
//  Copyright (c) 2015 Joanne Wang. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"

@interface PlayingCardGameViewController() 

@end

@implementation PlayingCardGameViewController

- (Deck *)createDeck {
    return [[PlayingCardDeck alloc] init];
}

@end