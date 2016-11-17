//
//  ViewController.m
//  LLOpenShareTool
//
//  Created by 李龙 on 16/11/17.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import "ViewController.h"
#import "HXEasyCustomShareView.h"
#import "OpenShareHeader.h"

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
    //第一步：注册key
    [OpenShare connectQQWithAppId:@"1103194207"];
    [OpenShare connectWeiboWithAppKey:@"402180334"];
    [OpenShare connectWeixinWithAppId:@"wxd930ea5d5a258f4f"];
    [OpenShare connectRenrenWithAppId:@"228525" AndAppKey:@"1dd8cba4215d4d4ab96a49d3058c1d7f"];
    [OpenShare connectAlipay];//支付宝参数都是服务器端生成的，这里不需要key.
}

/**
 分享

 @param sender <#sender description#>
 */
- (IBAction)shareBtnOnClick:(id)sender {
    
    [self addGuanjiaShareView];
    
}



- (void)addGuanjiaShareView {
    NSArray *shareAry = @[@{@"image":@"shareView_wx",
                            @"title":@"微信"},
                          @{@"image":@"shareView_friend",
                            @"title":@"朋友圈"},
                          @{@"image":@"shareView_qq",
                            @"title":@"QQ"},
                          @{@"image":@"shareView_wb",
                            @"title":@"新浪微博"},
                          @{@"image":@"shareView_rr",
                            @"title":@"人人网"},
                          @{@"image":@"shareView_qzone",
                            @"title":@"QQ空间"},
                          @{@"image":@"shareView_msg",
                            @"title":@"短信"},
                          @{@"image":@"share_copyLink",
                            @"title":@"复制链接"}];
    
    
    HXEasyCustomShareView *shareView = [[HXEasyCustomShareView alloc] initWithFrame:CGRectMake(0, 0, CGMMainScreenWidth, CGMMainScreenHeight)];
    shareView.backView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    float height = [shareView getBoderViewHeight:shareAry firstCount:2];
    shareView.boderView.frame = CGRectMake(0, 0, shareView.frame.size.width, height);
    shareView.middleLineLabel.hidden = YES;
    shareView.cancleButton.frame = CGRectMake(shareView.cancleButton.frame.origin.x, shareView.cancleButton.frame.origin.y, shareView.cancleButton.frame.size.width, 54);
    shareView.cancleButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [shareView.cancleButton setTitleColor:[UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1.0] forState:UIControlStateNormal];
    [shareView setShareAry:shareAry delegate:self];
    
    [self.view addSubview:shareView];
}

#pragma mark HXEasyCustomShareViewDelegate

- (void)easyCustomShareViewButtonAction:(HXEasyCustomShareView *)shareView title:(NSString *)title {
    NSLog(@"当前点击:%@",title);
    
    if ([title isEqualToString:@"微信"]) {
        
    }else if([title isEqualToString:@"朋友圈"]){
    
    
    }
    
    
}


@end
