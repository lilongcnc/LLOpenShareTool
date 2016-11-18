//
//  ILSingletom.h
//  meituan_1
//
//  Created by 李龙 on 15/2/4.
//  Copyright (c) 2015年 Lauren. All rights reserved.
//

#ifndef meituan_1_ILSingletom_h
#define meituan_1_ILSingletom_h //格式，防止内容重复包含


#define ILSingleton_H + (instancetype)sharedInstance; //头文件的.h写法,和方法的声明

//下边是.m文件，单例方法的实现，用"\"拼接
#define ILSingleton_M \
static id _instance; \
+ (instancetype)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
} \
+ (instancetype)sharedInstance \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [[self alloc] init]; \
}); \
return _instance; \
}

#endif//格式，防止内容重复包含
