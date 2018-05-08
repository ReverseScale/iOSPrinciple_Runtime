//
//  Runtime03ViewController.m
//  iOSPrinciple_Runtime
//
//  Created by WhatsXie on 2018/5/8.
//  Copyright © 2018年 WhatsXie. All rights reserved.
//

#import "Runtime03ViewController.h"
#import "Person.h"

@interface Runtime03ViewController ()

@end

@implementation Runtime03ViewController

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
    return nil;//返回nil，进入下一步转发
}
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if ([NSStringFromSelector(aSelector) isEqualToString:@"foo"]) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];//签名，进入forwardInvocation
    }
    return [super methodSignatureForSelector:aSelector];
}
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    SEL sel = anInvocation.selector;
    Person *p = [Person new];
    if([p respondsToSelector:sel]) {
        [anInvocation invokeWithTarget:p];
    } else {
        [self doesNotRecognizeSelector:sel];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
