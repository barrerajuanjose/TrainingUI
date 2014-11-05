//
//  TextInputViewController.m
//  TrainingUI
//
//  Created by Matías Ginart on 11/4/14.
//  Copyright (c) 2014 MercadoLibre. All rights reserved.
//

#import "TextInputViewController.h"
#import "AddItemService.h"

@interface TextInputViewController()

@property (nonatomic, weak) IBOutlet UITextField* titleTextField;
@property (nonatomic, weak) IBOutlet UITextField* descriptionTextField;
@property (nonatomic, weak) IBOutlet UITextField* imageTextField;

- (IBAction)addPressed;

@end

@implementation TextInputViewController

- (BOOL)valuesAreValid {
    return self.titleTextField.text.length > 0 && self.descriptionTextField.text.length > 0;
}

- (Item*)getItemFromValues {
    Item* anItem = [[Item alloc] init];
    anItem.title = self.titleTextField.text;
    anItem.itemDescription = self.descriptionTextField.text;
    anItem.imageName = self.imageTextField.text;
    return anItem;
}

- (IBAction)addPressed {
    if ([self valuesAreValid]) {
        [self showLoadingMessage:@"Cargando"];

        AddItemService* service = [[AddItemService alloc] init];
        [service addItem:[self getItemFromValues] callbackBlock:^(AddItemService *service, Item *item) {
            [self hideLoadingMessage];
        }];

    } else {
        [[[UIAlertView alloc] initWithTitle:nil message:@"Por favor ingrese todos los datosI" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
    }
}



@end
