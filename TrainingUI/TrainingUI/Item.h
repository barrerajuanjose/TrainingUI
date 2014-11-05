//
//  Item.h
//  TrainingUI
//
//  Created by Matías Ginart on 11/4/14.
//  Copyright (c) 2014 MercadoLibre. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject

@property (nonatomic, copy) NSString* identifier;
@property (nonatomic, copy) NSString* title;
@property (nonatomic, copy) NSString* itemDescription;
@property (nonatomic, copy) NSString* imageName;

// Returns YES if some of the properties contains the variable text
- (BOOL)hasMatchWithText:(NSString*)text;

@end
