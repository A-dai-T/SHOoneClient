//
//  UIImage+Color.h
//  SHOoneClient
//
//  Created by 马远征 on 14-9-26.
//  Copyright (c) 2014年 马远征. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Color)
+(UIImage*)imageWithColor:(UIColor*)color;
+(UIImage*)imageWithColor:(UIColor*)color rect:(CGRect)rect;
@end
