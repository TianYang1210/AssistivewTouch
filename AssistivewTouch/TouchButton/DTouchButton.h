//
//  DTouchButton.h
//  类似IPhone_AssitiveTouch圆点
//
//  Created by 陈绪混 on 16/3/2.
//  Copyright © 2016年 Chenxuhun. All rights reserved.
//

#import <UIKit/UIKit.h>
//拖载Button的持续时长
#define DTAnimationDuration .3f
//按钮在屏幕隐藏的部分(0 -- 1)
#define DTInScreenPoint 1

@protocol touchDelegate <NSObject>

-(void) touchDownDTButton;

@end

@interface DTouchButton : UIButton

@property(nonatomic,weak) id<touchDelegate> delegate;
@property(nonatomic,assign)BOOL userInteractionEnabled_DT;

@end
