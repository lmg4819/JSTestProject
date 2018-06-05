//
//  JSHeaderScrollView.m
//  JSEmojiView
//
//  Created by 罗孟歌 on 2017/5/19.
//  Copyright © 2017年 罗孟歌. All rights reserved.
//

#import "JSHeaderScrollView.h"

@implementation JSHeaderScrollView
{
    UILabel *_label;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, frame.size.width, 20)];
        label.textColor = [UIColor lightGrayColor];
        label.font = [UIFont systemFontOfSize:15];
        [self addSubview:label];
        _label = label;
    }
    return self;
}

-(void)setTitle:(NSString *)title
{
    if (_title != title) {
        _label.text = title;
    }
    
}


@end
