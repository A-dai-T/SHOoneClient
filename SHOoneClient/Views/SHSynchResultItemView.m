//
//  SHSynchResultItemView.m
//  SHOoneClient
//
//  Created by 马远征 on 14-9-29.
//  Copyright (c) 2014年 马远征. All rights reserved.
//

#import "SHSynchResultItemView.h"

@implementation SHSynchResultItemView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self setUp];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setUp];
    }
    return self;
}

- (void)setUp
{
    self.backgroundColor = [UIColor clearColor];
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
}

@end
