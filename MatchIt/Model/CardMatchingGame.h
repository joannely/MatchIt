//
//  CardMatchingGame.h
//  MatchIt
//
//  Created by Joanne Wang on 8/16/15.
//  Copyright (c) 2015 Joanne Wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

// designated initializer
- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;

- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSInteger score;
@property (nonatomic) NSUInteger matchNumber;


- (void)matchCards:(NSMutableArray *)cards withCard:(Card *)card;
- (NSString *)getStatusUpdate;
- (void)addToChosenCards:(Card *)card;


@end
