//
//  ViewController.h
//  LLOpenShareTool
//
//  Created by 李龙 on 16/11/17.
//  Copyright © 2016年 李龙. All rights reserved.
//

#import <UIKit/UIKit.h>




//重写NSLog,Debug模式下打印日志和当前行数
#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d\n%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif

@interface ViewController : UIViewController


@end

