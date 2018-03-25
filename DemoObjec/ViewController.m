//
//  ViewController.m
//  DemoObjec
//
//  Created by mironal on 2018/03/21.
//  Copyright © 2018年 mironal. All rights reserved.
//

#import "ViewController.h"

@import ShortHandAlert;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"tltle" message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alert default:@"" handler:nil];
    [alert default:@"" handlerWithTextField:nil];
    [alert cancel:@"" handler:nil];
    [alert cancel:@"" handlerWithTextField:nil];
    [alert ok:nil];
    [alert okWithTextField:nil];
    [alert destructive:@"" handler:nil];
    [alert destructive:@"" handlerWithTextField:nil];
    [alert textField:nil placeholder:nil];
    [alert textField:nil];
    [alert presentIn:self animated:YES completion:nil];


    AlertBuilder *builder = [AlertBuilder.alloc init];
    [[[builder confirmWithTitle:nil message:nil] approve] presentIn:self];
    [[[[builder suggestWithTitle:nil message:nil] cancel] approve] presentIn:self];
}

@end
