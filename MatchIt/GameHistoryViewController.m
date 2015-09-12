//
//  GameHistoryViewController.m
//  MatchIt
//
//  Created by Joanne Wang on 9/10/15.
//  Copyright (c) 2015 Joanne Wang. All rights reserved.
//

#import "GameHistoryViewController.h"

@interface GameHistoryViewController ()


@property (weak, nonatomic) IBOutlet UITextView *historyTextView;

@end

@implementation GameHistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateUI];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)updateUI {
    for (NSAttributedString *content in self.historyContent) {
            NSMutableAttributedString *toDisplay = [[NSMutableAttributedString alloc] initWithString:@"• "];
            [toDisplay appendAttributedString:content];
            [toDisplay appendAttributedString:[[NSAttributedString alloc] initWithString: @"\n"]];
            [toDisplay appendAttributedString:self.historyTextView.attributedText];
            [self.historyTextView setAttributedText:toDisplay];
    }
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
