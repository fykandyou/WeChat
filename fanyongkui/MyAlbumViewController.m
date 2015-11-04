//
//  MyAlbumViewController.m
//  fanyongkui
//
//  Created by qingyun on 15/11/4.
//  Copyright (c) 2015年 qingyun.com. All rights reserved.
//

#import "MyAlbumViewController.h"
#import "subScrollView.h"
@interface MyAlbumViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView *scrollView;

@end

@implementation MyAlbumViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title =@"相册";
    
}

-(void)addScrollView
{
    UIScrollView *scrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 375 +25, 667)];
    [self.view addSubview: scrollView];
    
    scrollView.contentSize = CGSizeMake( (375+25)*3, 667);
    
    scrollView.pagingEnabled=YES;
    
    scrollView.showsHorizontalScrollIndicator = NO;
    
    scrollView.delegate =self;
    
    
    _scrollView=scrollView;
    _scrollView.backgroundColor=[UIColor blackColor];
}

-(void)addSubScrollView
{
    for (int i=0; i<3; i++) {
        subScrollView *scrollView=[[subScrollView alloc] initWithFrame:CGRectMake(375 * i, 0, 375, 667)];
        [_scrollView addSubview:scrollView];
        
        NSString *imageName=[NSString stringWithFormat:@"new_feature_%d",i+1];
        scrollView.img = [UIImage imageNamed:imageName];
    }
}

//减速完成  把上个界面的缩放的scrollview缩放比例设置1.0
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    for (id scroll in scrollView.subviews) {
        //判断scroll对象是否是QYScrollView类型的
        if ([scroll isKindOfClass:[subScrollView   class]]) {
            subScrollView *qyScrollView = (subScrollView *)scroll;
            //设置缩放比例
            qyScrollView.zoomScale = 1.0;
        }
    }
}

@end
