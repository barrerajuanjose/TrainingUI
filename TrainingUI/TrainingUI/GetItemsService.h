//
//  GetItemsService.h
//  TrainingUI
//
//  Created by Matías Ginart on 11/5/14.
//  Copyright (c) 2014 MercadoLibre. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GetItemsService;

typedef void (^GetItemsServiceCallback)(GetItemsService *service, NSArray* allItems);

@interface GetItemsService : NSObject

- (void)getItemsWithCallbackBlock:(GetItemsServiceCallback)callbackBlock;

@end
