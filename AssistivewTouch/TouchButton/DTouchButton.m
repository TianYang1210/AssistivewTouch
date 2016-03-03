//
//  DTouchButton.m
//  类似IPhone_AssitiveTouch圆点
//
//  Created by 陈绪混 on 16/3/2.
//  Copyright © 2016年 Chenxuhun. All rights reserved.
//

#import "DTouchButton.h"

#define Main_Sreen_Height [UIScreen mainScreen].bounds.size.height
#define Main_Srenm_Width [UIScreen mainScreen].bounds.size.width

@implementation DTouchButton
{
    CGPoint beganPoint; //开始的坐标
}

-(instancetype)initWithFrame:(CGRect)frame
{
   self = [super initWithFrame:frame];
    if (self)
    {
        self.layer.cornerRadius = 10;
        self.layer.masksToBounds = YES;
       // self.backgroundColor = [UIColor colorWithWhite:0.717 alpha:1.000];
        [self setBackgroundImage:[UIImage imageNamed:@"AsstisTouch"] forState:UIControlStateNormal];
    }
    return self;
}
/**
 *  @author 陈绪混【Alex】
 *
 *  实现UITouch Began Move Cancel 三个方法
 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (!_userInteractionEnabled_DT) {
        return;
    }
    UITouch *touch = [touches anyObject];
    
    beganPoint = [touch locationInView:self];
    
    self.alpha = 1;
    
    UITapGestureRecognizer *tapGestureRecognizer =
    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognizer)] ;
    [self addGestureRecognizer:tapGestureRecognizer];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (!_userInteractionEnabled_DT) {
        return;
    }
    UITouch *touch = [touches anyObject];
    
    CGPoint nowPoint = [touch locationInView:self];
    
    float offsetX = nowPoint.x - beganPoint.x;
    float offsetY = nowPoint.y - beganPoint.y;
    
    self.center = CGPointMake(self.center.x + offsetX, self.center.y + offsetY);
    
    self.alpha = 1;
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint EndPoint = [touch locationInView:self];
    float offsetX = EndPoint.x - beganPoint.x;
    float offsetY = EndPoint.y - beganPoint.y;
    
    if (self.center.x + offsetX >= Main_Srenm_Width*DTInScreenPoint/2) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:DTAnimationDuration];
        self.center = CGPointMake(Main_Srenm_Width-self.bounds.size.width*DTInScreenPoint/2,self.center.y + offsetY);
        
        [UIView commitAnimations];
    }else
    {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:DTAnimationDuration];
        self.center = CGPointMake(self.bounds.size.width*DTInScreenPoint/2,self.center.y + offsetY);
        
        [UIView commitAnimations];
    }
    if (self.center.y + offsetY >= Main_Sreen_Height-self.bounds.size.height*DTInScreenPoint/2) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:DTAnimationDuration];
        self.center = CGPointMake(self.center.x,Main_Sreen_Height-self.bounds.size.height*DTInScreenPoint/2);
        
        [UIView commitAnimations];
    }else if(self.center.y + offsetY < self.bounds.size.height*DTInScreenPoint/2)
    {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:DTAnimationDuration];
        self.center = CGPointMake(self.center.x,self.bounds.size.height*DTInScreenPoint/2);
        
        [UIView commitAnimations];
    }else
    {
        
    }
    [self performSelector:@selector(setDTAlpha) withObject:nil afterDelay:3];
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint EndPoint = [touch locationInView:self];
    float offsetX = EndPoint.x - beganPoint.x;
    float offsetY = EndPoint.y - beganPoint.y;
    
    if (self.center.x + offsetX >= Main_Srenm_Width * DTInScreenPoint/2) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:DTAnimationDuration];
        self.center = CGPointMake(Main_Srenm_Width-self.bounds.size.width*DTInScreenPoint/2,self.center.y + offsetY);
        
        [UIView commitAnimations];
    }else
    {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:DTAnimationDuration];
        self.center = CGPointMake(self.bounds.size.width*DTInScreenPoint/2,self.center.y + offsetY);
        
        [UIView commitAnimations];
    }
    if (self.center.y + offsetY >= Main_Sreen_Height-self.bounds.size.height*DTInScreenPoint/2) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:DTAnimationDuration];
        self.center = CGPointMake(self.center.x,Main_Sreen_Height-self.bounds.size.height*DTInScreenPoint/2);
        
        [UIView commitAnimations];
    }else if(self.center.y + offsetY < self.bounds.size.height*DTInScreenPoint/2)
    {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:DTAnimationDuration];
        self.center = CGPointMake(self.center.x,self.bounds.size.height*DTInScreenPoint/2);
        
        [UIView commitAnimations];
    }else
    {
        
    }
}

-(void)setDTAlpha
{
    [UIView animateWithDuration:.3 animations:^{
        self.alpha = .5;
    }];
}
//点击DTButton响应方法
-(void)tapGestureRecognizer
{
    if ([self.delegate respondsToSelector:@selector(touchDownDTButton)])
    {
        [self.delegate touchDownDTButton];
    }
    
}

@end
