
//
//  LLOpenShareTool.m
//  LLOpenShareTool
//
//  Created by 李龙 on 16/11/17.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import "LLOpenShareTool.h"
#import "HXEasyCustomShareView.h"
#import "OpenShareHeader.h"


#define LLScreenWidth            ([[UIScreen mainScreen] bounds].size.width)
#define LLScreenHeight           ([[UIScreen mainScreen] bounds].size.height)
#define LLStrISCanUse(appID)    (appID == nil || [appID isEqualToString:@""])

//重写NSLog,Debug模式下打印日志和当前行数
#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d\n%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif



@interface LLOpenShareTool ()

@property (nonatomic,strong) OSMessage *myMsg;

@property (nonatomic,copy) void (^mySuccessChat) ();
@property (nonatomic,copy) void (^myFailureChat) (NSString *failureInfo) ;
@property (nonatomic,copy) void (^mySuccessFriend) ();
@property (nonatomic,copy) void (^myFailureFriend) (NSString *failureInfo);


@end

@implementation LLOpenShareTool

- (OSMessage *)myMsg
{
    if (!_myMsg) {
        _myMsg = [[OSMessage alloc] init];
    }
    return _myMsg;
}

ILSingleton_M

-(void)registerShareWeChatWithAppID:(NSString *)WxappID sinaWithAppKey:(NSString *)WBappKey QQWithAppKey:(NSString *)QQappKey
{
    if(!LLStrISCanUse(WxappID)){
        [OpenShare connectWeixinWithAppId:WxappID];
    }
    
    if(!LLStrISCanUse(WBappKey)){
        [OpenShare connectWeiboWithAppKey:WBappKey];
    }
    if(!LLStrISCanUse(QQappKey)){
        [OpenShare connectQQWithAppId:QQappKey];
    }
//    [OpenShare connectRenrenWithAppId:@"228525" AndAppKey:@"1dd8cba4215d4d4ab96a49d3058c1d7f"];
}

-(void)showInView:(UIView *)view{
    [self addGuanjiaShareViewIn:view];
}

-(void)show{
    [self addGuanjiaShareViewIn:nil];
}

-(void)close{
    
}

- (void)addGuanjiaShareViewIn:(UIView *)view {
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
    
    
    HXEasyCustomShareView *shareView = [[HXEasyCustomShareView alloc] initWithFrame:CGRectMake(0, 0, LLScreenWidth, LLScreenHeight)];
    shareView.backView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    float height = [shareView getBoderViewHeight:shareAry firstCount:2];
    shareView.boderView.frame = CGRectMake(0, 0, shareView.frame.size.width, height);
    shareView.middleLineLabel.hidden = YES;
    shareView.cancleButton.frame = CGRectMake(shareView.cancleButton.frame.origin.x, shareView.cancleButton.frame.origin.y, shareView.cancleButton.frame.size.width, 54);
    shareView.cancleButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [shareView.cancleButton setTitleColor:[UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1.0] forState:UIControlStateNormal];
    [shareView setShareAry:shareAry delegate:self];
    
    
    [view==nil?[UIApplication sharedApplication].keyWindow:view addSubview:shareView];
}


#pragma mark HXEasyCustomShareViewDelegate
- (void)easyCustomShareViewButtonAction:(HXEasyCustomShareView *)shareView title:(NSString *)title {
    NSLog(@"当前点击:%@",title);
    if (_myMsg == nil)
        return;
    NSLog(@"执行分享");
    if ([title isEqualToString:@"微信"]) {
        
        [OpenShare shareToWeixinSession:_myMsg Success:^(OSMessage *message) {
            NSLog(@"微信分享到会话成功：\n%@",message);
            if (_mySuccessChat)
                _mySuccessChat();
            
        } Fail:^(OSMessage *message, NSError *error) {
            NSLog(@"微信分享到会话失败：\n%@\n%@",error,message);
            if (_myFailureChat)
                _myFailureChat(@"分享失败");
        }];
        
    }else if([title isEqualToString:@"朋友圈"]){
        [OpenShare shareToWeixinTimeline:_myMsg Success:^(OSMessage *message) {
            NSLog(@"微信分享到朋友圈成功：\n%@",message);
            if (_mySuccessFriend)
                _mySuccessFriend();
        } Fail:^(OSMessage *message, NSError *error) {
            NSLog(@"微信分享到朋友圈失败：\n%@\n%@",error,message);
            if (_myFailureFriend)
                _myFailureFriend(@"分享失败");
        }];
    }
    
}


