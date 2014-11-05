//
//  ListViewController.m
//  TrainingUI
//
//  Created by Matías Ginart on 11/4/14.
//  Copyright (c) 2014 MercadoLibre. All rights reserved.
//

#import "ListViewController.h"
#import "GetItemsService.h"

#define kCellKey @"CellKey"

@interface ListViewController() <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSArray* itemsToShow;
@property (nonatomic, weak) IBOutlet UITableView* tableView;
@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self showLoadingMessage:@"Cargando"];
    GetItemsService* getItemsService = [[GetItemsService alloc] init];
    [getItemsService getItemsWithCallbackBlock:^(GetItemsService *service, NSArray *allItems) {
        [self hideLoadingMessage];
        self.itemsToShow = allItems;
        [self.tableView reloadData];
    }];
}

#pragma mark - UITableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.itemsToShow.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:kCellKey];

    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellKey];
    }
    cell.textLabel.text = [self.itemsToShow[indexPath.row] title];

    return cell;
}

@end
