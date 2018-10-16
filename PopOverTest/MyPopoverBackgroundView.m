//
//  MyPopoverBackgroundView.m
//  PopOverTest
//
//  Created by FYTech on 2018/10/15.
//  Copyright © 2018年 fengyangtech. All rights reserved.
//

#import "MyPopoverBackgroundView.h"

@interface MyPopoverBackgroundView ()

{
    CGFloat _arrowOffset;
    UIPopoverArrowDirection _arrowDirection;
}

@property (nonatomic, strong) UIImageView *backgroundImgView;//内容区域背景
@property (nonatomic, strong) UIImageView *backArrowImgView;//小箭头背景

@end

@implementation MyPopoverBackgroundView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
// 背景图
//        UIImage *backImg = [[UIImage imageNamed:@"bg_290x@2x.png"] resizableImageWithCapInsets:UIEdgeInsetsMake([MyPopoverBackgroundView contentViewInsets].top, [MyPopoverBackgroundView contentViewInsets].left, [MyPopoverBackgroundView contentViewInsets].bottom, [MyPopoverBackgroundView contentViewInsets].right)];
        
        self.backgroundColor = [UIColor yellowColor];
        
        self.backgroundImgView = [[UIImageView alloc] init];
        self.backgroundImgView.backgroundColor = [UIColor redColor];//不同颜色显示各部分区域，方便理解
        [self addSubview:self.backgroundImgView];
        
        self.backArrowImgView = [[UIImageView alloc] init];
        self.backArrowImgView.backgroundColor = [UIColor blueColor];
        
        [self addSubview:self.backArrowImgView];
        
        
    }
    return self;
}

//按照官方文档，以下属性的相关存取方法是必须要实现的

+ (CGFloat)arrowBase{
    return 25;
}

+ (UIEdgeInsets)contentViewInsets{
    return UIEdgeInsetsMake(5, 5, 5,5);
}

+ (CGFloat)arrowHeight{
    return 20;
}


-(CGFloat)arrowOffset{
    return _arrowOffset;
}

- (void)setArrowOffset:(CGFloat)arrowOffset{
    _arrowOffset = arrowOffset;
    [self setNeedsLayout];
}

- (UIPopoverArrowDirection)arrowDirection{
    return _arrowDirection;
}

- (void)setArrowDirection:(UIPopoverArrowDirection)arrowDirection{
    _arrowDirection = arrowDirection;
    [self setNeedsLayout];
}


+ (BOOL)wantsDefaultContentAppearance{
    return NO;
}



- (void)layoutSubviews{
    
    self.backgroundImgView.frame = CGRectMake(0,[MyPopoverBackgroundView arrowHeight], self.bounds.size.width, self.bounds.size.height - [MyPopoverBackgroundView arrowHeight]);
    
    self.backArrowImgView.frame = CGRectMake(self.backgroundImgView.center.x + self.arrowOffset - [MyPopoverBackgroundView arrowBase]/2.f, 0, [MyPopoverBackgroundView arrowBase], [MyPopoverBackgroundView arrowHeight]);
    
}

@end
