//
//  ContactsHeaderView.h
//  fanyongkui
//
//  Created by qingyun on 15/11/4.
//  Copyright (c) 2015年 qingyun.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ContactFriendGroup;
@interface ContactsHeaderView : UITableViewHeaderFooterView

@property(nonatomic,strong) ContactFriendGroup *friendGroup;

@property(nonatomic,strong) void (^headerViewClick)(void);

+(instancetype)headerViewWithTableView:(UITableView *)tableView;


@end
