//
//  JSFooterScrollView.m
//  JSEmojiView
//
//  Created by 罗孟歌 on 2017/5/19.
//  Copyright © 2017年 罗孟歌. All rights reserved.
//

#import "JSFooterScrollView.h"

@implementation JSFooterScrollView
{
    CGFloat _totolWidth;
    UIButton *_currentBtn;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.showsHorizontalScrollIndicator = NO;
    }
    return self;
}

-(void)setBtnTitleArray:(NSArray *)btnTitleArray
{
    if (_btnTitleArray != btnTitleArray) {
        _btnTitleArray = btnTitleArray;
        int count = (int)btnTitleArray.count;
        for (int i = 0; i < count; i++) {
           
            
            UIButton *btn = [[UIButton alloc]init];
            btn.titleLabel.font = [UIFont systemFontOfSize:15];
            btn.titleLabel.textColor = [UIColor lightGrayColor];
            NSString *title = btnTitleArray[i];
            
            CGSize size = [title boundingRectWithSize:CGSizeMake(30000, self.frame.size.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor],NSFontAttributeName:[UIFont systemFontOfSize:13]} context:nil].size;
            
            btn.frame = CGRectMake(_totolWidth+10, 0, size.width+20, self.frame.size.height);
            _totolWidth += size.width+20;
            
            
            btn.tag = i+100;
            [btn setTitle:title forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
            if (i == 0) {
                _currentBtn = btn;
                _currentBtn.selected = YES;
            }
            [self addSubview:btn];
           
        }
        
        UIButton *delBtn = [[UIButton alloc]initWithFrame:CGRectMake(_totolWidth+10, 0, 80, self.frame.size.height)];
        [delBtn setImage:[UIImage imageNamed:@"emoji_delete_pressed"] forState:UIControlStateHighlighted];
        [delBtn setImage:[UIImage imageNamed:@"emoji_delete"] forState:UIControlStateNormal];
        [delBtn addTarget:self action:@selector(backspaceText:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:delBtn];
        
         _totolWidth += 100.f;
        
        UIButton *sendBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        sendBtn.frame = CGRectMake(_totolWidth+10, (self.frame.size.height-30)/2, 60.0f, 30.0f);
        [sendBtn setBackgroundImage:[[UIImage imageNamed:@"common_resizable_blue_N"] stretchableImageWithLeftCapWidth:6 topCapHeight:15] forState:UIControlStateNormal];
        [sendBtn setBackgroundImage:[[UIImage imageNamed:@"common_resizable_blue_H"] stretchableImageWithLeftCapWidth:6 topCapHeight:15] forState:UIControlStateHighlighted];
        [sendBtn setTitle:@"发送" forState:UIControlStateNormal];
        sendBtn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
        [self addSubview:sendBtn];
        [sendBtn addTarget:self action:@selector(emojiSendBtn:) forControlEvents:UIControlEventTouchUpInside];
        _totolWidth += 80.f;
        
        if (_totolWidth >= self.frame.size.width) {
            self.contentSize = CGSizeMake(_totolWidth, 0);
        }
    }
}

- (void)backspaceText:(id)sender{
    if (self.subDelegate && [self.subDelegate respondsToSelector:@selector(jSFooterScrollViewDeleteBtnClicked:)]) {
        [self.subDelegate jSFooterScrollViewDeleteBtnClicked:sender];
    }
}
-(void)changeSelectedBtnAtIndex:(int)index
{
    UIButton *sender = [self viewWithTag:index+100];
    if (_currentBtn == sender) {
        return;
    }
    sender.selected = YES;
   
    _currentBtn.selected = NO;
    _currentBtn = sender;
    
    
}
-(void)emojiSendBtn:(UIButton *)sender
{
    if (self.subDelegate&&[self.subDelegate respondsToSelector:@selector(jSFooterScrollViewSendBtnClicked:)]) {
        [self.subDelegate jSFooterScrollViewSendBtnClicked:sender];
    }
}
-(void)btnClicked:(UIButton *)sender
{
    if (sender.isSelected) {
        return ;
    }
    sender.selected = !sender.selected;
    _currentBtn.selected = NO;
    _currentBtn = sender;
    
    if (self.subDelegate && [self.subDelegate respondsToSelector:@selector(jSFooterScrollViewDidSelectBtn:)]) {
        [self.subDelegate jSFooterScrollViewDidSelectBtn:sender];
    }
}

@end
