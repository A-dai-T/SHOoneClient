//
//  UIViewController+SHSideMenu.m
//  SHOoneClient
//
//  Created by 马远征 on 14-9-22.
//  Copyright (c) 2014年 马远征. All rights reserved.
//

#import "UIViewController+SHSideMenu.h"

@implementation UIViewController (SHSideMenu)
- (SHSideController*)sideController
{
    if ([self.parentViewController isKindOfClass:[SHSideController class]])
    {
        return (SHSideController*)(self.parentViewController);
    }
    return nil;
}
@end
