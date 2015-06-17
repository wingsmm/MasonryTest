//
//  UIView+UIView_Masonry.h
//  AutoLayoutTest
//
//  Created by ZhangBo on 15/6/17.
//  Copyright (c) 2015年 ZhangBo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Masonry)
- (void) distributeSpacingHorizontallyWith:(NSArray*)views;
- (void) distributeSpacingVerticallyWith:(NSArray*)views;
@end
