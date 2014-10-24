//
//  SHGroupZoneTableViewCell.m
//  SHOoneClient
//
//  Created by 马远征 on 14-9-25.
//  Copyright (c) 2014年 马远征. All rights reserved.
//

#import "SHGroupZoneTableViewCell.h"

@implementation SHGroupZoneTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.backgroundColor = [UIColor clearColor];
    
    UIView *bgView = [[UIView alloc]init];
    bgView.alpha = 0.2;
    bgView.backgroundColor = [UIColor whiteColor];
    self.backgroundView = bgView;
    
    UIView *selectedBgView = [[UIView alloc]init];
    selectedBgView.alpha = 0.2;
    selectedBgView.backgroundColor = [UIColor grayColor];
    self.selectedBackgroundView = selectedBgView;
    
    self.textLabel.font = [UIFont fontWithName:@"Helvetica" size:18];
    self.textLabel.textColor = [UIColor whiteColor];

    self.detailTextLabel.numberOfLines = 3;
    self.detailTextLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    self.detailTextLabel.font = [UIFont fontWithName:@"Helvetica" size:13];
    self.detailTextLabel.textColor = [UIColor colorWithWhite:1.0 alpha:0.6];
    
    self.imageView.layer.masksToBounds = YES;
    self.imageView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.imageView.layer.borderWidth = 2.0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.textLabel.backgroundColor = [UIColor clearColor];
    self.detailTextLabel.backgroundColor = [UIColor clearColor];
    
    CGRect imageFrame = self.imageView.frame;
    imageFrame.origin.y = 10.0;
    imageFrame.origin.x += 13.0;
    imageFrame.size.height -= 10.0;
    imageFrame.size.width = imageFrame.size.height;
    self.imageView.frame = imageFrame;
    self.imageView.layer.cornerRadius = self.imageView.frame.size.height*0.5;
    
    CGRect accessoryViewframe = self.accessoryView.frame;
    accessoryViewframe.origin.x -= 10;
    self.accessoryView.frame = accessoryViewframe;
    
    CGFloat XdifValue = (self.imageView.image != nil) ? 0: 10;
    CGRect textlabelframe = self.textLabel.frame;
    textlabelframe.origin.x += XdifValue;
    textlabelframe.origin.y = 5.0;
    self.textLabel.frame = textlabelframe;
    
    CGRect detailTextlabelframe = self.detailTextLabel.frame;
    detailTextlabelframe.origin.x += (self.imageView.image != nil) ? 0: 10;
    detailTextlabelframe.origin.y = 30;
    detailTextlabelframe.size.width -= 0;
    self.detailTextLabel.frame = detailTextlabelframe;
    
    CGRect frame = self.backgroundView.frame;
    frame.origin.x = 10;
    frame.size.width = self.frame.size.width - 20;
    self.backgroundView.frame = frame;
    
    CGRect selectframe = self.selectedBackgroundView.frame;
    selectframe.origin.x = 10;
    selectframe.size.width = self.frame.size.width - 20;
    self.selectedBackgroundView.frame = selectframe;
}

@end
