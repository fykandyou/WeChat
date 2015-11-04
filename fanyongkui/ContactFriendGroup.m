//
//  ContactFriendGroup.m
//  fanyongkui
//
//  Created by qingyun on 15/11/4.
//  Copyright (c) 2015年 qingyun.com. All rights reserved.
//

#import "ContactFriendGroup.h"
#import "ContactFriend.h"
@implementation ContactFriendGroup


-(instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        
    }
    
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *dict in self.friends) {
        ContactFriend *friend = [ContactFriend friendModel:dict];
        [array addObject:friend];
    }
    self.friends = array;
    
    return self;
}

+(instancetype)friendGroupModel:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

@end
