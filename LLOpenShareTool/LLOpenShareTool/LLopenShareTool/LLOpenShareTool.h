//
//  LLOpenShareTool.h
//  LLOpenShareTool
//
//  Created by 李龙 on 16/11/17.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ILSingletom.h"
#import <UIKit/UIKit.h>

@interface LLOpenShareTool : NSObject

ILSingleton_H

- (void)registerShareWeChatWithAppID:(NSString *)WxappID sinaWithAppKey:(NSString *)WBappKey QQWithAppKey:(NSString *)QQappKey;
- (void)showInView:(UIView *)view;
- (void)show;
- (void)close;

/**
 微信分享- 文字

 @param contentTitle 标题
 @param contentDescription 描述
 @param successChat 聊天分享成功
 @param failureChat 聊天分享失败
 @param successFriend 朋友圈分享成功
 @param failureFriend 朋友圈分享失败
 */
- (void)WeChatShareWordWithTitle:(NSString *)contentTitle
             contentDescription:(NSString *)contentDescription
                successFromChat:(void (^)())successChat
                failureFromChat:(void (^)(NSString *failureInfo))failureChat
                successFromFriend:(void (^)())successFriend
              failureFromFriend:(void (^)(NSString *failureInfo))failureFriend;



- (void)WeChatShareImageWithTitle:(NSString *)contentTitle
                           image:(UIImage *)image
                  thumbnailImage:(UIImage *)thumbnailImage
                  successFromChat:(void (^)())successChat
                  failureFromChat:(void (^)(NSString *failureInfo))failureChat
                successFromFriend:(void (^)())successFriend
                failureFromFriend:(void (^)(NSString *failureInfo))failureFriend;




- (void)WeChatShareURLWithTitle:(NSString *)contentTitle
                      shareURL:(NSString *)contentURL
                      urlImage:(UIImage *)urlImage
                successFromChat:(void (^)())successChat
                failureFromChat:(void (^)(NSString *failureInfo))failureChat
              successFromFriend:(void (^)())successFriend
              failureFromFriend:(void (^)(NSString *failureInfo))failureFriend;



- (void)WeChatShareMusicWithTitle:(NSString *)contentTitle
                    mediaDataUrl:(NSString *)mediaDataUrl
                       musicLink:(NSString *)musicLink
             musicThumbnailImage:(UIImage *)musicThumbnailImage
                  successFromChat:(void (^)())successChat
                  failureFromChat:(void (^)(NSString *failureInfo))failureChat
                successFromFriend:(void (^)())successFriend
                failureFromFriend:(void (^)(NSString *failureInfo))failureFriend;



- (void)WeChatShareVideoWithTitle:(NSString *)contentTitle
                        videoLink:(NSString *)videoLink
                      videoImage:(UIImage *)videoImage
                  successFromChat:(void (^)())successChat
                  failureFromChat:(void (^)(NSString *failureInfo))failureChat
                successFromFriend:(void (^)())successFriend
                failureFromFriend:(void (^)(NSString *failureInfo))failureFriend;





@end
