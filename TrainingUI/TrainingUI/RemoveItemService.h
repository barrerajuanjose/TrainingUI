//
//  RemoveItemService.h
//  TrainingUI
//
//  Created by Matías Ginart on 11/5/14.
//  Copyright (c) 2014 MercadoLibre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"

@class RemoveItemService;

typedef void (^RemoveItemServiceCallback)(RemoveItemService *service);

@interface RemoveItemService : NSObject

- (void)removeItem:(Item*)item callbackBlock:(RemoveItemServiceCallback)callbackBlock;

- (void)invalidate;

@end
