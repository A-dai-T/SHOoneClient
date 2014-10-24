//
//  SHSegmentedControl.m
//  SHOoneClient
//
//  Created by 马远征 on 14-9-28.
//  Copyright (c) 2014年 马远征. All rights reserved.
//

#import "SHSegmentedControl.h"

@implementation SHSegmentedControl

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setUp];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setUp];
}


- (UIImage*)imageWithColor:(UIColor*)color size:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size,NO,0);
    CGContextRef con = UIGraphicsGetCurrentContext();
    CGContextAddRect(con,CGRectMake(0,0,size.width,size.height));
    CGContextSetFillColorWithColor(con,color.CGColor);
    CGContextFillPath(con);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)setUp
{
    UIColor *selectedColor = [UIColor colorWithWhite:1.0 alpha:0.2];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTintColor:selectedColor];
    
    // 自定义背景
    UIImage *normalImage = [self imageWithColor:[UIColor clearColor] size:CGSizeMake(100, 32)];
    UIImage *selectedImage = [self imageWithColor:selectedColor size:CGSizeMake(100, 32)];
    
    [self setBackgroundImage:normalImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [self setBackgroundImage:selectedImage forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    
    // 自定义分割线
    UIImage *divideImage = [self imageWithColor:selectedColor size:CGSizeMake(1.0, 32)];
    [self setDividerImage:nil forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    [self setDividerImage:nil forLeftSegmentState:UIControlStateSelected rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [self setDividerImage:divideImage forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    // 标题属性
    [[UISegmentedControl appearance] setTitleTextAttributes:@{
                                                              UITextAttributeTextColor: selectedColor,
                                                              UITextAttributeFont: [UIFont fontWithName:@"Helvetica-Bold" size:14],
                                                              UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetMake(0, 0)] }
                                                   forState:UIControlStateNormal];
    
    [[UISegmentedControl appearance] setTitleTextAttributes:@{
                                                              UITextAttributeTextColor: [UIColor whiteColor],
                                                              UITextAttributeFont: [UIFont fontWithName:@"Helvetica-Bold" size:14],
                                                              UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetMake(0, 0)]}
                                                   forState:UIControlStateSelected];
}



- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.layer setCornerRadius:2];
    [self.layer setMasksToBounds:YES];
    [self.layer setBorderColor:[UIColor colorWithWhite:1.0 alpha:0.3].CGColor];
    [self.layer setBorderWidth:1.0];
}

@end
