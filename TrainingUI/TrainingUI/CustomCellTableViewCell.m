//
//  CustomCellTableViewCell.m
//  TrainingUI
//
//  Created by Juan José Barrera on 11/12/14.
//  Copyright (c) 2014 MercadoLibre. All rights reserved.
//

#import "CustomCellTableViewCell.h"

@interface CustomCellTableViewCell()

@property (nonatomic, strong) IBOutlet UILabel *titleItem;
@property (nonatomic, strong) IBOutlet UIImageView *imageItem;

@end

@implementation CustomCellTableViewCell

-(void) changeItem:(Item *) item {
    self.titleItem.text = item.title;
    self.imageItem.image = [UIImage imageNamed:item.imageName];
}

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(CGFloat) height{
    
    return [self.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height + 1;
}

@end
