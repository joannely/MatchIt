//
//  PlayingCard.m
//  MatchIt
//
//  Created by Joanne Wang on 8/14/15.
//  Copyright (c) 2015 Joanne Wang. All rights reserved.
//

#import "PlayingCard.h"

@interface PlayingCard()

@end

@implementation PlayingCard

- (int)match:(NSArray *)otherCards {
    int score = 0;
    
    
    for (PlayingCard *otherCard in otherCards) {
        if ([self.suit isEqualToString:otherCard.suit]) {
            score += 1;
        } else if (self.rank == otherCard.rank) {
            score += 4;
        }
    }
    
    for (int i = 0; i < [otherCards count]; i++) {
        for (int j = (i + 1); j < [otherCards count]; j++) {
            if ([[otherCards[i] suit] isEqualToString:[otherCards[j] suit]]) {
                score += 1;
            } else if ([otherCards[i] rank] == [otherCards[j] rank])
                score += 4;
        }
    }
    return score;
}

- (NSString *)contents {
    return [[PlayingCard validRanks][self.rank] stringByAppendingString:self.suit];
}

+ (NSArray *) validSuits {
    return @[@"♠︎", @"♣︎", @"♥︎", @"♦︎"];
}

+ (NSArray *) validRanks {
    return @[@"?", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+ (NSUInteger) maxRank {
    return [[PlayingCard validRanks] count] - 1;
}


@synthesize suit = _suit;

- (void)setSuit:(NSString *)suit{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString *)suit {
    return _suit ? _suit : @"?";
}


- (void)setRank:(NSUInteger)rank {
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

@end