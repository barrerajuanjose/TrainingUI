//
//  CustomCellTableViewCell.h
//  TrainingUI
//
//  Created by Juan José Barrera on 11/12/14.
//  Copyright (c) 2014 MercadoLibre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"

@interface CustomCellTableViewCell : UITableViewCell

-(void) changeItem:(Item *) item;

-(CGFloat) height;

@end
