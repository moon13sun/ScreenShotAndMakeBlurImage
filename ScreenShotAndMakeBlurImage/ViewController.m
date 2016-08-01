//
//  ViewController.m
//  截屏并设置磨砂效果
//
//  Created by leergou on 16/8/1.
//  Copyright © 2016年 WhiteHouse. All rights reserved.
//

/*
 点击打开相册按钮,打开相册,选择图片作为窗口背景
 点击屏幕,会将背景模糊处理,并设置为窗口背景
 */

#import "ViewController.h"
#import "UIImage+ImageEffects.h"
#import "UIImage+STImage.h"

@interface ViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (nonatomic,strong) UIImage *image;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}
- (IBAction)openAlbum:(id)sender {
    
    [self openAlbum];
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    // 先压缩图片
    UIImage *compressImage = [self.image compressImageTo:300];
    
    // 点击屏幕磨砂图片
    UIImage *effectImage = [compressImage applyLightEffect];
    
    // 赋值
    self.imageView.image = effectImage;
    
}



#pragma mark - 打开相册
- (void)openAlbum{
    
    UIImagePickerController *imagePickerVc =[[UIImagePickerController alloc] init];
    imagePickerVc.delegate = self;
    
    imagePickerVc.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    
    [self presentViewController:imagePickerVc animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    // 获取图片
    UIImage *image = info[@"UIImagePickerControllerOriginalImage"];
    
    [self dismissViewControllerAnimated:YES completion:^{
        
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
        
        self.imageView.image = image;
        
        self.image = image;
    }];
}





@end
