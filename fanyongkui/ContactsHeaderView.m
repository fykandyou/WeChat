//
//  ContactsHeaderView.m
//  fanyongkui
//
//  Created by qingyun on 15/11/4.
//  Copyright (c) 2015年 qingyun.com. All rights reserved.
//

#import "ContactsHeaderView.h"
#import "ContactFriendGroup.h"
@interface ContactsHeaderView()
@property(nonatomic,strong)UIButton *button;
@property(nonatomic,strong)UILabel *label;

@end
@implementation ContactsHeaderView

static NSString *headerViewIdentifier = @"headerView";

+(instancetype)headerViewWithTableView:(UITableView *)tableView
{
    ContactsHeaderView *headerView =[tableView dequeueReusableCellWithIdentifier:headerViewIdentifier];
    if (headerView == nil) {
        headerView = [[ContactsHeaderView alloc] initWithReuseIdentifier:headerViewIdentifier];
        
    }
    return headerView;
}

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if ( self = [super initWithReuseIdentifier:reuseIdentifier]) {
        //设置button

        UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:button];
        
        //button背景
        UIImage *imageName = [[UIImage imageNamed:@"buddy_header_bg"] resizableImageWithCapInsets:UIEdgeInsetsMake(44, 0,44, 1) resizingMode:UIImageResizingModeStretch];
        UIImage *image=[[UIImage imageNamed:@"buddy_header_bg_highlighted"] resizableImageWithCapInsets:UIEdgeInsetsMake(44, 0, 44, 1) resizingMode:UIImageResizingModeStretch];
        
        [button setBackgroundImage:imageName  forState:UIControlStateNormal];
        [button setBackgroundImage: image forState:UIControlStateHighlighted];

        //button偏移
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        //button内容的偏移量
        button.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        //button的image偏移量
       // button.imageEdgeInsets = UIEdgeInsetsMake(0, 1, 0, 0);
        //button的title偏移量
        button.titleEdgeInsets= UIEdgeInsetsMake(0, 10, 0, 0);
        
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

        [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"buddy_header_arrow"]] forState:UIControlStateNormal];
        //内容模式
        button.imageView.contentMode =   UIViewContentModeCenter;
        button.imageView.clipsToBounds = NO;
        
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];

        //设置label
        UILabel *label=[[UILabel alloc] init];
       
        label.textAlignment =NSTextAlignmentRight ;
        [self.contentView addSubview:label];
        
        _button =button;
        _label=label;
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    
    _button.frame =self.bounds;
    
    //设置label的frame
    CGFloat labelW = 100;
    CGFloat labelH = self.bounds.size.height;
    CGFloat labelX = self.bounds.size.width - labelW - 10;
    CGFloat labelY = 0;
    
    _label.frame = CGRectMake(labelX, labelY, labelW, labelH);
    
    
}

-(void)setFriendGroup:(ContactFriendGroup *)friendGroup
{
    _friendGroup = friendGroup;
    
    [_button setTitle:_friendGroup.name forState:UIControlStateNormal];
    
     _label.text = [NSString stringWithFormat:@"%ld/%ld",(long)_friendGroup.online,_friendGroup.friends.count];
    
    
}


-(void)buttonClick:(UIButton *)button
{
    if (_friendGroup.isOpen) {
        _friendGroup.isOpen = NO;
        _button.imageView.transform=CGAffineTransformIdentity;
    }else{
        _friendGroup.isOpen= YES;
        _button.imageView.transform=CGAffineTransformMakeRotation(M_PI_2);
    }
    
    //刷新表示图
    if (_headerViewClick) {
        _headerViewClick();
    }
}



@end
