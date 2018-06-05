//
//  JSCollectionViewCell.m
//  JSEmojiView
//
//  Created by 罗孟歌 on 2017/5/19.
//  Copyright © 2017年 罗孟歌. All rights reserved.
//

#import "JSCollectionViewCell.h"
#import "JSEmoji.h"

@implementation JSCollectionViewCell
{
    UILabel *_emojiLabel;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        label.font = [UIFont systemFontOfSize:28];
        label.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:label];
        _emojiLabel = label;
    }
    return self;
}
-(void)setEmoji:(NSString *)emoji
{
    if (_emoji != emoji) {
        _emoji = emoji;
        _emojiLabel.text = emoji;
    }
   
  
}
@end
