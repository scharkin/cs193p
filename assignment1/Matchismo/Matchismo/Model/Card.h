//
//  Card.h
//  Matchismo
//
//  Created by Sergey Charkin on 1/3/15.
//  Copyright (c) 2015 Fun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;
@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;

- (int)match:(NSArray *)otherCards;

@end
