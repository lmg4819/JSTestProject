//
//  ViewController.m
//  JSTestProject
//
//  Created by 罗孟歌 on 2018/6/21.
//  Copyright © 2018年 we. All rights reserved.
//

#import "ViewController.h"
#import "JSEmojiView.h"

@interface ViewController ()<JSEmojiViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    JSEmojiView *emojiView = [JSEmojiView shardInstance];
    emojiView.backgroundColor = [UIColor lightGrayColor];
    emojiView.delegate = self;
    [self.view addSubview:emojiView];
}


#pragma mark - JSEmojiViewDelegate

-(void)didSelectEmoji:(NSString *)emoji
{
    
}
-(void)backspaceText
{
    
}
-(void)emojiSendBtn:(id)sender
{
    
}
@end
