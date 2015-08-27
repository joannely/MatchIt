//
//  Card.h
//  MatchIt
//
//  Created by Joanne Wang on 8/14/15.
//  Copyright (c) 2015 Joanne Wang. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;

@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;
// @property (nonatomic, getter=latestMatch) BOOL latestMatch;

- (int)match:(NSArray *) otherCards;

@end