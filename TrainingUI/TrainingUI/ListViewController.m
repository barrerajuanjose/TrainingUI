//
//  ListViewController.m
//  TrainingUI
//
//  Created by Matías Ginart on 11/4/14.
//  Copyright (c) 2014 MercadoLibre. All rights reserved.
//

#import "ListViewController.h"
#import "GetItemsService.h"
#import "Item.h"
#import "DetailViewController.h"
#import "CustomCellTableViewCell.h"

#define kCellKey @"CellKey"

@interface ListViewController() <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSArray* itemsToShow;
@property (nonatomic, weak) IBOutlet UITableView* tableView;
@property (nonatomic, strong) CustomCellTableViewCell *prototypeCell;
@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UINib *cellNib = [UINib nibWithNibName:@"CustomCellTableViewCell" bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:kCellKey];
    
    [self reloadItems];
}

-(void) viewWillAppear:(BOOL)animated {
    [self reloadItems];
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *) indexPath {
    Item *item = self.itemsToShow[indexPath.row];
    
    if( self.prototypeCell == nil ) {
        self.prototypeCell = [[NSBundle mainBundle] loadNibNamed:@"CustomCellTableViewCell" owner:nil options:nil][0];
    }
    
    [self.prototypeCell changeItem: item];
    
    return [self.prototypeCell height];
}

-(CGFloat) tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 10000.f;
}

#pragma mark - UITableView

- (void) reloadItems {
    [self showLoadingMessage:@"Cargando"];
    GetItemsService* getItemsService = [[GetItemsService alloc] init];
    [getItemsService getItemsWithCallbackBlock:^(GetItemsService *service, NSArray *allItems) {
        [self hideLoadingMessage];
        self.itemsToShow = allItems;
        [self.tableView reloadData];
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.itemsToShow.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellKey];
    
    Item *item = self.itemsToShow[indexPath.row];
    
    [cell changeItem: item];

    return cell;
}


-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Item *item = self.itemsToShow[indexPath.row];
    
    DetailViewController *detailViewController = [[DetailViewController alloc] initWithNibName:nil bundle:nil];
    
    detailViewController.item = item;
    
    [self.navigationController pushViewController:detailViewController animated:YES];
}

@end
