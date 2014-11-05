//
//  TrainingUIViewController.m
//  TrainingUI
//
//  Created by Matías Ginart on 11/5/14.
//  Copyright (c) 2014 MercadoLibre. All rights reserved.
//

#import "TrainingUIViewController.h"
#import "MBProgressHUD.h"

@interface TrainingUIViewController ()
@property (nonatomic, strong) MBProgressHUD *loadingMessage;
@end

@implementation TrainingUIViewController

- (void)showLoadingMessage:(NSString*)text {
    if (!self.loadingMessage) {
        self.loadingMessage = [[MBProgressHUD alloc] initWithView:self.view];
        self.loadingMessage.isAccessibilityElement = YES;
        self.loadingMessage.removeFromSuperViewOnHide = YES;        
        self.loadingMessage.mode = MBProgressHUDModeCustomView;
        [self.loadingMessage show:YES];
    } else {
        [self.loadingMessage show:NO];
    }
    
    [self.view addSubview:self.loadingMessage];
    
    self.loadingMessage.labelText = text;
}

- (void)hideLoadingMessage
{
    self.loadingMessage.delegate = nil;
    //self.loadingMessage.accessibilityLabel = @"Loading halted";
    [self.loadingMessage hide:YES];
}


@end
