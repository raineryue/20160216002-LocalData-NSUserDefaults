//
//  ViewController.m
//  20160216002-LocalData-NSUserDefaults
//
//  Created by Rainer on 16/2/16.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "ViewController.h"

// 创建一个NSUserDefaults对象:在沙盒中的位置：/Library/Preferences
#define kUserDefault [NSUserDefaults standardUserDefaults]

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

/**
 *  存储按钮点击事件
 */
- (IBAction)saveClickAction:(id)sender {
    NSString *documentsPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];

    NSLog(@"%@", documentsPath);
    
    // 通过键值的方法将数据添加到NSUserDefaults对象中
    [kUserDefault setObject:@"Rainer" forKey:@"LoginName"];
    [kUserDefault setObject:@"123456" forKey:@"Password"];
    
    // 同步NSUserDefaults对象到沙盒中
    [kUserDefault synchronize];
}

/**
 *  读取按钮点击事件
 */
- (IBAction)readClickAction:(id)sender {
    // 通过键值的方法从NSUserDefaults对象中读取数据
    NSString *loginName = [kUserDefault objectForKey:@"LoginName"];
    NSString *password = [kUserDefault objectForKey:@"Password"];
    
    NSLog(@"LoginName:%@, Password:%@", loginName, password);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
