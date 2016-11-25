//
//  ViewController.m
//  LLOpenShareTool
//
//  Created by 李龙 on 16/11/17.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import "ViewController.h"
#import "LLOpenShareTool.h"


@interface ViewController ()

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




/**
 注册分享参数

 @param sender <#sender description#>
 */
- (IBAction)registerShareConfig:(id)sender {
    [[LLOpenShareTool sharedInstance] registerShareWeChatWithAppID:@"wxf9b19185fadfb46c" sinaWithAppKey:@"192207424" QQWithAppKey:@"192207424"];
    
}

/**
 分享

 @param sender <#sender description#>
 */
- (IBAction)shareBtnOnClick:(id)sender {
    
    [self registerShareConfig:nil];
    
  
    
    //分享文字
//    [[LLOpenShareTool sharedInstance] WeChatShareWordWithTitle:@"分享文字" contentDescription:@"老司机带带我!" successFromChat:^{
//        NSLog(@"分享文字成功");
//    } failureFromChat:^(NSString *failureInfo) {
//        NSLog(@"分享文字失败:%@",failureInfo);
//    } successFromFriend:nil failureFromFriend:nil];

    
    //分享链接
    [[LLOpenShareTool sharedInstance] WeChatShareURLWithTitle:@"分享链接" shareURL:@"www.lilongcnc.cc" urlImage:[UIImage imageNamed:@"test"] successFromChat:^{
        NSLog(@"分享链接成功");
    } failureFromChat:^(NSString *failureInfo) {
        
        NSLog(@"分享链接失败:%@",failureInfo);
    } successFromFriend:^{
        NSLog(@"分享链接成功");
        
    } failureFromFriend:^(NSString *failureInfo) {
        NSLog(@"分享链接失败:%@",failureInfo);
    }];
    
    
    //分享图片
//    [[LLOpenShareTool sharedInstance] WeChatShareImageWithTitle:@"分享图片" image:[UIImage imageNamed:@"test2"] thumbnailImage:[UIImage imageNamed:@"icon"] successFromChat:^{
//        
//        NSLog(@"分享图片成功");
//    } failureFromChat:^(NSString *failureInfo) {
//        NSLog(@"分享图片失败:%@",failureInfo);
//    } successFromFriend:^{
//        NSLog(@"分享图片成功");
//    } failureFromFriend:^(NSString *failureInfo) {
//        NSLog(@"分享图片失败:%@",failureInfo);
//    }];
    
    
//    //分享音乐
//    [[LLOpenShareTool sharedInstance] WeChatShareMusicWithTitle:@"分享音乐" mediaDataUrl:@"http://stream20.qqmusic.qq.com/32464723.mp3" musicLink:@"http://tech.qq.com/zt2012/tmtdecode/252.htm" musicThumbnailImage:[UIImage imageNamed:@"icon"] successFromChat:^{
//        NSLog(@"分享音乐成功");
//        
//    } failureFromChat:^(NSString *failureInfo) {
//        
//        NSLog(@"分享音乐失败:%@",failureInfo);
//    } successFromFriend:^{
//        NSLog(@"分享音乐成功");
//    } failureFromFriend:^(NSString *failureInfo) {
//        NSLog(@"分享音乐失败:%@",failureInfo);
//    }];
   
    
    
//    //分享视频链接
//    [[LLOpenShareTool sharedInstance] WeChatShareVideoWithTitle:@"分享视频链接" videoLink:@"http://v.youku.com/v_show/id_XMTM2NTgxMDg4OA==.html" videoImage:[UIImage imageNamed:@"icon"] successFromChat:^{
//        NSLog(@"分享视频成功");
//    } failureFromChat:^(NSString *failureInfo) {
//        NSLog(@"分享视频失败:%@",failureInfo);
//    } successFromFriend:^{
//        NSLog(@"分享视频成功");
//    } failureFromFriend:^(NSString *failureInfo) {
//        NSLog(@"分享视频失败:%@",failureInfo);
//    }];
    
      [[LLOpenShareTool sharedInstance] show];
}





/**
 微信支付

 @param sender <#sender description#>
 */
- (IBAction)WecahtPayBtnOnClick:(id)sender {
    
    
    
    
}

@end
