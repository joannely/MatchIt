//
//  SetCardDeck.m
//  MatchIt
//
//  Created by Joanne Wang on 9/7/15.
//  Copyright (c) 2015 Joanne Wang. All rights reserved.
//

#import "SetCardDeck.h"
#import "SetCard.h"

@implementation SetCardDeck

- (instancetype) init {
    self = [super init];
    
    if (self) {
        for (NSString *shape in [SetCard validShapes]) {
            for (int i = 1; i <= [SetCard maxNumber]; i++) {
                for (NSString *color in [SetCard validColors]) {
                    for (NSString *style in [SetCard validStyles]) {
                        SetCard *card = [[SetCard alloc] init];
                        card.shape = shape;
                        card.number = i;
                        card.color = color;
                        card.style = style;
                        [self addCard:card];
                    }
                    
                }
                
            }
        }
    }
    
    return self;
}

@end
