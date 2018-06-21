//
//  JSEmoji.h
//  JSEmojiView
//
//  Created by 罗孟歌 on 2017/5/19.
//  Copyright © 2017年 罗孟歌. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSUInteger,JSEmojiType) {
    JSEmojiTypePeople = 0,
    JSEmojiTypeFlower,
    JSEmojiTypeBell,
    JSEmojiTypeVehicle,
    JSEmojiTypeNumber
};


@interface JSEmoji : NSObject
@property(nonatomic,assign) JSEmojiType type;
@property(nonatomic,copy) NSString *title;
@property(nonatomic,strong) NSArray *emojis;


@end


@interface JSEmoji (Extension)

+(NSArray *)allEmojis;

@end
