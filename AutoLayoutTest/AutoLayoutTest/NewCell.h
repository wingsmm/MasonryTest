//
//  NewCell.h
//  AutoLayoutTest
//
//  Created by ZhangBo on 15/7/6.
//  Copyright (c) 2015年 ZhangBo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *leftImageView;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end
