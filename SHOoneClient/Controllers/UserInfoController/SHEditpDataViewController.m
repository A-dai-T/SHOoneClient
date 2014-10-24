//
//  SHEditpDataViewController.m
//  SHOoneClient
//
//  Created by 马远征 on 14-9-24.
//  Copyright (c) 2014年 马远征. All rights reserved.
//

#import "SHEditpDataViewController.h"
#import "SHOoneDefine.h"

@interface SHEditpDataViewController ()<UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *avatorButton;

@end

@implementation SHEditpDataViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.title = @"编辑个人资料";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.avatorButton.layer.cornerRadius = 38;
    self.avatorButton.layer.masksToBounds = YES;
}

#pragma mark -
#pragma mark UIControl Action

- (IBAction)clickToPickerImage:(id)sender
{
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@"上传照片"
                                                                delegate:self
                                                       cancelButtonTitle:@"取消"
                                                  destructiveButtonTitle:nil
                                                       otherButtonTitles:@"从相册选取", nil];
        actionSheet.tag = 11110;
        [actionSheet showInView:self.navigationController.view];
    }
    else
    {
        UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@"上传照片"
                                                                delegate:self
                                                       cancelButtonTitle:@"取消"
                                                  destructiveButtonTitle:nil
                                                       otherButtonTitles:@"从相册选取",@"从相机选取", nil];
        actionSheet.tag = 11111;
        [actionSheet showInView:self.navigationController.view];
    }
}

- (IBAction)clickToBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)clickToSaveEdit:(id)sender
{
}

#pragma mark -
#pragma mark UIImagePickerControllerDelegate

- (void)showImagePickerWithSourceType:(UIImagePickerControllerSourceType)sourceType
{
    UIImagePickerController *pickerController = [[UIImagePickerController alloc]init];
    pickerController.delegate = self;
    pickerController.allowsEditing = YES;
    pickerController.sourceType = sourceType;
    pickerController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self.navigationController presentViewController:pickerController animated:YES completion:^{}];
}



-(void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary*)info
{
    WEAKSELF;
    [picker dismissViewControllerAnimated:YES completion:^{
        STRONGSELF;
        UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
        [strongSelf.avatorButton setBackgroundImage:image forState:UIControlStateNormal];
//        NSData *imageData = UIImagePNGRepresentation(image);
    }];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController*)picker
{
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma mark -
#pragma mark UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (actionSheet.tag == 11110)
    {
        if (buttonIndex == 0)
        {
            [self showImagePickerWithSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        }
    }
    
    if (actionSheet.tag == 11111)
    {
        if (buttonIndex == 0)
        {
            [self showImagePickerWithSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        }
        else if (buttonIndex == 1)
        {
            [self showImagePickerWithSourceType:UIImagePickerControllerSourceTypeCamera];
        }
    }
    
    if (actionSheet.tag == 11112)
    {
        if (buttonIndex == 0)
        {
            [self showImagePickerWithSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        }
    }
    
    if (actionSheet.tag == 11113)
    {
        if (buttonIndex == 0)
        {
            [self showImagePickerWithSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        }
        else if (buttonIndex == 1)
        {
            [self showImagePickerWithSourceType:UIImagePickerControllerSourceTypeCamera];
        }
    }
}


#pragma mark -
#pragma mark uitableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 10;
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    if (indexPath.section == 0)
    {
        cell.textLabel.text = @"昵称";
    }
    else if (indexPath.section == 1)
    {
        cell.textLabel.text = @"性别";
    }
    else if (indexPath.section == 3)
    {
        cell.textLabel.text = @"生日";
    }
    else if (indexPath.section == 4)
    {
        cell.textLabel.text = @"身高";
    }
    else
    {
        cell.textLabel.text = @"体重";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
