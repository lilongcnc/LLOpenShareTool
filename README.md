# LLOpenShareTool

###前言
之前已经写过分享的封装,当时介绍了友盟和ShareSDK,这一次又写了这方面的封装,是因为安装包瘦身的需要,所有之前引用第三方和官方SDK的做法就变得不可取了.

项目安装包瘦身移步:
[《23- iOS项目安装包瘦身——从三方登录，分享，支付开始》](http://www.jianshu.com/p/29dbda0125f0)

###关于OpenShare
先上一个优秀的项目地址:[OpenShare]()
简单的介绍下,OpenShare是作者因为上述原因,所以专门调试了一下各个平台的SDK，研究了各个厂商实现的应用程序间通信的规则,在不使用官方SDK的基础上,对官方SDK提供的
>
- 登录
- 分享
- 支付

三个核心功能的封装. 其设计思路,在作者的项目介绍和相关文章中提供了详细的说明.我这里就不赘述了.

但是OpenShare并没有对界面进行,另外相对我们自己的项目,它其实也还是第三方,所以,我依然对其进行了简单的封装,并且模仿即刻的分享界面增加了分享界面.  
关于使用方面,作者的Demo中使用其实已经足够简单,我这里只是以微信分享为例子,进行了封装,其余的平台,大家可以自行在其上边扩展.

###怎么使用

1. 分享注意点
    关于分享的各个注意点和可能出现的问题,我之前也写过[《shareSDK的 Demo 和社会化分享小结》](http://www.jianshu.com/p/5b5c2293b11c) 和示例代码[LLShareSDKTool](https://github.com/lilongcnc/LLShareSDKTool),关于这一部分,大家可以移步看这里.

2.  注册分享参数
    关于分享参数的注册,并没有放到Appdelegate文件中,尽可能的减少对程序启动的干扰,什么时候用到什么调用. 
   另外,在之前的`LLShareSDKTool`中和`Miss唐的友盟分享`中,点击分享之后再注册,会有1~2秒的卡顿,不知道是不是这两个三方分享集成平台自身对官方SDK处理不合理的问题. 
   
   重点来了,**在OpenShare则不会出现这种问题.**
  
3. 分享,分享回调.
   根据分享的内容,调用具体的分享方法,分享完毕后,获取分享的回调.
      
4. 调用分享界面
    注册分享参数完成之后,直接调用分享界面就可以执行分享了.

所以整个使用代码就是
    
    //1. 注册分享参数
    [LLOpenShareTool sharedInstance] registerShareWeChatWithAppID:@xxx" sinaWithAppKey:@"xxx" QQWithAppKey:@"xxx"];
    //2. 调用分享方法,这里以分享链接为例子
    [[LLOpenShareTool sharedInstance] WeChatShareURLWithTitle:@"分享链接" shareURL:@"www.lilongcnc.cc" urlImage:[UIImage imageNamed:@"test"] successFromChat:^{
        NSLog(@"分享链接成功");
    } failureFromChat:^(NSString *failureInfo) {
        
        NSLog(@"分享链接失败:%@",failureInfo);
    } successFromFriend:^{
        NSLog(@"分享链接成功");
        
    } failureFromFriend:^(NSString *failureInfo) {
        NSLog(@"分享链接失败:%@",failureInfo);
    }];
    //3. 调用分享界面
    [[LLOpenShareTool sharedInstance] show];
    

项目的完整地址: [LLOpenShareTool](https://github.com/lilongcnc/LLOpenShareTool)

### 交流
![](http://upload-images.jianshu.io/upload_images/594219-cea3f887e6abdadc.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* * *

希望能和大家交流技术
Blog:<http://www.lilongcnc.cc>
* * *


