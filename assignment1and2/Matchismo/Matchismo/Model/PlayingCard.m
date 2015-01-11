//
//  PlayingCard.m
//  Matchismo
//
//  Created by Sergey Charkin on 1/3/15.
//  Copyright (c) 2015 Fun. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (int)match:(NSArray *)otherCards {
    int score = 0;
    if ([otherCards count] == 1) {
        PlayingCard *otherCard = [otherCards firstObject];
        if (otherCard.rank == self.rank) {
            score = 12;
        } else if ([otherCard.suit isEqualToString:self.suit]) {
            score = 3;
        }
    } else if ([otherCards count] > 1) {
        PlayingCard *secondCard = [otherCards firstObject];
        PlayingCard *thirdCard = otherCards[1];
        if (secondCard.rank == self.rank && thirdCard.rank == self.rank) {
            score = 300;
        } else if ([secondCard.suit isEqualToString:self.suit] && [thirdCard.suit isEqualToString:self.suit]) {
            score = 14;
        } else if (secondCard.rank == self.rank || thirdCard.rank == self.rank) {
            score = 4;
        } else if ([secondCard.suit isEqualToString:self.suit] || [thirdCard.suit isEqualToString:self.suit]) {
            score = 1;
        }
        NSLog(@"%@ %@ %@ score %d", self.contents, secondCard.contents, thirdCard.contents, score);
    }
    return score;
}

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
