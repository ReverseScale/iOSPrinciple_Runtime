//
//  Runtime02ViewController.m
//  iOSPrinciple_Runtime
//
//  Created by WhatsXie on 2018/5/8.
//  Copyright © 2018年 WhatsXie. All rights reserved.
//

#import "Runtime02ViewController.h"
#import "Person.h"

@interface Runtime02ViewController ()

@end

@implementation Runtime02ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    //执行foo函数
    [self performSelector:@selector(foo)];
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    return YES;//返回YES，进入下一步转发
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    if (aSelector == @selector(foo)) {
        return [Person new];//返回Person对象，让Person对象接收这个消息
    }
    return [super forwardingTargetForSelector:aSelector];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
