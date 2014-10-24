//
//  SHConcentricRingsDrawView.m
//  SHOoneClient
//
//  Created by 马远征 on 14-9-28.
//  Copyright (c) 2014年 马远征. All rights reserved.
//

#import "SHConcentricRingsDrawView.h"

#define   DEGREES_TO_RADIANS(degrees)  ((M_PI * degrees)/ 180)

@interface SHConcentricRingsDrawView()
@property (nonatomic, assign) BOOL progressRingWidthOverriden;
@property (nonatomic, assign) BOOL segmentSeparationAngleOverriden;

@property (nonatomic, assign) CGFloat animationFromValue;
@property (nonatomic, assign) CGFloat animationToValue;
@property (nonatomic, assign) CGFloat outerRingAngle;
@property (nonatomic, assign) CGFloat innerRingAngle;

@property (nonatomic, assign) CGFloat segmentSeparationInnerAngle;
@property (nonatomic, assign) CFTimeInterval animationStartTime;
@property (nonatomic, strong) CAShapeLayer *progressLayer;
@property (nonatomic, strong) CADisplayLink *displayLink;

@property (nonatomic, readwrite) CGFloat progress;
@end

@implementation SHConcentricRingsDrawView

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
    
    _progressRingWidth = fmaxf(self.bounds.size.width * .25, 1.0);
    _animationDuration = 0.3f;
    _numberOfSegments = 8;
    _segmentSeparationAngle = M_PI / (2 * _numberOfSegments);
    
    _strokekColor = [UIColor colorWithRed:0 green:122/255.0 blue:1.0 alpha:1.0];
    
    _progressLayer = [CAShapeLayer layer];
    _progressLayer.fillColor = _strokekColor.CGColor;
    [self.layer addSublayer:_progressLayer];
}

- (void)setStrokekColor:(UIColor *)strokekColor
{
    if (_strokekColor != strokekColor)
    {
        _strokekColor = strokekColor;
        _progressLayer.fillColor = _strokekColor.CGColor;
    }
}

- (void)setProgress:(CGFloat)progress animated:(BOOL)animated
{
    if (self.progress == progress)
    {
        return;
    }
    
    if (animated == NO)
    {
        if (_displayLink)
        {
            [_displayLink removeFromRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
            _displayLink = nil;
        }
        self.progress = progress;
        [self setNeedsDisplay];
    }
    else
    {
        _animationStartTime = CACurrentMediaTime();
        _animationFromValue = self.progress;
        _animationToValue = progress;
        if (!_displayLink)
        {
            [self.displayLink removeFromRunLoop:NSRunLoop.mainRunLoop forMode:NSRunLoopCommonModes];
            self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(animateProgress:)];
            [self.displayLink addToRunLoop:NSRunLoop.mainRunLoop forMode:NSRunLoopCommonModes];
        }
    }
}

- (void)animateProgress:(CADisplayLink *)displayLink
{
    __typeof(self) __weak weakSelf = self;
    __typeof(weakSelf) __strong strongSelf = weakSelf;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        
        CGFloat dt = (displayLink.timestamp - _animationStartTime) / strongSelf.animationDuration;
        if (dt >= 1.0)
        {
            [strongSelf.displayLink removeFromRunLoop:NSRunLoop.mainRunLoop forMode:NSRunLoopCommonModes];
            strongSelf.displayLink = nil;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                strongSelf.progress = _animationToValue;
                [weakSelf setNeedsDisplay];
                
            });
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            strongSelf.progress = _animationFromValue + dt * (_animationToValue - _animationFromValue);
            [weakSelf setNeedsDisplay];
        });
    });
}



- (void)setProgressRingWidth:(CGFloat)progressRingWidth
{
    if (_progressRingWidth != progressRingWidth)
    {
        _progressRingWidth = progressRingWidth;
        _progressLayer.lineWidth = _progressRingWidth;
        _progressRingWidthOverriden = YES;
        [self updateAngles];
        [self setNeedsDisplay];
    }
}

- (void)setNumberOfSegments:(NSInteger)numberOfSegments
{
    if (_numberOfSegments != numberOfSegments)
    {
        _numberOfSegments = numberOfSegments;
        if (!_segmentSeparationAngleOverriden)
        {
            _segmentSeparationAngle = M_PI / (2 * _numberOfSegments);
        }
    }
}

- (void)setSegmentSeparationAngle:(CGFloat)segmentSeparationAngle
{
    if (_segmentSeparationAngle != segmentSeparationAngle)
    {
        _segmentSeparationAngle = segmentSeparationAngle;
        _segmentSeparationAngleOverriden = YES;
    }
}

- (void)updateAngles
{
    _outerRingAngle = ((2.0 * M_PI) / (float)_numberOfSegments) - _segmentSeparationAngle;
}

- (NSInteger)numberOfFullSegments
{
    return (NSInteger)floorf(self.progress * _numberOfSegments);
}

- (void)drawProgress
{
    CGFloat outerStartAngle = - M_PI_2;
    outerStartAngle += (_segmentSeparationAngle / 2.0);
    
    CGMutablePathRef pathRef = CGPathCreateMutable();
    
    CGPoint center = CGPointMake(self.bounds.size.width / 2.0, self.bounds.size.height / 2.0);
    CGFloat radius = MIN(self.bounds.size.width*0.5, self.bounds.size.height*0.5);
    for (int i = 0; i < [self numberOfFullSegments]; i++)
    {
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center
                                                            radius:radius
                                                        startAngle:outerStartAngle
                                                          endAngle:(outerStartAngle + _outerRingAngle)
                                                         clockwise:YES];
        
        [path addArcWithCenter:center
                        radius:radius - _progressRingWidth
                    startAngle:(outerStartAngle + _outerRingAngle)
                      endAngle:outerStartAngle
                     clockwise:NO];
        
        [path closePath];
        CGPathAddPath(pathRef, NULL, path.CGPath);
        outerStartAngle += (_outerRingAngle + _segmentSeparationAngle);
    }
    
    _progressLayer.path = pathRef;
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _progressLayer.frame = self.bounds;
    
    if (!_progressRingWidthOverriden)
    {
        CGFloat minWidth = fminf(self.frame.size.width, self.frame.size.height);
        _progressRingWidth = fmaxf(minWidth * .25, 1.0);
    }
    
    [self updateAngles];
    [self setNeedsDisplay];
}


- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    [self drawProgress];
}


@end
