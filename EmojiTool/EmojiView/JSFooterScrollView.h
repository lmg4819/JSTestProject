//
//  JSFooterScrollView.h
//  JSEmojiView
//
//  Created by 罗孟歌 on 2017/5/19.
//  Copyright © 2017年 罗孟歌. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JSFooterScrollViewDelegate <NSObject,UIScrollViewDelegate>

-(void)jSFooterScrollViewDidSelectBtn:(UIButton *)sender;
-(void)jSFooterScrollViewDeleteBtnClicked:(UIButton *)sender;
-(void)jSFooterScrollViewSendBtnClicked:(UIButton *)sender;

@end

@interface JSFooterScrollView : UIScrollView
@property(nonatomic,strong) NSArray *btnTitleArray;

@property(nonatomic,weak) id<JSFooterScrollViewDelegate>subDelegate;



-(void)changeSelectedBtnAtIndex:(int)index;
@end
