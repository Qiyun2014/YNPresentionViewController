//
//  ViewController.m
//  YNPresentionViewController
//
//  Created by qiyun on 16/6/20.
//  Copyright © 2016年 qiyun. All rights reserved.
//

#import "ViewController.h"
#import "GDUDetailViewController.h"
#import "GDUViewControllerAnimator.h"

@interface ViewController ()<UIViewControllerTransitioningDelegate>

- (IBAction)presentAction:(id)sender;
@property (nonatomic, strong) GDUViewControllerAnimator *animator;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _animator = [[GDUViewControllerAnimator alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)presentAction:(id)sender {
    
    GDUDetailViewController *detailVC = [[GDUDetailViewController alloc] init];
    detailVC.transitioningDelegate = self;
    [self.navigationController presentViewController:detailVC animated:YES completion:nil];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                            presentingController:(UIViewController *)presenting
                                                                                sourceController:(UIViewController *)source{
    _animator.presenting = YES;
    return _animator;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    
    _animator.presenting = NO;
    return _animator;
}


@end
