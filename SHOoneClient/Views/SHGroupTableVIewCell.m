//
//  SHGroupTableVIewCell.m
//  SHOoneClient
//
//  Created by 马远征 on 14-9-25.
//  Copyright (c) 2014年 马远征. All rights reserved.
//

#import "SHGroupTableVIewCell.h"

@implementation SHGroupTableVIewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.textLabel.font = [UIFont fontWithName:@"Helvetica" size:16];
    self.textLabel.textColor = [UIColor colorWithRed:0.769 green:0.494 blue:0.380 alpha:1.0];
    self.textLabel.highlightedTextColor = self.textLabel.textColor;
    
    self.detailTextLabel.font = [UIFont fontWithName:@"Helvetica" size:15];
    self.detailTextLabel.textColor = [UIColor whiteColor];
    self.detailTextLabel.highlightedTextColor = [UIColor whiteColor];
    self.detailTextLabel.numberOfLines = 0;
    self.detailTextLabel.lineBreakMode = NSLineBreakByWordWrapping;
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    CGRect imageFrame = self.imageView.frame;
    imageFrame.origin.x -= 3.0;
    self.imageView.frame = imageFrame;
    self.imageView.layer.cornerRadius = self.imageView.frame.size.height*0.5;
    
    CGFloat XdifValue = (self.imageView.image != nil) ? 30: 0;
    CGRect textlabelframe = self.textLabel.frame;
    textlabelframe.origin.x -= XdifValue;
    self.textLabel.frame = textlabelframe;
    
    CGFloat XDdifValue = (self.imageView.image != nil) ? 10: 0;
    CGRect detailTextlabelframe = self.detailTextLabel.frame;
    detailTextlabelframe.origin.x -= XDdifValue;
    detailTextlabelframe.size.width -= (self.imageView.image != nil) ? 0: 10;
    self.detailTextLabel.frame = detailTextlabelframe;
}

@end
