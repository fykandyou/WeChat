//
//  ContactFriend.h
//  fanyongkui
//
//  Created by qingyun on 15/11/4.
//  Copyright (c) 2015年 qingyun.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContactFriend : NSObject

@property(nonatomic,strong) NSString *icon;
@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSString *status;
@property(nonatomic) BOOL vip;

-(instancetype)initWithDictionary:(NSDictionary *)dict;
+(instancetype)friendModel:(NSDictionary *)dict;

@end
