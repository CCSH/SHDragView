//
//  SHDragView.h
//  SHDragView
//
//  Created by CSH on 2018/8/3.
//  Copyright © 2018年 CSH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHDragView : UIView

//最小
@property (nonatomic, assign) CGPoint minPoint;
//最大
@property (nonatomic, assign) CGPoint maxPoint;

//开始动画
- (void)showSHDragView;

@end
