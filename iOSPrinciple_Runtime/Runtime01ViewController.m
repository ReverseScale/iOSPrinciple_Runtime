//
//  Runtime01ViewController.m
//  iOSPrinciple_Runtime
//
//  Created by WhatsXie on 2018/5/8.
//  Copyright © 2018年 WhatsXie. All rights reserved.
//

#import "Runtime01ViewController.h"
#import <objc/runtime.h>
@interface Runtime01ViewController ()

@end

@implementation Runtime01ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [self performSelector:@selector(foo:)];
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == @selector(foo:)) {//如果是执行foo函数，就动态解析，指定新的IMP
        class_addMethod([self class], sel, (IMP)fooMethod, "v@:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

void fooMethod(id obj, SEL _cmd) {
    NSLog(@"Doing foo");//新的foo函数
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
