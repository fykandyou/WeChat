//
//  TGTableViewCell.m
//  fanyongkui
//
//  Created by qingyun on 15/11/3.
//  Copyright (c) 2015年 qingyun.com. All rights reserved.
//

#import "TGTableViewCell.h"
#import "TGModel.h"
@interface TGTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *priceTitle;
@property (weak, nonatomic) IBOutlet UILabel *buycountTitle;


@end
@implementation TGTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(TGModel *)model
{
    _model = model;
    
    _imgView.image=[UIImage imageNamed:model.icon];
    _title.text = model.title;
    _priceTitle.text = model.price;
    _buycountTitle.text = model.buycount;
    
}

@end
