//
//  SHConcentricRingsDrawView.h
//  SHOoneClient
//
//  Created by 马远征 on 14-9-28.
//  Copyright (c) 2014年 马远征. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHConcentricRingsDrawView : UIView
@property (nonatomic, assign) CGFloat progressRingWidth;
@property (nonatomic, assign) CGFloat segmentSeparationAngle;
@property (nonatomic, assign) CGFloat animationDuration;
@property (nonatomic, strong) UIColor *strokekColor;
@property (nonatomic, assign) NSInteger numberOfSegments;
@property (nonatomic, readonly) CGFloat progress;

- (void)setProgress:(CGFloat)progress animated:(BOOL)animated;
@end
