//
//  Item.m
//  TrainingUI
//
//  Created by Matías Ginart on 11/4/14.
//  Copyright (c) 2014 MercadoLibre. All rights reserved.
//

#import "Item.h"

@implementation Item

#pragma mark - Methods

- (BOOL)hasMatchWithText:(NSString*)text {
    return [self.title containsString:text] || [self.itemDescription containsString:text];
}

#pragma mark - Equal

- (BOOL)isEqual:(id)object {
    if ([object isKindOfClass:[Item class]]) {
        Item* anotherItem = (Item*)object;
        return [anotherItem.identifier isEqualToString:self.identifier];
    } else {
        return NO;
    }
}

@end
