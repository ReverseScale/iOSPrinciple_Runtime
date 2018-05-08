//
//  ViewController.m
//  iOSPrinciple_Runtime
//
//  Created by WhatsXie on 2018/5/8.
//  Copyright © 2018年 WhatsXie. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "Runtime01ViewController.h"
#import "Runtime02ViewController.h"
#import "Runtime03ViewController.h"
#import "ExtViewController.h"
@interface UIView (DefaultColor)
@property (nonatomic, strong) UIColor *defaultColor;
@end

@implementation UIView (DefaultColor)

@dynamic defaultColor;

static char kDefaultColorKey;

- (void)setDefaultColor:(UIColor *)defaultColor {
    objc_setAssociatedObject(self, &kDefaultColorKey, defaultColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (id)defaultColor {
    return objc_getAssociatedObject(self, &kDefaultColorKey);
}
@end


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *test = [UIView new];
    test.defaultColor = [UIColor blackColor];
    NSLog(@"%@", test.defaultColor);
}
- (IBAction)action01:(id)sender {
    Runtime01ViewController *vc = [Runtime01ViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)action02:(id)sender {
    Runtime02ViewController *vc = [Runtime02ViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)action03:(id)sender {
    Runtime03ViewController *vc = [Runtime03ViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)actionExt:(id)sender {
    ExtViewController *vc = [ExtViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
