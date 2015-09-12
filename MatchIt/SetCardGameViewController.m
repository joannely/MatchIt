//
//  SetGameViewController.m
//  MatchIt
//
//  Created by Joanne Wang on 9/7/15.
//  Copyright (c) 2015 Joanne Wang. All rights reserved.
//

#import "SetCardGameViewController.h"
#import "SetCardDeck.h"
#import "SetCard.h"

@interface SetCardGameViewController ()

@end

@implementation SetCardGameViewController

- (Deck *)createDeck {
    return [[SetCardDeck alloc ] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (UIButton *cardButton in super.cardButtons) {
        int cardIndex = [super.cardButtons indexOfObject:cardButton];
        Card *card = [super.game cardAtIndex:cardIndex];
        [cardButton setAttributedTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        
    }
    
   // [self restartButton:nil];
}

- (NSAttributedString *)titleForCard:(Card *)card {
    SetCard *newCard = (SetCard *)card;
    NSString *returnStr = @"";
    UIColor *strColor;
    UIColor *outlineColor;
    
    for(int i = 0; i < newCard.number; i++) {
        returnStr = [returnStr stringByAppendingString:newCard.shape];
    }
    
    if ([newCard.color isEqualToString:@"purple"]) {
        strColor = [UIColor colorWithRed:204/255.0 green:147/255.0 blue:255/255.0 alpha:1];
        outlineColor = [UIColor colorWithRed:152/255.0 green:86/255.0 blue:231/255.0 alpha:1];
    } else if ([newCard.color isEqualToString: @"yellow"]) {
        strColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:102/255.0 alpha:1];
        outlineColor = [UIColor colorWithRed:255/255.0 green:220/255.0 blue:0/255.0 alpha:1];
    } else if ([newCard.color isEqualToString: @"pink"]) {
        strColor = [UIColor colorWithRed:255/255.0 green:168/255.0 blue:211/255.0 alpha:1];
        outlineColor = [UIColor colorWithRed:255/255.0 green:111/255.0 blue:207/255.0 alpha:1];
    }
    
    
    NSAttributedString *returnVal;
    if ([newCard.style isEqualToString:@"solid"]) {
         returnVal = [[NSAttributedString alloc] initWithString:returnStr attributes:@{ NSForegroundColorAttributeName : strColor}];
    }
    else if ([newCard.style isEqualToString:@"outline"]) {
        returnVal = [[NSAttributedString alloc] initWithString:returnStr attributes:@{  NSForegroundColorAttributeName:[UIColor whiteColor], NSStrokeWidthAttributeName : @-10, NSStrokeColorAttributeName : outlineColor}];
    } else if ([newCard.style isEqualToString:@"alpha"]) {
        strColor = [strColor colorWithAlphaComponent:0.4];
         returnVal = [[NSAttributedString alloc] initWithString:returnStr attributes:@{ NSStrokeWidthAttributeName : @-3, NSStrokeColorAttributeName : outlineColor, NSForegroundColorAttributeName: strColor}];
    }
    

    return returnVal;
    
    
}


/*
- (IBAction)restartButton:(UIButton *)sender {
    for (UIButton *cardButton in super.cardButtons) {
        [cardButton setAttributedTitle:[[NSAttributedString alloc] initWithString:@""] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[UIImage imageNamed:@"cardfront"] forState:UIControlStateNormal];
        cardButton.enabled = YES;
    }
    
    self.game = nil;
    
    [self createDeck];
    
    
    [self.statusLabel setAttributedText:[self getStatusUpdate]];
    for (UIButton *cardButton in super.cardButtons) {
        int cardIndex = [super.cardButtons indexOfObject:cardButton];
        Card *card = [super.game cardAtIndex:cardIndex];
        [cardButton setAttributedTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score : %d", self.game.score];
    
    self.statusLabel.text = @"Select card to start";
    self.statusLabel.textColor = [UIColor blackColor];

    
}
 */


- (UIImage *)backgroundImageForCard:(Card *)card {
    if (card.isChosen && !card.isMatched) {
        return [UIImage imageNamed:@"cardfrontselected"];
    } else {
        return [UIImage imageNamed:@"cardfront"];
    }
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
            [returnValue appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@" matched for %d points ", self.game.matchScore]]];
            self.game.chosenCards = nil;
        } else {
            [returnValue appendAttributedString:[[NSAttributedString alloc] initWithString:@" selected"]];
        }
        return returnValue;
    }
    
    return [[NSAttributedString alloc] initWithString:@""];
}

- (int)getMatchNumber {
    return 3;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
