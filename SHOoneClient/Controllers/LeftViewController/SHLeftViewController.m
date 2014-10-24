//
//  SHLeftViewController.m
//  SHOoneClient
//
//  Created by 马远征 on 14-9-22.
//  Copyright (c) 2014年 马远征. All rights reserved.
//

#import "SHLeftViewController.h"
#import "UIViewController+SHSideMenu.h"
#import "SHNavigationController.h"
#import "SHSleepViewController.h"

@interface SHLeftViewController ()

@end

@implementation SHLeftViewController
#pragma mark -
#pragma mark dealloc

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        
    }
    return self;
}



#pragma mark -
#pragma mark viewDidLoad

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark -
#pragma mark UIControl

- (IBAction)clickToBackHome:(id)sender
{
    if (self.sideController)
    {
        UINavigationController *oOneNav = [SHNavigationController shared];
        [self.sideController setRootViewController:oOneNav animated:YES];
    }
}

- (IBAction)clickToShowGroup:(id)sender
{
    if (self.sideController)
    {
        UINavigationController *shGroupNav = [self.storyboard instantiateViewControllerWithIdentifier:@"SHGroupController"];
        [self.sideController setRootViewController:shGroupNav animated:YES];
    }
}

- (IBAction)clickToSetGoal:(id)sender
{
    if (self.sideController)
    {
        UINavigationController *goalSettingNav = [self.storyboard instantiateViewControllerWithIdentifier:@"SHGoalSettingController"];
        [self.sideController setRootViewController:goalSettingNav animated:YES];
    }
}

- (IBAction)clickToViewUserInfo:(id)sender
{
    if (self.sideController)
    {
        UINavigationController *personalDataVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SHPDataController"];
        [self.sideController setRootViewController:personalDataVC animated:YES];
    }
}


- (IBAction)clickToShowFriends:(id)sender
{
    if (self.sideController)
    {
        UINavigationController *shSettingNav = [self.storyboard instantiateViewControllerWithIdentifier:@"SHContactController"];
        [self.sideController setRootViewController:shSettingNav animated:YES];
    }
}

- (IBAction)clickToViewSleepQuality:(id)sender
{
    if (self.sideController)
    {
        UINavigationController *sleepQualityNav = [self.storyboard instantiateViewControllerWithIdentifier:@"SHSleepController"];
        [self.sideController setRootViewController:sleepQualityNav animated:YES];
    }
}


- (IBAction)clickToUpdateSetting:(id)sender
{
    if (self.sideController)
    {
        UINavigationController *shSettingNav = [self.storyboard instantiateViewControllerWithIdentifier:@"SHSettingController"];
        [self.sideController setRootViewController:shSettingNav animated:YES];
    }
}

- (IBAction)clickToQuit:(id)sender {
}

@end
