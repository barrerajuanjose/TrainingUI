//
//  ItemManager.h
//  TrainingUI
//
//  Created by Matías Ginart on 11/4/14.
//  Copyright (c) 2014 MercadoLibre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"

@interface ItemManager : NSObject

// Singleton instance
+ (instancetype)sharedItemManager;

// Add new item. If it was already added, don't do anything
- (void)addItem:(Item*)item;

// Remove item
- (void)removeItem:(Item*)item;

// Return items with a search text
- (NSArray*)itemsWithSearchInput:(NSString*)text;

- (NSArray*)getItems;

@end
