//
//  SetCard.h
//  MatchIt
//
//  Created by Joanne Wang on 9/7/15.
//  Copyright (c) 2015 Joanne Wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface SetCard : Card

@property (nonatomic, strong) NSString *shape;
@property (nonatomic) NSUInteger number;
@property (nonatomic, strong) NSString *color;
@property (nonatomic, strong) NSString *style;

+ (NSArray *) validShapes;
+ (NSUInteger) maxNumber;
+ (NSArray *) validColors;
+ (NSArray *) validStyles;
+ (NSUInteger) maxStyles;

@end
