//
//  RemoveItemService.m
//  TrainingUI
//
//  Created by Matías Ginart on 11/5/14.
//  Copyright (c) 2014 MercadoLibre. All rights reserved.
//

#import "RemoveItemService.h"
#import "ItemManager.h"
#import "AppDelegate.h"
#import "DetailViewController.h"

@interface RemoveItemService ()
@property (nonatomic) BOOL mustDelete;
@end

@implementation RemoveItemService

- (void)removeItem:(Item*)item callbackBlock:(RemoveItemServiceCallback)callbackBlock {
    self.mustDelete = YES;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1.5f * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        if (!self.mustDelete) {
            return;
        }

        [[ItemManager sharedItemManager] removeItem:item];
        if (callbackBlock) {
            callbackBlock(self);
        }

        // Mugre para revisar si no se cancelo el servicio
        AppDelegate* appDelegate = [[UIApplication sharedApplication] delegate];
        if ([[[appDelegate window] rootViewController] isKindOfClass:[UITabBarController class]]) {
            UITabBarController* tabBarController = (UITabBarController*)[[appDelegate window] rootViewController];
            if ([tabBarController.selectedViewController isKindOfClass:[UINavigationController class]]) {
                UINavigationController* navController = (UINavigationController*)tabBarController.selectedViewController;
                if (![[navController.viewControllers lastObject] isKindOfClass:[DetailViewController class]]) {
                    // Hago crashear para que se note el no cancelar
                    NSArray* a = @[];
                    id object = a[0];
                    // Para esconder el warning
                    object = object;
                }
            }
        } else if ([[[appDelegate window] rootViewController] isKindOfClass:[UINavigationController class]]) {
            UINavigationController* navController = (UINavigationController*)[[appDelegate window] rootViewController];
            if (![[navController.viewControllers lastObject] isKindOfClass:[DetailViewController class]]) {
                // Hago crashear para que se note el no cancelar
                NSArray* a = @[];
                id object = a[0];
                // Para esconder el warning
                object = object;
            }
        }

    });
}

- (void)invalidate {
    self.mustDelete = NO;
}

@end
