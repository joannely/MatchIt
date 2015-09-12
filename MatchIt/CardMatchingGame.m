//
//  CardMatchingGame.m
//  MatchIt
//
//  Created by Joanne Wang on 8/16/15.
//  Copyright (c) 2015 Joanne Wang. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards;
@property (nonatomic, readwrite) int matchScore;

@end



@implementation CardMatchingGame

-(NSMutableArray *)cards {
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

-(NSMutableArray *)chosenCards {
    if (!_chosenCards) _chosenCards = [[NSMutableArray alloc] init];
    return _chosenCards;
}

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck {
    self = [super init];
    
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    return self;
}

- (void)addToChosenCards:(Card *)card {
    if (card) {
        [self.chosenCards addObject:card];
    }
}

#define MISMATCH_PENALTY 2
#define MATCH_BONUS 4
#define COST_TO_CHOOSE 1


- (void)chooseCardAtIndex:(NSUInteger)index {
    Card *card = [self cardAtIndex:index];
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
            [self.chosenCards removeObject:card];
        } else {
            [self addToChosenCards:card];
            NSMutableArray *otherCards = [[NSMutableArray alloc] init];
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    [otherCards addObject:otherCard];
                }
            }
            if ([otherCards count] == (self.matchNumber - 1)) {
                [self matchCards:otherCards withCard:card];
            }
            
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}


/// chosen/not chosen???????????

- (void)matchCards:(NSMutableArray *)cards withCard:(Card *)card {
    self.matchScore = [card match:cards];
     if (self.matchScore) {
         self.matchScore *= MATCH_BONUS;
         self.score += self.matchScore;
         card.matched = YES;
         for (Card *card in cards) {
             card.matched = YES;
         }
     } else {
         self.score -= MISMATCH_PENALTY;
         self.matchScore -= MISMATCH_PENALTY;
         for (Card *card in cards) {
             card.chosen = NO;
         }
     }
}



- (Card *)cardAtIndex:(NSUInteger)index {
    return (index < [self.cards count]) ? self.cards[index] : nil;
}















@end