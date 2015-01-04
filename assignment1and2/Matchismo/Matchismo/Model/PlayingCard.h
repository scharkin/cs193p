//
//  PlayingCard.h
//  Matchismo
//
//  Created by Sergey Charkin on 1/3/15.
//  Copyright (c) 2015 Fun. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong,nonatomic) NSString *suit;
@property (nonatomic) NSInteger rank;

+ (NSArray *)validSuits;
+ (NSInteger)maxRank;

@end
