//
//  TGModel.m
//  fanyongkui
//
//  Created by qingyun on 15/11/3.
//  Copyright (c) 2015年 qingyun.com. All rights reserved.
//

#import "TGModel.h"

@implementation TGModel


-(instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)tgModelWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}
@end
