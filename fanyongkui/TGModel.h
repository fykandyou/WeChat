//
//  TGModel.h
//  fanyongkui
//
//  Created by qingyun on 15/11/3.
//  Copyright (c) 2015年 qingyun.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TGModel : NSObject
@property(nonatomic,strong) NSString *buycount;
@property(nonatomic,strong) NSString *icon;
@property(nonatomic,strong) NSString *price;
@property(nonatomic,strong) NSString *title;

-(instancetype)initWithDictionary:(NSDictionary *)dict;
+(instancetype)tgModelWithDictionary:(NSDictionary *)dict;

@end
