//
//  DetailViewController.h
//  TrainingUI
//
//  Created by Matías Ginart on 11/4/14.
//  Copyright (c) 2014 MercadoLibre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"
#import "TrainingUIViewController.h"

@interface DetailViewController : TrainingUIViewController

@property (nonatomic, strong) Item* item;

@end
