//
//  JSEmoji.m
//  JSEmojiView
//
//  Created by 罗孟歌 on 2017/5/19.
//  Copyright © 2017年 罗孟歌. All rights reserved.
//

#import "JSEmoji.h"

@implementation JSEmoji

@end

@implementation JSEmoji (Extension)

+(NSDictionary *)emojis{
    static NSDictionary *_emojis = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"emoji" ofType:@"json"];
        NSData *emojiData = [[NSData alloc]initWithContentsOfFile:path];
        
        _emojis = [NSJSONSerialization JSONObjectWithData:emojiData options:NSJSONReadingAllowFragments error:nil];
    });
    return _emojis;
}
+(instancetype)peopleEmoji
{
    JSEmoji *emoji = [JSEmoji new];
    emoji.title = @"人物";
    emoji.emojis = [self emojis][@"people"];
    emoji.type = JSEmojiTypePeople;
    return emoji;
}

+(instancetype)flowerEmoji
{
    JSEmoji *emoji = [JSEmoji new];
    emoji.title = @"自然";
    emoji.emojis = [self emojis][@"flower"];
    emoji.type = JSEmojiTypeFlower;
    return emoji;
}
+ (instancetype)bellEmoji{
    JSEmoji *emoji = [JSEmoji new];
    emoji.title = @"日常";
    emoji.emojis = [self emojis][@"bell"];
    emoji.type = JSEmojiTypeBell;
    return emoji;
}

+ (instancetype)vehicleEmoji{
    JSEmoji *emoji = [JSEmoji new];
    emoji.title = @"建筑与交通";
    emoji.emojis = [self emojis][@"vehicle"];
    emoji.type = JSEmojiTypeVehicle;
    return emoji;
}

+ (instancetype)numberEmoji{
    JSEmoji *emoji = [JSEmoji new];
    emoji.title = @"符号";
    emoji.emojis = [self emojis][@"number"];
    emoji.type = JSEmojiTypeNumber;
    return emoji;
}

+(NSArray *)allEmojis
{
    return @[[self peopleEmoji],[self flowerEmoji],[self bellEmoji],[self vehicleEmoji],[self numberEmoji]];
}

@end
