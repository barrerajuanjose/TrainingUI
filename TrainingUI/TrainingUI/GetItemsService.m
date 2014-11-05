//
//  GetItemsService.m
//  TrainingUI
//
//  Created by Matías Ginart on 11/5/14.
//  Copyright (c) 2014 MercadoLibre. All rights reserved.
//

#import "GetItemsService.h"
#import "ItemManager.h"

@implementation GetItemsService

- (void)getItemsWithCallbackBlock:(GetItemsServiceCallback)callbackBlock {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1.5f * NSEC_PER_SEC), dispatch_get_main_queue(), ^{

        if (callbackBlock) {
            callbackBlock(self, [[ItemManager sharedItemManager] getItems]);
        }
        
    });
}

@end
