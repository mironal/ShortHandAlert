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

    [alert default:@"" addAction:YES handler:nil];
    [alert default:@"" addAction:YES handlerWithTextField:nil];

    [alert okToAddAction:YES handler:nil];
    [alert okToAddAction:YES handlerWithTextField:nil];


    [alert cancel:@"" addAction:YES handler:nil];
    [alert cancel:@"" toAddAction:YES handlerWithTextField:nil];

    [alert destructive:@"" addAction:YES handler:nil];
    [alert destructive:@"" toAddAction:YES handlerWithTextField:nil];

    [alert presentIn:self animated:YES completion:nil];

    AlertBuilder *builder = [AlertBuilder.alloc init];
    [[[builder confirmWithTitle:nil message:nil] approve] presentIn:self];
    [[[[builder suggestWithTitle:nil message:nil] cancel] approve] presentIn:self];
}

@end
