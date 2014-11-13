//
//  ItemManager.m
//  TrainingUI
//
//  Created by Matías Ginart on 11/4/14.
//  Copyright (c) 2014 MercadoLibre. All rights reserved.
//

#import "ItemManager.h"

@interface ItemManager()
@property (nonatomic, strong) NSMutableArray* items;
@end

@implementation ItemManager

#pragma mark - Initialice

+ (instancetype)sharedItemManager {
    static dispatch_once_t once;
    static ItemManager* sharedInstance;

    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });

    return sharedInstance;
}

- (id)init {
    self = [super init];
    if (self) {
        self.items = [NSMutableArray array];

        for (NSInteger index = 1; index < 11; index++) {
            Item* anItem = [[Item alloc] init];

            if (index % 2 == 0) {
                
                anItem.title = @"Este titulo es muy largo Este titulo es muy largo Este titulo es muy largo Este titulo es muy largo Este titulo es muy largo Este titulo es muy largo Este titulo es muy largo v Este titulo es muy largo ";
                anItem.itemDescription = @"jkjgjhg gh jg jggh jghdsfgfdgghg fghdfghfg hfgdhf dghfgdh gfdhdfg hdfhdg gh dfhdfg hdf hdf hdgh fgd";
                anItem.imageName = @"ItemImage1";
                
            } else {
                
                anItem.title = [NSString stringWithFormat:@"Titulo %ld", (long)index];
                anItem.itemDescription = [NSString stringWithFormat:@"Descripcion %ld", (long)index];
                anItem.imageName = @"ItemImage2";
                
            }
            [self.items addObject:anItem];
        }
    }
    return self;
}

#pragma mark - Methods

// Add new item
- (void)addItem:(Item*)item {
    if ([self.items indexOfObject:item] == NSNotFound) {
        [self.items addObject:item];
    }
}

// Remove item
- (void)removeItem:(Item*)item {
    [self.items removeObject:item];
}

- (NSArray*)itemsWithSearchInput:(NSString*)text {
    NSMutableArray* mutableArray = [NSMutableArray array];

    for (Item* anItem in self.items) {
        if ([anItem hasMatchWithText:text]) {
            [mutableArray addObject:anItem];
        }
    }

    return [NSArray arrayWithArray:mutableArray];
}

- (NSArray*)getItems {
    return [self.items copy];
}

@end
