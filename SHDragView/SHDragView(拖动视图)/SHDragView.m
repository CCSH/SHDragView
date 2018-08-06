//
//  SHDragView.m
//  SHDragView
//
//  Created by CSH on 2018/8/3.
//  Copyright © 2018年 CSH. All rights reserved.
//

#import "SHDragView.h"

@implementation SHDragView

- (void)showSHDragView{
    
    self.userInteractionEnabled = YES;
    
    //添加拖动效果
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panAction:)];
    [self addGestureRecognizer:pan];
}

#pragma mark 拖动事件
- (void)panAction:(UIPanGestureRecognizer *)gest{
    
    switch (gest.state) {
        case UIGestureRecognizerStateEnded://结束拖动
        {
            CGPoint point = self.frame.origin;

            if (point.y < self.minPoint.y){//上
                point.y = self.minPoint.y;
            }else if (point.y > self.maxPoint.y){//下
                point.y = self.maxPoint.y;
            }
            
            CGFloat view_center = [UIScreen mainScreen].bounds.size.width/2;

            if (self.center.x < view_center) {//左
                point.x = self.minPoint.x;
            }else if (self.center.x >= view_center){//右
                point.x = self.maxPoint.x;
            }

            [UIView animateWithDuration:0.2 animations:^{
                CGRect frame = self.frame;
                frame.origin = point;
                self.frame = frame;
            }];
        }
            break;
        case UIGestureRecognizerStateChanged://拖动中
        {
            CGPoint center = [gest locationInView:self.superview];
            self.center = center;
        }
            break;
        default:
            break;
    }
}

@end
