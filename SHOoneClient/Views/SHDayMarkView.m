//
//  SHDayMarkView.m
//  SHOoneClient
//
//  Created by 马远征 on 14-9-29.
//  Copyright (c) 2014年 马远征. All rights reserved.
//

#import "SHDayMarkView.h"

@interface SHDayMarkView()
@property (nonatomic, copy) DayMarkViewTouchBlock touchBlock;
@property (nonatomic, strong) NSArray *imageArray;
@end

@implementation SHDayMarkView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        _dayMarkType = SHDayMarkPrevious;
        _textColor = [UIColor colorWithRed:0.533 green:0.565 blue:0.643 alpha:1.0];
        _highlightTextColor = [UIColor whiteColor];
       self.imageArray = @[@"sh_indicate_blue_bar",@"sh_indicate_green_bar",@"sh_indicate_red_bar"];
    }
    return self;
}

- (void)setHighlight:(BOOL)highlight
{
    if (_highlight != highlight)
    {
        _highlight = highlight;
        [self setNeedsDisplay];
    }
}

- (void)setDayMarkType:(SHDayMarkType)dayMarkType
{
    if (_dayMarkType != dayMarkType)
    {
        _dayMarkType = dayMarkType;
        [self setNeedsDisplay];
    }
}

- (void)performAction:(DayMarkViewTouchBlock)block
{
    _touchBlock = block;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ( !_highlight)
    {
        _highlight = YES;
        [self setNeedsDisplay];
    }
    if (_touchBlock)
    {
        _touchBlock(self);
    }
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    UIImage *image = [UIImage imageNamed:@"sh_day_bg_image"];
    [image drawInRect:CGRectMake(1, 0, rect.size.width - 2, rect.size.height)];
    
    if (_dayMarkType == SHDayMarkNone)
    {
        image = [UIImage imageNamed:@"sh_indicate_gray_bar"];
        [image drawInRect:CGRectMake(1, 0, rect.size.width-2, 4)];
    }
    else if (_dayMarkType == SHDayMarkPrevious)
    {
        
        NSInteger index = self.tag%3;
        image = [UIImage imageNamed:[self.imageArray objectAtIndex:index]];
        [image drawInRect:CGRectMake(1, 0, rect.size.width-2, 4)];
    }
    else
    {
        image = [UIImage imageNamed:@"sh_indicate_yellow_bar"];
        [image drawInRect:CGRectMake(1, 0, rect.size.width-2, 4)];
        
        image = [UIImage imageNamed:@"sh_triangle _indicator_image"];
        [image drawInRect:CGRectMake(rect.size.width*0.5-3, 4, 6, 3)];
    }
    
    if (_highlight)
    {
        [_highlightTextColor setFill];
    }
    else
    {
        [_textColor setFill];
    }
}
@end
