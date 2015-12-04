//
//  ViewController.m
//  CallBack_Demo
//
//  Created by 张润峰 on 15/12/4.
//  Copyright © 2015年 张润峰. All rights reserved.
//

#import "ViewController.h"

typedef void(^ myBlock)(NSString *);

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - Delegate Callback

- (IBAction)delegateCallback:(id)sender {
    NSString *s = @"delegateCallback";
    _textLabel.text = s;
    
    [self.delegate showStringWithDelegate:s];
}

- (void)showStringWithDelegate:(NSString *)string{
    _textLabel.text = string;
}

#pragma mark - Notification Callback

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(outputWithNote:) name:@"OutputArrayNotification" object:nil];
}

- (void)viewWillDisappear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"OutputArrayNotification" object:nil];
}
- (IBAction)notificationCallback:(id)sender {
    NSString *s = @"NitificationCallback";
    [[NSNotificationCenter defaultCenter] postNotificationName:@"OutputArrayNotification" object:s];
}

- (void)outputWithNote:(NSNotification *)aNotification
{
    NSString *s = [aNotification object];
    _textLabel.text = s;
}

#pragma mark - Block Callback

- (IBAction)blockCallback:(id)sender {
    [self showStringWithBlock:^(NSString *s) {
        _textLabel.text = s;
    }];
}

- (void)showStringWithBlock:(myBlock)block{
    NSString *s = @"BlockCallback";
    block(s);
}

@end
