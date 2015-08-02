//
//  Helper.m
//  AutoLayoutTest
//
//  Created by ZhangBo on 15/7/6.
//  Copyright (c) 2015年 ZhangBo. All rights reserved.
//

#import "Helper.h"

NSString * getRandomString()
{
    
    NSArray * s = @[@"llllllllllllllll",@"asdfghjklujntfvsdfg$^%$^%$^@#@@$~#@!$@#@#%%#%#%#$%#%#%#%#%#%#%$#%#^*^",@"ksjfksjfksjfksdjksjfksjfkd"];
    int index = arc4random()%3;
    return s[index];
}

UIImage * getRamdomImage()
{
    int index = arc4random()%5;
    return [UIImage imageNamed:[NSString stringWithFormat:@"%d",index]];
}

int getRamdomCount()
{
    return arc4random()%2;
}
