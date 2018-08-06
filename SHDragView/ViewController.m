//
//  ViewController.m
//  SHDragView
//
//  Created by CSH on 2018/8/3.
//  Copyright © 2018年 CSH. All rights reserved.
//

#import "ViewController.h"
#import "SHDragView.h"

@interface ViewController ()

@property (nonatomic, strong) SHDragView *dragView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.dragView showSHDragView];
    
    CGRect frame = self.dragView.frame;
    frame.origin.x = self.view.frame.size.width;
    self.dragView.frame = frame;
    [UIView animateWithDuration:0.2 animations:^{
        
        CGRect frame2 = self.dragView.frame;
        frame2.origin.x = self.view.frame.size.width - 70 - 6;
        self.dragView.frame = frame2;
    }];
    
}

- (SHDragView *)dragView{
    if (!_dragView) {
        _dragView = [[SHDragView alloc]init];
        _dragView.frame = CGRectMake(self.view.frame.size.width - 70 - 6, 200, 70, 70);
        _dragView.backgroundColor = [UIColor orangeColor];
        _dragView.minPoint = CGPointMake(6,20 + 6);
        _dragView.maxPoint = CGPointMake(_dragView.frame.origin.x, self.view.frame.size.height - _dragView.frame.size.height - 6);
        [self.view addSubview:_dragView];
    }
    return _dragView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
