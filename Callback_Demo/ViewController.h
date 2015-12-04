//
//  ViewController.h
//  CallBack_Demo
//
//  Created by 张润峰 on 15/12/4.
//  Copyright © 2015年 张润峰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CallBackDelegate.h"

@interface ViewController : UIViewController<CallBackDelegate>

@property (weak, nonatomic) id<CallBackDelegate> delegate;

@end

