//
//  ViewController.m
//  PopOverTest
//
//  Created by FYTech on 2018/10/12.
//  Copyright © 2018年 fengyangtech. All rights reserved.
//

#import "ViewController.h"
#import "MyPopViewController.h"
#import "MyPopoverBackgroundView.h"

@interface ViewController ()<UIPopoverPresentationControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.view.backgroundColor = [UIColor redColor];
}

//https://developer.apple.com/library/archive/featuredarticles/ViewControllerPGforiPhoneOS/PresentingaViewController.html#//apple_ref/doc/uid/TP40007457-CH14-SW1
//1. 纯代码
- (IBAction)add:(id)sender{
    
    MyPopViewController *myPopViewController = [[MyPopViewController alloc] init];
    myPopViewController.view.backgroundColor = [UIColor redColor];
    myPopViewController.modalPresentationStyle = UIModalPresentationPopover;
    myPopViewController.preferredContentSize = CGSizeMake(100, 100);
    myPopViewController.popoverPresentationController.barButtonItem = sender;
    myPopViewController.popoverPresentationController.delegate = self;
    
    [self presentViewController:myPopViewController animated:YES completion:^{
        
    }];
}

//2. storyborad segue 方式实现，segue设置参考Main.storyborad
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"popOver"]) {
        UIViewController *control = segue.destinationViewController;
        control.popoverPresentationController.delegate = self;
        
        control.popoverPresentationController.popoverBackgroundViewClass = [MyPopoverBackgroundView class];
        
        control.popoverPresentationController.backgroundColor = [UIColor redColor];
    }
}

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller{
    return UIModalPresentationNone;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
