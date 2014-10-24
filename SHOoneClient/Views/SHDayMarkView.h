//
//  SHDayMarkView.h
//  SHOoneClient
//
//  Created by 马远征 on 14-9-29.
//  Copyright (c) 2014年 马远征. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SHDayMarkType)
{
    SHDayMarkNone = 0,
    SHDayMarkToday,
    SHDayMarkPrevious,
};

@class SHDayMarkView;

typedef void (^DayMarkViewTouchBlock)(SHDayMarkView *markView);

@interface SHDayMarkView : UIView
@property (nonatomic, assign) NSUInteger colorBarIndex;
@property (nonatomic, assign) SHDayMarkType dayMarkType;
@property (nonatomic, assign) BOOL highlight;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIColor *highlightTextColor;
- (void)performAction:(DayMarkViewTouchBlock)block;
@end
