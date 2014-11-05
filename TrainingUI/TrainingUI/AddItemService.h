//
//  AddItemService.h
//  TrainingUI
//
//  Created by Matías Ginart on 11/5/14.
//  Copyright (c) 2014 MercadoLibre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"

@class AddItemService;

typedef void (^AddItemServiceCallback)(AddItemService *service, Item* item);

@interface AddItemService : NSObject

- (void)addItem:(Item*)item callbackBlock:(AddItemServiceCallback)callbackBlock;

@end
