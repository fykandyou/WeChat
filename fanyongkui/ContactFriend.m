//
//  ContactFriend.m
//  fanyongkui
//
//  Created by qingyun on 15/11/4.
//  Copyright (c) 2015年 qingyun.com. All rights reserved.
//

#import "ContactFriend.h"

@implementation ContactFriend

-(instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)friendModel:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}
@end
