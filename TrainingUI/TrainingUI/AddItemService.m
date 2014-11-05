//
//  AddItemService.m
//  TrainingUI
//
//  Created by Matías Ginart on 11/5/14.
//  Copyright (c) 2014 MercadoLibre. All rights reserved.
//

#import "AddItemService.h"
#import "ItemManager.h"

@implementation AddItemService

- (void)addItem:(Item*)item callbackBlock:(AddItemServiceCallback)callbackBlock {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1.5f * NSEC_PER_SEC), dispatch_get_main_queue(), ^{

        [[ItemManager sharedItemManager] addItem:item];
        if (callbackBlock) {
            callbackBlock(self, item);
        }

    });
}

@end
