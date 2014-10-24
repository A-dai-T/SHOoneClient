//
//  SHSynchResultView.m
//  SHOoneClient
//
//  Created by 马远征 on 14-9-28.
//  Copyright (c) 2014年 马远征. All rights reserved.
//

#import "SHSynchResultView.h"

@implementation SHSynchResultView
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self defaultSetting];
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
         [self defaultSetting];
    }
    return self;
}

- (void)defaultSetting
{
    [self setProgressRingWidth:4.0];
    [self setNumberOfSegments:100];
    [self setProgress:0.7 animated:YES];
}

- (void)setSynchItemName:(NSString *)SynchItemName
{
    if (_SynchItemName != SynchItemName)
    {
        _SynchItemName = SynchItemName;
        [self setNeedsDisplay];
    }
}

- (void)setSynchData:(NSString *)synchData
{
    if (_synchData != synchData)
    {
        _synchData = synchData;
        [self setNeedsDisplay];
    }
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    CGFloat radius = MIN(self.bounds.size.width*0.5, self.bounds.size.height*0.5);
    CGPoint center = CGPointMake(rect.size.width*0.5, rect.size.height*0.5);
    CGFloat originX = center.x - radius + self.progressRingWidth;
    CGFloat originY = center.y - radius + self.progressRingWidth;
    CGRect frame = CGRectMake(originX, originY, (radius-self.progressRingWidth)*2, (radius-self.progressRingWidth)*2);
    UIImage *image = [UIImage imageNamed:@"sh_Oone_circle_image"];
    [image drawInRect:frame];
    
    if(_SynchItemName)
    {
        UIFont *font = [UIFont fontWithName:@"Helvetica-Bold" size:20];
        [[UIColor whiteColor]setFill];
        [_SynchItemName drawInRect:CGRectMake(0, rect.size.height/4, rect.size.width, 24) withFont:font lineBreakMode:NSLineBreakByTruncatingTail alignment:NSTextAlignmentCenter];
    }
    
    if (_synchData)
    {
        [self.strokekColor setFill];
        UIFont *font = [UIFont fontWithName:@"Helvetica" size:48];
        [_synchData drawInRect:CGRectMake(0, rect.size.height*0.5-20, rect.size.width, 40) withFont:font lineBreakMode:NSLineBreakByTruncatingTail alignment:NSTextAlignmentCenter];
    }
}
@end
