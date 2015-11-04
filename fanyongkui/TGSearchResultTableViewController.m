
//
//  TGSearchResultTableViewController.m
//  fanyongkui
//
//  Created by qingyun on 15/11/4.
//  Copyright (c) 2015年 qingyun.com. All rights reserved.
//

#import "TGSearchResultTableViewController.h"
#import "TGTableViewCell.h"
#import "TGModel.h"
@interface TGSearchResultTableViewController ()<UISearchResultsUpdating>
@property(nonatomic,strong) NSArray *results;

@end

@implementation TGSearchResultTableViewController

static NSString *identifier=@"cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //注册
    [self.tableView  registerNib:[UINib nibWithNibName:@"TGTabViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:identifier];
    
    self.tableView.rowHeight = 100;
     

}


#pragma mark-UISearchResultsUpdating
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    NSString *filterString = searchController.searchBar.text;
    
    if (filterString.length == 0) {
        _results = _datas;
    }else{
    NSPredicate *predicate=[NSPredicate predicateWithFormat:@"SELF.title CONTAINS[CD] %@",filterString];
    
    _results = [self.datas filteredArrayUsingPredicate:predicate];
    }
    
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _results.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
   TGTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    TGModel *model = _results[indexPath.row];
    
    cell.model = model;
    
    
    return cell;
}


@end
