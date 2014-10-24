//
//  SHOoneViewController.m
//  SHOoneClient
//
//  Created by 马远征 on 14-9-22.
//  Copyright (c) 2014年 马远征. All rights reserved.
//

#import "SHOoneViewController.h"
#import "UIViewController+SHSideMenu.h"
#import "SHOoneDataViewController.h"
#import "SHOoneDefine.h"
#import "SHDayMarkView.h"
#import "SHSynchResultView.h"
#import "StyledPageControl.h"

#define KMarkViewWidth 46

@interface SHOoneViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *shareView;
@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UIView *centerBgView;
@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIScrollView *centerScrollView;
@property (strong, nonatomic) SHSynchResultView *synchStepsView;
@property (strong, nonatomic) SHSynchResultView *synchCaloriesView;
@property (strong, nonatomic) SHSynchResultView *synchDistanceView;
@property (strong, nonatomic) StyledPageControl *pageControl;
@property (strong, nonatomic) SHDayMarkView *selectedMarkView;
@end

@implementation SHOoneViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        self.title = @"5月25日";
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
}


- (BOOL)isShareMenuVisible;
{
    return !CGAffineTransformEqualToTransform(self.shareView.transform,
                                              CGAffineTransformIdentity);
}

- (void)resetShareView
{
    if (self.navigationController.sideController)
    {
        WEAKSELF;
        [self.navigationController.sideController performOpenSideMenu:^{
            STRONGSELF;
            [UIView animateWithDuration:0.25 animations:^{
                strongSelf.shareView.transform = CGAffineTransformIdentity;
            }];
        }];
    }
}

- (void)hideShareView
{
    WEAKSELF;
    [UIView animateWithDuration:0.25 animations:^{
        STRONGSELF;
        strongSelf.shareView.transform = CGAffineTransformIdentity;
    }];
}

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

- (void)addCenterScrollView
{
    CGRect bounds = self.centerBgView.bounds;
    
    _centerScrollView = [[UIScrollView alloc]initWithFrame:bounds];
    _centerScrollView.showsHorizontalScrollIndicator = NO;
    _centerScrollView.contentSize = CGSizeMake(bounds.size.width*3, bounds.size.height);
    _centerScrollView.pagingEnabled = YES;
    _centerScrollView.delegate = self;
    [_centerBgView addSubview:_centerScrollView];
    
    _synchStepsView = [[SHSynchResultView alloc]initWithFrame:bounds];
    [_synchStepsView setSynchItemName:@"步数"];
    [_synchStepsView setSynchData:@"9533"];
    [_centerScrollView addSubview:_synchStepsView];
    
    bounds.origin.x += _centerBgView.bounds.size.width;
    _synchCaloriesView = [[SHSynchResultView alloc]initWithFrame:bounds];
    [_synchCaloriesView setStrokekColor:[UIColor colorWithRed:0.980 green:0.337 blue:0.102 alpha:1.0]];
    [_synchCaloriesView setSynchItemName:@"卡路里"];
    [_synchCaloriesView setSynchData:@"9530"];
    [_centerScrollView addSubview:_synchCaloriesView];
    
    bounds.origin.x += _centerBgView.bounds.size.width;
    _synchDistanceView = [[SHSynchResultView alloc]initWithFrame:bounds];
    [_synchDistanceView setStrokekColor:[UIColor colorWithRed:0.031 green:0.624 blue:0.173 alpha:1.0]];
    [_synchDistanceView setSynchItemName:@"距离"];
    [_synchDistanceView setSynchData:@"5.7"];
    [_centerScrollView addSubview:_synchDistanceView];
}

- (StyledPageControl*)pageControl
{
    if (_pageControl)
    {
        return _pageControl;
    }
    CGFloat originY = self.headerView.frame.origin.y + self.headerView.bounds.size.height;
    CGRect pageFrame = CGRectMake(0, originY, self.view.bounds.size.width, 24);
    _pageControl = [[StyledPageControl alloc]initWithFrame:pageFrame];
    [_pageControl setNumberOfPages:3];
    [_pageControl setCurrentPage:0];
    [_pageControl setPageControlStyle:PageControlStyleThumb];
    [_pageControl setThumbImage:[UIImage imageNamed:@"sh_pageControl_normale"]];
    [_pageControl setSelectedThumbImage:[UIImage imageNamed:@"sh_pageControl_selected"]];
    [_pageControl addTarget:self action:@selector(changePage:)forControlEvents:UIControlEventValueChanged];
    return _pageControl;
}

- (void)addSubViews
{
    [self addScrollViewAndDayMarksView];
    [self addCenterScrollView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self resetShareView];
    self.centerBgView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.pageControl];
    [self performSelector:@selector(addSubViews) withObject:nil afterDelay:0.1];
}

- (void)reloadDataSource
{
    
}

#pragma mark -
#pragma mark UIPageControl

- (void)changePage:(id)sender
{
    int page = _pageControl.currentPage;
    CGFloat width = _centerScrollView.bounds.size.width;
    [_centerScrollView setContentOffset:CGPointMake(width * page, 0) animated:YES];
}

#pragma mark -
#pragma mark UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    int page = _centerScrollView.contentOffset.x / _centerScrollView.bounds.size.width;
    _pageControl.currentPage = page;
}


#pragma mark -
#pragma mark UIControl

- (IBAction)clickToShowLeft:(id)sender
{
    if (_pageControl.currentPage > 0)
    {
        _pageControl.currentPage--;
    }
    CGFloat width = _centerScrollView.bounds.size.width;
    [_centerScrollView setContentOffset:CGPointMake(width * _pageControl.currentPage, 0) animated:YES];
}

- (IBAction)clickToShowRight:(id)sender
{
    if (_pageControl.currentPage < 2)
    {
        _pageControl.currentPage++;
    }
    CGFloat width = _centerScrollView.bounds.size.width;
    [_centerScrollView setContentOffset:CGPointMake(width * _pageControl.currentPage, 0) animated:YES];
}

- (IBAction)leftBarButtonClick:(id)sender
{
    if (self.navigationController.sideController)
    {
        [self.navigationController.sideController showLeftViewController:YES];
    }
    WEAKSELF;
    [UIView animateWithDuration:0.25 animations:^{
        STRONGSELF;
        strongSelf.shareView.transform = CGAffineTransformIdentity;
    }];
}

- (IBAction)clickToViewRecord:(id)sender
{
    [self hideShareView];
    SHOoneDataViewController *OoneDataVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SHOoneDataViewController"];
    [self.navigationController pushViewController:OoneDataVC animated:YES];
}

- (IBAction)clickToShare:(id)sender
{
    
    if ([self isShareMenuVisible])
    {
        WEAKSELF;
        [UIView animateWithDuration:0.25 animations:^{
            STRONGSELF;
            strongSelf.shareView.transform = CGAffineTransformIdentity;
        }];
    }
    else
    {
        WEAKSELF;
        [UIView animateWithDuration:0.25 animations:^{
            STRONGSELF;
            strongSelf.shareView.transform = CGAffineTransformMakeTranslation(0,-60);
        }];
    }
}

- (IBAction)clickToShareWithWeiBo:(id)sender
{
    [self hideShareView];
}


- (IBAction)clickToShareWithQQ:(id)sender
{
    [self hideShareView];
}


- (IBAction)clickToShareWithWeiXin:(id)sender
{
    [self hideShareView];
}

- (IBAction)clickToShareMore:(id)sender
{
    [self hideShareView];
}

@end
