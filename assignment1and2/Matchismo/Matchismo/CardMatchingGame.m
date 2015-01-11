//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Sergey Charkin on 1/4/15.
//  Copyright (c) 2015 Fun. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic,readwrite) NSInteger score;
@property (nonatomic,readwrite) NSString *result;
@property (nonatomic) NSMutableArray *cards; // of Card
@end

@implementation CardMatchingGame

- (NSMutableArray *)cards {
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck {
    self = [super init];
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    return self;
}

- (Card *)cardAtIndex:(NSUInteger)index {
    return index < [self.cards count] ? self.cards[index] : nil;
}

//static const int MATCH_BONUS = 4;
static const int MISMATCH_PENALTY = 2; //6
static const int COST_TO_CHOOSE = 1; //3

- (void)chooseCardAtIndex:(NSUInteger)index {
    Card *card = [self cardAtIndex:index];
    if (!card.isMatched) {
        self.result = card.contents;
        if (card.isChosen) {
            card.chosen = NO;
        } else { //match against other chosen cards
//            NSLog(@"%@", card.contents);
            NSMutableArray *chosenCards = [[NSMutableArray alloc] init];
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    [chosenCards addObject:otherCard];
//                    NSLog(@"%@ chosenCards.count %d", otherCard.contents, chosenCards.count);
                    if (!self.extendMatch) break; // can choose 2 card only now
                }
            }
            int numOfChosenCards = [chosenCards count];
            if ((!self.extendMatch && numOfChosenCards == 1) ||
                (self.extendMatch && numOfChosenCards > 1)) {
                int matchScore = [card match:chosenCards];
                if (matchScore) {
                    int scored = matchScore; // * MATCH_BONUS;
                    self.score += scored;
                    for (Card *chosenCard in chosenCards) {
                        chosenCard.matched = YES;
                    }
                    card.matched = YES;
                    self.result = self.extendMatch ? [NSString stringWithFormat:@"Matched %@ %@ %@ for %d points", card.contents, ((Card*)chosenCards[0]).contents, ((Card*)chosenCards[1]).contents, scored] : [NSString stringWithFormat:@"Matched %@ %@ for %d points", card.contents, ((Card*)chosenCards[0]).contents, scored];
                } else {
                    self.score -= MISMATCH_PENALTY;
                    for (Card *chosenCard in chosenCards) {
                        chosenCard.chosen = NO;
//                        NSLog(@"unchoose %@", chosenCard.contents);
                    }
                    self.result = self.extendMatch ? [NSString stringWithFormat:@"%@ %@ %@ don’t match! %d point penalty!", card.contents, ((Card*)chosenCards[0]).contents, ((Card*)chosenCards[1]).contents, MISMATCH_PENALTY] : [NSString stringWithFormat:@"%@ %@ don’t match! %d point penalty!", card.contents, ((Card*)chosenCards[0]).contents, MISMATCH_PENALTY];
                }
            } else if (self.extendMatch && numOfChosenCards == 1) {
                self.result = [NSString stringWithFormat:@"%@ %@", card.contents, ((Card*)chosenCards[0]).contents];
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
//            NSLog(@"extendMatch %d score %d", self.extendMatch, self.score);
        }
    }
}

@end
