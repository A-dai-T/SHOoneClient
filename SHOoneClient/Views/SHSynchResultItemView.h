//
//  SHSynchResultItemView.h
//  SHOoneClient
//
//  Created by 马远征 on 14-9-29.
//  Copyright (c) 2014年 马远征. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SHSynchResultType)
{
    SHSynchResultSteps = 0,
    SHSynchResultCalories,
    SHSynchResultDistance,
};

@interface SHSynchResultItemView : UIView
@property (nonatomic, assign) SHSynchResultType resultType;

@end
