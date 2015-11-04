//
//  ContactsTableViewController.m
//  fanyongkui
//
//  Created by qingyun on 15/11/4.
//  Copyright (c) 2015年 qingyun.com. All rights reserved.
//

#import "ContactsTableViewController.h"
#import "ContactFriendGroup.h"
#import "ContactFriend.h"
#import "ContactsHeaderView.h"
@interface ContactsTableViewController ()

@property(nonatomic,strong)NSArray *friendsGroups;

@end

@implementation ContactsTableViewController

static NSString *identifier =@"Contactscell";

-(void)loadFriendsGroups
{
    if (_friendsGroups == nil) {
        NSString *path =[[NSBundle mainBundle] pathForResource:@"friends" ofType:@"plist"];
        NSArray *array =[NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *mutableArray=[NSMutableArray array];
        for (NSDictionary *dict in array) {
            ContactFriendGroup *friendGroups = [ContactFriendGroup friendGroupModel:dict];
            
            [mutableArray addObject:friendGroups];
        }
        _friendsGroups =mutableArray;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self loadFriendsGroups];
    
    self.navigationItem.title =@"通讯录";
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.friendsGroups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    ContactFriendGroup *friendGroup=self.friendsGroups[section];
    if (friendGroup.isOpen) {
       ContactFriendGroup *friendsGroup =_friendsGroups[section];
       NSArray *friends =friendsGroup.friends;
        
       return friends.count;
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier ];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
   
    ContactFriendGroup *friendGroups= self.friendsGroups[indexPath.section];
    ContactFriend *friends =friendGroups.friends[indexPath.row];
    
    cell.imageView.image =[UIImage imageNamed:friends.icon];
    cell.textLabel.text =friends.name;
    cell.detailTextLabel.text =friends.status;
    cell.textLabel.textColor= friends.vip?[UIColor redColor]:[UIColor blackColor];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    ContactsHeaderView *headerView=[ContactsHeaderView headerViewWithTableView:tableView];
    
    headerView.friendGroup=self.friendsGroups[section];
    headerView.headerViewClick = ^(){
        [tableView reloadData];
    };
    
    
    
    return headerView;
}

@end
