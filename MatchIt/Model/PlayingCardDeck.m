//
//  PlayingCardDeck.m
//  MatchIt
//
//  Created by Joanne Wang on 8/14/15.
//  Copyright (c) 2015 Joanne Wang. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@interface PlayingCardDeck()

@end

@implementation PlayingCardDeck

- (instancetype) init {
    self = [super init];
    
    if (self) {
        for (NSString *suit in [PlayingCard validSuits]) {
            for (NSUInteger rank = 1; rank <= [PlayingCard maxRank]; rank++) {
                PlayingCard *card = [[PlayingCard alloc] init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card];
            }
        }
    }
    
    return self;
}

@end