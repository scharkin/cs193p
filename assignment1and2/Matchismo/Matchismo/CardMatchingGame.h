//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Sergey Charkin on 1/4/15.
//  Copyright (c) 2015 Fun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "PlayingCard.h"

@interface CardMatchingGame : NSObject

// designated initializer
- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck;

- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSInteger score;
@property (nonatomic, readonly) NSString *result;
@property (nonatomic) BOOL extendMatch;

@end
