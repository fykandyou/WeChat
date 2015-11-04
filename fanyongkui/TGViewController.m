//
//  TGViewController.m
//  fanyongkui
//
//  Created by qingyun on 15/11/3.
//  Copyright (c) 2015年 qingyun.com. All rights reserved.
//

#import "TGViewController.h"
#import "TGModel.h"
#import "TGTableViewCell.h"
#import "TGWebDetailViewController.h"
#import "TGSearchResultTableViewController.h"
@interface TGViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchControllerDelegate>

@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) NSMutableArray *datas;

@property(nonatomic,strong) UISearchController *searchController;
@end

@implementation TGViewController
static NSString *identifier = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadDatas];
    
    
    //加载UItableview
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    [self.view addSubview:tableView];
    _tableView = tableView;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    
    
    
    //注册cell(用Nib)
    [_tableView  registerNib:[UINib nibWithNibName:@"TGTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:identifier];
    
    //加载NavigationItem
    UIBarButtonItem *barButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonItemClick:)];
    self.navigationItem.leftBarButtonItem=barButtonItem;
    
    
    UIBarButtonItem *rightBarButtonItem=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(rightBarButtonItem:)];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    
    
    self.navigationItem.title = @"团购";
    //加载ScrollVIew
    [self addHeaderViewForTableView];
    
    //搜索
    
    TGSearchResultTableViewController *searchResult=[[TGSearchResultTableViewController alloc] initWithStyle:UITableViewStylePlain];
    searchResult.datas = _datas;
    
    UISearchController *searchController=[[UISearchController alloc] initWithSearchResultsController:searchResult];
    _searchController = searchController;
    _searchController.hidesBottomBarWhenPushed = YES;
    _searchController.dimsBackgroundDuringPresentation = YES;
    _searchController.hidesNavigationBarDuringPresentation = YES;
    _searchController.delegate = self;
}



-(void)leftBarButtonItemClick:(UIBarButtonItem *)leftBarButtonItem
{
    if ([leftBarButtonItem.title isEqualToString:@"编辑"]) {
        [_tableView setEditing:YES animated:YES];
        leftBarButtonItem.title = @"完成";
    }else{
        _tableView.editing = NO;
        leftBarButtonItem.title = @"编辑";
    }
}

-(void)rightBarButtonItem:(UIBarButtonItem *)righrBarButtonItem
{
    [self presentViewController:_searchController animated:YES completion:nil];
    
}
#pragma mark-加载头视图
-(void)addHeaderViewForTableView
{
    UIScrollView *scrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 375, 200)];
    scrollView.contentSize = CGSizeMake(375 *3, 100);
    scrollView.pagingEnabled = YES;
    
    for (int i = 0; i<3; i++) {
        UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(375 * i, 0, 375, 200)];
        NSString *imageName=[NSString stringWithFormat:@"new_feature_%d",i+1];
        UIImage *image=[UIImage imageNamed:imageName];
        imageView.image = image;
        [scrollView addSubview:imageView];
    }
    
    _tableView.tableHeaderView = scrollView;
    
}

#pragma mark -loadDatas
-(void)loadDatas
{
    NSString *path=[[NSBundle mainBundle] pathForResource:@"tgs" ofType:@"plist"];
    NSArray *array =[NSArray arrayWithContentsOfFile:path];
    
    NSMutableArray *mutableArray = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        TGModel *model = [TGModel tgModelWithDictionary:dict];
        [mutableArray addObject:model];
    }
    _datas =mutableArray;
    
}



#pragma mark -UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TGTableViewCell *cell=[_tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    cell.model = _datas[indexPath.row];
    
    return cell;
}

#pragma mark -UITableViewDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TGWebDetailViewController *webVC=[[TGWebDetailViewController alloc] init];
    webVC.urlString = @"http://www.baidu.com";
    
    [self.navigationController pushViewController:webVC animated:YES];
}

#pragma mark -Edit Delete

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_datas removeObjectAtIndex:indexPath.row];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }
    
}

#pragma mark-Edit Move
-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    TGModel *model = _datas[sourceIndexPath.row];
    
    [_datas removeObjectAtIndex:sourceIndexPath.row];
    
    
    [_datas insertObject:model atIndex:destinationIndexPath.row];

}
@end
