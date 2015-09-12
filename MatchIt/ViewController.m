//
//  ViewController.m
//  MatchIt
//
//  Created by Joanne Wang on 8/14/15.
//  Copyright (c) 2015 Joanne Wang. All rights reserved.
//

#import "ViewController.h"
#import "CardMatchingGame.h"
#import "GameHistoryViewController.h"

@interface ViewController ()

@property (strong, nonatomic, readwrite) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic, readwrite) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic, readwrite) IBOutlet UILabel *statusLabel;
@property (strong, nonatomic) NSMutableArray *progress;

@end

@implementation ViewController

- (CardMatchingGame *)game {
    if (!_game) {
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
        _game.matchNumber = [self getMatchNumber];
    }
    return _game;
}

// abstract superclass, need 'concrete' superclass to make it work
- (Deck *)createDeck { // abstract
    return nil;
}

- (NSMutableArray *)progress {
    if (!_progress) _progress = [[NSMutableArray alloc] init];
    return _progress;
}

- (int)getMatchNumber {
    return 0;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"Show History"]) {
        if ([segue.destinationViewController isKindOfClass:[GameHistoryViewController class]]) {
            GameHistoryViewController *ghvc = (GameHistoryViewController *)segue.destinationViewController;
            ghvc.historyContent = self.progress;
        }
    }
}

/*- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 if ([segue.identifier isEqualToString:@"Analyze Text"]) {
 if ([segue.destinationViewController isKindOfClass:[TextStatsViewController class]]) {
 TextStatsViewController *tsvc = (TextStatsViewController *)segue.destinationViewController;
 tsvc.textToAnalyze = self.body.textStorage;
 }
 }
 }
 */

- (IBAction)touchCardButton:(UIButton *)sender {
    int cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
}

- (IBAction)restartButton:(UIButton *)sender {
    self.game = nil;
    [self updateUI];
    self.progress = nil;
    self.statusLabel.text = @"Select card to start";
}


- (void) updateUI {
    [self.progress addObject:[self getStatusUpdate]];
    [self.statusLabel setAttributedText:self.progress[[self.progress count]-1]];
    for (UIButton *cardButton in self.cardButtons) {
        int cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        [cardButton setAttributedTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score : %d", self.game.score];
}

- (NSAttributedString *)getStatusUpdate {
    return nil;
}

/*

- (IBAction)changeProgressSlider:(id)sender {
    UISlider *slider = (UISlider *)sender;
    float marker = 1.0 / (float)[self.progress count];
    int index = slider.value / marker;
    if (index > ([self.progress count] - 1) || index == ([self.progress count] - 1)) {
        self.statusLabel.text = self.progress[[self.progress count] - 1];
        self.statusLabel.alpha = 1;
        self.statusLabel.textColor = [UIColor blackColor];
    } else {
        self.statusLabel.text = self.progress[index];
        self.statusLabel.alpha = 0.7;
        self.statusLabel.textColor = [UIColor darkGrayColor];
    }

}
 */


- (NSAttributedString *)titleForCard:(Card *)card {
    return nil;
}

- (UIImage *)backgroundImageForCard:(Card *)card {
    return nil;
}


@end
