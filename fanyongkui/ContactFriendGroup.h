//
//  ContactFriendGroup.h
//  fanyongkui
//
//  Created by qingyun on 15/11/4.
//  Copyright (c) 2015年 qingyun.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContactFriendGroup : NSObject

@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSArray *friends;
@property(nonatomic) NSInteger online;

@property(nonatomic)BOOL isOpen;


-(instancetype)initWithDictionary:(NSDictionary *)dict;
+(instancetype)friendGroupModel:(NSDictionary *)dict;

@end
