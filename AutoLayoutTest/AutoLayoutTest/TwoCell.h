//
//  TwoCell.h
//  AutoLayoutTest
//
//  Created by ZhangBo on 15/7/6.
//  Copyright (c) 2015年 ZhangBo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TwoCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *topLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomLabel;

@property (weak, nonatomic) __block IBOutlet  UIView *midView;

@property (assign,nonatomic) int width;
@end
