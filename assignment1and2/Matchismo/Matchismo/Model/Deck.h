//
//  Deck.h
//  Matchismo
//
//  Created by Sergey Charkin on 1/3/15.
//  Copyright (c) 2015 Fun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;

@end
