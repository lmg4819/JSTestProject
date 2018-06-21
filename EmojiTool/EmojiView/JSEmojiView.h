//
//  JSEmojiView.h
//  JSEmojiView
//
//  Created by 罗孟歌 on 2017/5/19.
//  Copyright © 2017年 罗孟歌. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JSEmojiViewDelegate <NSObject>

@optional
-(void)didSelectEmoji:(NSString *)emoji;
-(void)backspaceText;
-(void)emojiSendBtn:(id)sender;

@end

@interface JSEmojiView : UIView
+(instancetype)shardInstance;

@property(nonatomic,weak) id<JSEmojiViewDelegate>delegate;
@end
