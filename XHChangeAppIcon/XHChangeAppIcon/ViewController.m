//
//  ViewController.m
//  XHChangeAppIcon
//
//  Created by douhuo on 2021/2/23.
//

#import "ViewController.h"
#import "UIViewController+XHNoPresent.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    {
        
        UIButton * btn1 = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [btn1 setBackgroundImage:[UIImage imageNamed:@"Logo"] forState:(UIControlStateNormal)];
        [btn1 addTarget:self action:@selector(changeIcon:) forControlEvents:(UIControlEventTouchUpInside)];
        btn1.frame = CGRectMake(50, 100, 50, 50);
        btn1.tag = 5000;
        [self.view addSubview:btn1];
    }
    {
        UIButton * btn1 = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [btn1 setBackgroundImage:[UIImage imageNamed:@"Logo1"] forState:(UIControlStateNormal)];
        [btn1 addTarget:self action:@selector(changeIcon:) forControlEvents:(UIControlEventTouchUpInside)];
        btn1.frame = CGRectMake(50, 200, 50, 50);
        btn1.tag = 5001;
        [self.view addSubview:btn1];
    }
    {
        UIButton * btn1 = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [btn1 setBackgroundImage:[UIImage imageNamed:@"Logo2"] forState:(UIControlStateNormal)];
        [btn1 addTarget:self action:@selector(changeIcon:) forControlEvents:(UIControlEventTouchUpInside)];
        btn1.frame = CGRectMake(50, 300, 50, 50);
        btn1.tag = 5002;
        [self.view addSubview:btn1];
    }
    
    
}

- (void)changeIcon:(UIButton *)sender {
    NSString * nameStr = sender.tag == 5000 ? @"Logo0" : (sender.tag == 5001 ? @"Logo1" : @"Logo2");
    [self changeAppIconWithName:nameStr];
}

- (void)changeAppIconWithName:(NSString *)iconName {
    if (![[UIApplication sharedApplication] supportsAlternateIcons]) {
        return;
    }
    if ([iconName isEqualToString:@""]) {
        iconName = nil;
    }
    [[UIApplication sharedApplication] setAlternateIconName:iconName completionHandler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"更换app图标发生错误了 ： %@",error);
        }
    }];
}




@end
