//
//  SetCard.m
//  MatchIt
//
//  Created by John Lu on 8/30/15.
//  Copyright (c) 2015 Joanne Wang. All rights reserved.
//

#import "SetCard.h"

@interface SetCard()

@end

@implementation SetCard

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.contents = nil;
    }
    
    return self;
}

- (int)match:(NSArray *)otherCards {
    int score = 0;
    
    NSMutableArray *validShapes = [[NSMutableArray alloc] initWithArray:[SetCard validShapes]];
    NSMutableArray *validNumbers = [[NSMutableArray alloc] initWithArray:[SetCard validNumbers]];
    NSMutableArray *validColors = [[NSMutableArray alloc] initWithArray:[SetCard validColors]];
    NSMutableArray *validStyles = [[NSMutableArray alloc] initWithArray:[SetCard validStyles]];
    
    SetCard *card1 = otherCards[0];
    SetCard *card2 = otherCards[1];
    
    if (self.number == card1.number) {
        if (self.number != card2.number) return score;
    } else {
        [validNumbers removeObject:[NSString stringWithFormat:@"%d", self.number]];
        [validNumbers removeObject:[NSString stringWithFormat:@"%d", card1.number]];
        if (![validNumbers containsObject:[NSString stringWithFormat:@"%d", card2.number]]) return score;
    }
    
    if ([self.shape isEqualToString:card1.shape]) {
        if (![self.shape isEqualToString:card2.shape]) return score;
    } else {
        [validShapes removeObject:self.shape];
        [validShapes removeObject:card1.shape];
        if (![validNumbers containsObject:card2.shape]) return score;
    }
    
    if ([self.color isEqualToString:card1.color]) {
        if (![self.color isEqualToString:card2.color]) return score;
    } else {
        [validColors removeObject:self.color];
        [validColors removeObject:card1.color];
        if (![validColors containsObject:card2.color]) return score;
    }
    
    if ([self.style isEqualToString:card1.style]) {
        if (![self.style isEqualToString:card2.style]) return score;
    } else {
        [validStyles removeObject:self.style];
        [validStyles removeObject:card1.style];
        if (![validStyles containsObject:card2.style]) return score;
    }
     
    
    return score += 4;
}

@synthesize shape = _shape;

- (void)setSuit:(NSString *)shape {
    if ([[SetCard validShapes] containsObject:shape]) {
        _shape = shape;
    }
    
}

- (NSString *)shape {
    return _shape ? _shape : @"?";
}

- (void)setNumber:(NSUInteger)number {
    if (number <= [SetCard maxNumber]) {
        _number = number;
    }
}

@synthesize  color = _color;

- (void)setColor:(NSString *)color {
    if ([[SetCard validColors] containsObject:color]) {
        _color = color;
    }
}

- (NSString *)color {
    return _color ? _color : @"?";
}

@synthesize style = _style;

- (void)setStyle:(NSString *)style {
    if ([[SetCard validStyles] containsObject:style]) {
        _style = style;
    }
}

- (NSString *)style {
    return _style ? _style : @"?";
}

+ (NSArray *)validShapes {
    return @[@"▲", @"●", @"■"];
}

+ (NSArray *)validNumbers {
    return @[@"1", @"2", @"3"];
}

+ (NSUInteger)maxNumber {
    return [[SetCard validNumbers] count];
}


+ (NSArray *)validColors {
    return @[@"pink", @"yellow", @"purple"];
}

+ (NSArray *)validStyles {
    return @[@"solid", @"outline", @"alpha"];
}

+ (NSUInteger)maxStyles {
    return [[SetCard validStyles] count];
}


@end
