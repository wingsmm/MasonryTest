//
//  TwoCell.m
//  AutoLayoutTest
//
//  Created by ZhangBo on 15/7/6.
//  Copyright (c) 2015年 ZhangBo. All rights reserved.
//

#import "TwoCell.h"
#import "Masonry.h"

@implementation TwoCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (CGSize)sizeThatFits:(CGSize)size
{
    CGFloat totalHeight = 0;
    totalHeight += [self.topLabel sizeThatFits:size].height;
    totalHeight += [self.midView sizeThatFits:size].height;
    totalHeight += [self.bottomLabel sizeThatFits:size].height;
    totalHeight += 40; // margins
    return CGSizeMake(size.width, totalHeight);
}




-(void)setWidth:(int)width
{
    if (_width!= width) {
        
        _width = width;
        
        _width = 4;
        
        
        CGFloat selfWidth = self.bounds.size.width;
        
        
        NSLog(@"------%0.2f--------",selfWidth);
        
        for (UIView * view in [_midView subviews]) {
            [view removeFromSuperview];
        }
        
        if (_width==0) {
            
            return;
        }
        
        if (_width==1) {
            
            UIView *view = [UIView new];
            [view setBackgroundColor:[UIColor redColor]];
            [_midView addSubview:view];
            
            [view setTranslatesAutoresizingMaskIntoConstraints:NO];
            
            NSDictionary *views = NSDictionaryOfVariableBindings(_midView, view);
            [_midView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[view(>=150)]-10-|" options:0 metrics:nil views:views]];
            [_midView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[view(>=150)]-10-|" options:0 metrics:nil views:views]];
        }
        
        
        if (_width==2) {
            
            UIView *view = [UIView new];
            [view setBackgroundColor:[UIColor redColor]];

            [_midView addSubview:view];
            
            UIView *view2 = [UIView new];
            [view2 setBackgroundColor:[UIColor blueColor]];
            [_midView addSubview:view2];
            
            [view setTranslatesAutoresizingMaskIntoConstraints:NO];
            [view2 setTranslatesAutoresizingMaskIntoConstraints:NO];
            
            NSDictionary *views = NSDictionaryOfVariableBindings(_midView, view, view2);
            
            [_midView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[view(>=120)]-[view2(>=120)]-10-|" options:0 metrics:nil views:views]];
            [_midView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[view(>=130)]-10-|" options:0 metrics:nil views:views]];
            
            [_midView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[view2(>=150)]-10-|" options:0 metrics:nil views:views]];
        }
        
        
        if (_width==3) {
            
            UIView *view1 = [UIView new];
            [view1 setBackgroundColor:[UIColor redColor]];
            [_midView addSubview:view1];
            [view1 setTranslatesAutoresizingMaskIntoConstraints:NO];

            UIView *view2 = [UIView new];
            [view2 setBackgroundColor:[UIColor blueColor]];
            [_midView addSubview:view2];
            [view2 setTranslatesAutoresizingMaskIntoConstraints:NO];
            
            
            UIView *view3 = [UIView new];
            [view3 setBackgroundColor:[UIColor blueColor]];
            [_midView addSubview:view3];
            [view3 setTranslatesAutoresizingMaskIntoConstraints:NO];

            
            NSDictionary *views = NSDictionaryOfVariableBindings(_midView, view1, view2,view3);
            
            [_midView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[view1(>=100)]-[view2(>=50)]-10-|" options:0 metrics:nil views:views]];
            [_midView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[view1(>=100)]-[view3(>=50)]-10-|" options:0 metrics:nil views:views]];
            [_midView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[view2(>=100)]-10-|" options:0 metrics:nil views:views]];
            
             [_midView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[view3(>=100)]" options:0 metrics:nil views:views]];
        }


        if (_width==4) {
            
            UIView *view1 = [UIView new];
            [view1 setBackgroundColor:[UIColor redColor]];
            [_midView addSubview:view1];
            [view1 setTranslatesAutoresizingMaskIntoConstraints:NO];
            
            UIView *view2 = [UIView new];
            [view2 setBackgroundColor:[UIColor blueColor]];
            [_midView addSubview:view2];
            [view2 setTranslatesAutoresizingMaskIntoConstraints:NO];
            
            
            UIView *view3 = [UIView new];
            [view3 setBackgroundColor:[UIColor yellowColor]];
            [_midView addSubview:view3];
            [view3 setTranslatesAutoresizingMaskIntoConstraints:NO];
            
            UIView *view4 = [UIView new];
            [view4 setBackgroundColor:[UIColor blackColor]];
            [_midView addSubview:view4];
            [view4 setTranslatesAutoresizingMaskIntoConstraints:NO];
            
            NSDictionary *views = NSDictionaryOfVariableBindings(_midView, view1, view2,view3,view4);
            
            [_midView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[view1(>=50)][view2(>=50)]-10-|" options:0 metrics:nil views:views]];
            
            [_midView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[view3(>=50)][view4(>=50)]-10-|" options:0 metrics:nil views:views]];

            [_midView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[view1(>=50)][view3(>=30)]-10-|" options:0 metrics:nil views:views]];
            
            
            [_midView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[view2(>=50)]-[view4(>=30)]-10-|"  options:0 metrics:nil views:views]];
            
        }

        

    }
}


@end
