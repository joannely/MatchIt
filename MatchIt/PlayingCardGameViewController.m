//
//  PlayingCardGameViewController.m
//  MatchIt
//
//  Created by Joanne Wang on 8/26/15.
//  Copyright (c) 2015 Joanne Wang. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@interface PlayingCardGameViewController() 

@end

@implementation PlayingCardGameViewController

- (Deck *)createDeck {
    return [[PlayingCardDeck alloc] init];
}

- (NSAttributedString *)titleForCard:(Card *)card {
    NSMutableAttributedString *toReturn = card.isChosen ? [[NSMutableAttributedString alloc] initWithString:card.contents] : [[NSMutableAttributedString alloc] initWithString:@""];
    PlayingCard *newCard = (PlayingCard *)card;
    if ([newCard.suit isEqualToString:@"♥︎"] || [newCard.suit isEqualToString:@"♦︎"]) {
        [toReturn addAttributes:@{NSForegroundColorAttributeName: [UIColor redColor]} range:NSMakeRange(0,[toReturn length])];
    }
    return toReturn;
}


- (UIImage *)backgroundImageForCard:(Card *)card {
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}

- (NSAttributedString *)getStatusUpdate {
    NSMutableAttributedString *returnValue = [[NSMutableAttributedString alloc] init];
    int count = [self.game.chosenCards count];
    
    if (count) {
        for (Card *card in self.game.chosenCards) {
            [returnValue appendAttributedString:[self titleForCard:card]];
        }
        
        if (count == self.game.matchNumber && ![self.game.chosenCards[0] isMatched]) {
            [returnValue appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@" did not match! %d point penalty. ", self.game.matchScore]]];
            Card *oldCard = self.game.chosenCards[self.game.matchNumber-1];
            self.game.chosenCards = nil;
            [self.game.chosenCards addObject:oldCard];
            [returnValue appendAttributedString:[self titleForCard:oldCard]];
        }
        
        if ([self.game.chosenCards[0] isMatched]) {
            [returnValue appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@" matched for %d points", self.game.matchScore]]];
            self.game.chosenCards = nil;
        } else {
            [returnValue appendAttributedString:[[NSAttributedString alloc] initWithString:@" selected"]];
        }
        return returnValue;
    }
    
    return [[NSAttributedString alloc] initWithString:@""];
}

- (int)getMatchNumber {
    return 2;
}

@end