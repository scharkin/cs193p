//
//  PlayingCard.m
//  Matchismo
//
//  Created by Sergey Charkin on 1/3/15.
//  Copyright (c) 2015 Fun. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (NSString *)contents {
    return [[PlayingCard rankStrings][self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit; // as we made getter and setter

+ (NSArray *)validSuits {
    return @[@"♠️", @"♣️", @"♥️", @"♦️"];
}

- (void)setSuit:(NSString *)suit{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString *)suit{
    return _suit ? _suit : @"?";
}

+ (NSArray *)rankStrings {
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+ (NSInteger)maxRank { return [[self rankStrings] count] - 1; }

- (void)setRank:(NSInteger)rank {
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

@end
