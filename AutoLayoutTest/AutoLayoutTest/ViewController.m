//
//  ViewController.m
//  AutoLayoutTest
//
//  Created by ZhangBo on 15/6/17.
//  Copyright (c) 2015年 ZhangBo. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "UIView+Masonry.h"

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    WS(ws);
    
    
    
    
    /**
     *  1. [基础] 居中显示一个view
     */
    
    UIView * v1 = [UIView new];
    [v1 setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:v1];
    
    [v1 mas_makeConstraints:^(MASConstraintMaker * maker){
       
        maker.center.equalTo(ws.view);
        maker.size.mas_equalTo(CGSizeMake(300, 300));
        

    }];
    
    
    
    /**
     *  2. [初级] 让一个view略小于其superView(边距为10)
     */
    
    
    UIView * v2 = [UIView new];
    [v2 setBackgroundColor:[UIColor redColor]];
    [v1 addSubview:v2];
    
    [v2 mas_makeConstraints:^(MASConstraintMaker * maker){
        
        maker.edges.equalTo(v1).width.insets(UIEdgeInsetsMake(10, 10, 10, 10));
    
    }];
    
    
    
    /**
     *  [初级] 让两个高度为150的view垂直居中且等宽且等间隔排列 间隔为10(自动计算其宽度)
     */
    
    
    UIView * v3 = [UIView new];
    UIView * v4 = [UIView new];
    
    [v3 setBackgroundColor:[UIColor orangeColor]];
    [v4 setBackgroundColor:[UIColor orangeColor]];
    
    [v1 addSubview:v3];
    [v1 addSubview:v4];
    
    
    int padding1=10;
    
    [v3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(v1.mas_centerY);
        make.left.equalTo(v1.mas_left).with.offset(padding1);
        make.right.equalTo(v4.mas_left).with.offset(-padding1);
        make.height.mas_equalTo(@150);
        make.width.equalTo(v4);
    }];

    [v4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(v1.mas_centerY);
        make.left.equalTo(v3.mas_right).with.offset(padding1);
        make.right.equalTo(v1.mas_right).with.offset(-padding1);
        make.height.mas_equalTo(@150);
        make.width.equalTo(v3);
    }];
    
    
    
    
    /**
     *  4. [中级] 在UIScrollView顺序排列一些view并自动计算contentSize
     */
    
    
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.backgroundColor = [UIColor whiteColor];
    [v1 addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(v1).with.insets(UIEdgeInsetsMake(5,5,5,5));
    }];
    
    UIView *container = [UIView new];
    [scrollView addSubview:container];
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollView);
        make.width.equalTo(scrollView);
    }];
    
    int count = 10;
    
    UIView *lastView = nil;
    
    for ( int i = 1 ; i <= count ; ++i )
    {
        UIView *subv = [UIView new];
        [container addSubview:subv];
        subv.backgroundColor = [UIColor colorWithHue:( arc4random() % 256 / 256.0 )
                                          saturation:( arc4random() % 128 / 256.0 ) + 0.5
                                          brightness:( arc4random() % 128 / 256.0 ) + 0.5
                                               alpha:1];
        
        [subv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.equalTo(container);
            make.height.mas_equalTo(@(20*i));
            
            if ( lastView )
            {
                make.top.mas_equalTo(lastView.mas_bottom);
            }
            else
            {
                make.top.mas_equalTo(container.mas_top);
            }
        }];
        
        lastView = subv;
    }
    
    
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(lastView.mas_bottom);
    }];
    
    
    
    
    /**
     *  5. [高级] 横向或者纵向等间隙的排列一组view
     *
     *  
     */
    
    
    
    
    
    UIView *sv11 = [UIView new];
    UIView *sv12 = [UIView new];
    UIView *sv13 = [UIView new];
    UIView *sv21 = [UIView new];
    UIView *sv31 = [UIView new];
    
    sv11.backgroundColor = [UIColor redColor];
    sv12.backgroundColor = [UIColor redColor];
    sv13.backgroundColor = [UIColor redColor];
    sv21.backgroundColor = [UIColor redColor];
    sv31.backgroundColor = [UIColor redColor];
    
    [v1 addSubview:sv11];
    [v1 addSubview:sv12];
    [v1 addSubview:sv13];
    [v1 addSubview:sv21];
    [v1 addSubview:sv31];
    
    //给予不同的大小 测试效果
    
    [sv11 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(@[sv12,sv13]);
        make.centerX.equalTo(@[sv21,sv31]);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
    [sv12 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(70, 20));
    }];
    
    [sv13 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    
    [sv21 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 20));
    }];
    
    [sv31 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(40, 60));
    }];
    
    [v1 distributeSpacingHorizontallyWith:@[sv11,sv12,sv13]];
    [v1 distributeSpacingVerticallyWith:@[sv11,sv21,sv31]];

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
