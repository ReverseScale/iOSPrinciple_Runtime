//
//  ExtViewController.m
//  iOSPrinciple_Runtime
//
//  Created by WhatsXie on 2018/5/8.
//  Copyright © 2018年 WhatsXie. All rights reserved.
//

#import "ExtViewController.h"
#import <objc/runtime.h>

@interface ExtViewController ()

@end

@implementation ExtViewController

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        SEL originalSelector = @selector(viewDidLoad);
        SEL swizzledSelector = @selector(jkviewDidLoad);
        
        Method originalMethod = class_getInstanceMethod(class,originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class,swizzledSelector);
        
        //judge the method named  swizzledMethod is already existed.
        BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        // if swizzledMethod is already existed.
        if (didAddMethod) {
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}
- (void)jkviewDidLoad {
    self.view.backgroundColor = UIColor.whiteColor;
    NSLog(@"替换的方法");
    [self jkviewDidLoad];
}
- (void)viewDidLoad {
    self.view.backgroundColor = UIColor.whiteColor;
    NSLog(@"自带的方法");
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
