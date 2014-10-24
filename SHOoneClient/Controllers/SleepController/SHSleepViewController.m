//
//  SHSleepViewController.m
//  SHOoneClient
//
//  Created by 马远征 on 14-9-28.
//  Copyright (c) 2014年 马远征. All rights reserved.
//

#import "SHSleepViewController.h"
#import "UIViewController+SHSideMenu.h"
#import "SHSleepSettingViewController.h"
#import "SHDayMarkView.h"
#import "SHSynchResultView.h"
#import "SHOoneDefine.h"

#define KMarkViewWidth 46

@interface SHSleepViewController()
@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet SHSynchResultView *synchSleepView;
@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) SHDayMarkView *selectedMarkView;
@end

@implementation SHSleepViewController


- (void)addScrollViewAndDayMarksView
{
    self.scrollView = [[UIScrollView alloc]initWithFrame:self.headerView.bounds];
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.backgroundColor = [UIColor clearColor];
    self.scrollView.bounces = NO;
    self.scrollView.contentSize = CGSizeMake(KMarkViewWidth*31, self.headerView.bounds.size.height);
    [self.headerView addSubview:self.scrollView];
    
    CGFloat height = self.headerView.bounds.size.height;
    WEAKSELF;
    STRONGSELF;
    for (int i = 0; i <= 30; i++)
    {
        SHDayMarkView *dayMarkView = [[SHDayMarkView alloc]initWithFrame:CGRectMake(i*KMarkViewWidth, 0, KMarkViewWidth, height)];
        [dayMarkView setTag:i];
        [dayMarkView performAction:^(SHDayMarkView *markView) {
            
            if (strongSelf.selectedMarkView == nil)
            {
                strongSelf.selectedMarkView = markView;
                [strongSelf.selectedMarkView setHighlight:YES];
            }
            else
            {
                if (strongSelf.selectedMarkView != markView)
                {
                    strongSelf.selectedMarkView = markView;
                    [strongSelf.selectedMarkView setHighlight:YES];
                }
            }
            [weakSelf reloadDataSource];
            
        }];
        [self.scrollView addSubview:dayMarkView];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self performSelector:@selector(addSubViews) withObject:nil afterDelay:0.1];
    [self.synchSleepView setStrokekColor:[UIColor colorWithRed:0.400 green:0.071 blue:0.663 alpha:1.0]];
    [self.synchSleepView setSynchItemName:@"睡眠时长"];
    [self.synchSleepView setSynchData:@"07h54'"];
}

- (void)addSubViews
{
    [self addScrollViewAndDayMarksView];
}

- (void)reloadDataSource
{
    
}

#pragma mark -
#pragma mark UIControl

- (IBAction)clickToEditSleepSetting:(id)sender
{
    SHSleepSettingViewController *sleepSettingVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SHSleepSettingViewController"];
    [self.navigationController pushViewController:sleepSettingVC animated:YES];
}

- (IBAction)clickToShowLeftSideMenu:(id)sender
{
    if (self.navigationController.sideController)
    {
        [self.navigationController.sideController showLeftViewController:YES];
    }
}

@end
