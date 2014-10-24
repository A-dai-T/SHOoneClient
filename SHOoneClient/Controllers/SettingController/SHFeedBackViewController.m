//
//  SHFeedBackViewController.m
//  SHOoneClient
//
//  Created by 马远征 on 14-9-23.
//  Copyright (c) 2014年 马远征. All rights reserved.
//

#import "SHFeedBackViewController.h"
#import <TPKeyboardAvoiding/TPKeyboardAvoidingScrollView.h>

@interface SHFeedBackViewController ()
@property (weak, nonatomic) IBOutlet TPKeyboardAvoidingScrollView *scrollView;

@end

@implementation SHFeedBackViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        self.title = @"用户反馈";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width, self.scrollView.frame.size.height);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)clickToBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)clickToFeedBack:(id)sender
{
    [self.view endEditing:YES];
}

@end
