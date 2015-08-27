//
//  Deck.h
//  MatchIt
//
//  Created by Joanne Wang on 8/14/15.
//  Copyright (c) 2015 Joanne Wang. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;

- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;


@end