#pragma mark ================ 微信分享 ================
/**
 微信分享- 文字
 */
- (void)WeChatShareWordWithTitle:(NSString *)contentTitle
             contentDescription:(NSString *)contentDescription
                successFromChat:(void (^)())successChat
                failureFromChat:(void (^)(NSString *failureInfo))failureChat
              successFromFriend:(void (^)())successFriend
              failureFromFriend:(void (^)(NSString *failureInfo))failureFriend{
    [self clearShareData];

    self.myMsg.title= contentTitle;
    self.myMsg.desc= contentDescription;
    
    _mySuccessChat = successChat;
    _myFailureChat = failureChat;
    _mySuccessFriend = successFriend;
    _myFailureFriend = failureFriend;
}



/**
 微信分享- 图片
 */
- (void)WeChatShareImageWithTitle:(NSString *)contentTitle
                           image:(UIImage *)image
                  thumbnailImage:(UIImage *)thumbnailImage
                 successFromChat:(void (^)())successChat
                 failureFromChat:(void (^)(NSString *failureInfo))failureChat
               successFromFriend:(void (^)())successFriend
               failureFromFriend:(void (^)(NSString *failureInfo))failureFriend{
    [self clearShareData];

    self.myMsg.title = contentTitle;
    self.myMsg.image = image;
    self.myMsg.thumbnail = thumbnailImage;
    
    _mySuccessChat = successChat;
    _myFailureChat = failureChat;
    _mySuccessFriend = successFriend;
    _myFailureFriend = failureFriend;
}




/**
  微信分享- 链接
 */
- (void)WeChatShareURLWithTitle:(NSString *)contentTitle
                      shareURL:(NSString *)contentURL
                      urlImage:(UIImage *)urlImage
               successFromChat:(void (^)())successChat
               failureFromChat:(void (^)(NSString *failureInfo))failureChat
             successFromFriend:(void (^)())successFriend
             failureFromFriend:(void (^)(NSString *failureInfo))failureFriend{
    [self clearShareData];

    self.myMsg.title = contentTitle;
    self.myMsg.link = contentURL;
    self.myMsg.image = urlImage;

    _mySuccessChat = successChat;
    _myFailureChat = failureChat;
    _mySuccessFriend = successFriend;
    _myFailureFriend = failureFriend;
}



/**
  微信分享- 音乐
 */
- (void)WeChatShareMusicWithTitle:(NSString *)contentTitle
                    mediaDataUrl:(NSString *)mediaDataUrl
                       musicLink:(NSString *)musicLink
             musicThumbnailImage:(UIImage *)musicThumbnailImage
                 successFromChat:(void (^)())successChat
                 failureFromChat:(void (^)(NSString *failureInfo))failureChat
               successFromFriend:(void (^)())successFriend
               failureFromFriend:(void (^)(NSString *failureInfo))failureFriend{
    [self clearShareData];

    self.myMsg.title = contentTitle;
    self.myMsg.mediaDataUrl = mediaDataUrl;
    self.myMsg.link = musicLink;
    self.myMsg.thumbnail = musicThumbnailImage;
    self.myMsg.multimediaType = OSMultimediaTypeAudio;

    _mySuccessChat = successChat;
    _myFailureChat = failureChat;
    _mySuccessFriend = successFriend;
    _myFailureFriend = failureFriend;
}



/**
  微信分享-视频链接
 */
- (void)WeChatShareVideoWithTitle:(NSString *)contentTitle
                       videoLink:(NSString *)videoLink
                      videoImage:(UIImage *)videoImage
                 successFromChat:(void (^)())successChat
                 failureFromChat:(void (^)(NSString *failureInfo))failureChat
               successFromFriend:(void (^)())successFriend
               failureFromFriend:(void (^)(NSString *failureInfo))failureFriend{
    [self clearShareData];
    self.myMsg.title = contentTitle;
    self.myMsg.link = videoLink;
    self.myMsg.multimediaType = OSMultimediaTypeVideo;
    self.myMsg.thumbnail = videoImage;
    
    _mySuccessChat = successChat;
    _myFailureChat = failureChat;
    _mySuccessFriend = successFriend;
    _myFailureFriend = failureFriend;
}

- (void)clearShareData{
    _myMsg = nil;
}

@end
