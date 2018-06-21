//
//  JSEmojiView.m
//  JSEmojiView
//
//  Created by 罗孟歌 on 2017/5/19.
//  Copyright © 2017年 罗孟歌. All rights reserved.
//

#import "JSEmojiView.h"
#import "JSEmoji.h"
#import "JSCollectionViewCell.h"
#import "JSHeaderScrollView.h"
#import "JSFooterScrollView.h"


#define EmojiWidth 35

@interface JSEmojiView ()<UICollectionViewDelegate,UICollectionViewDataSource,JSFooterScrollViewDelegate>
{
    UICollectionView *_collectionView;
    JSHeaderScrollView *_headerView;
    JSFooterScrollView *_footerView;
    NSArray *_dataListArray;
    CGFloat _lastSectionIndex;
   
}
@property(nonatomic,strong) NSMutableDictionary *cellIdentifierDic;
@end

 NSString *const cellID = @"cellID";
 NSString *const  headerID = @"headerID";

@implementation JSEmojiView

+(instancetype)shardInstance
{
    static  JSEmojiView *emojiView;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        emojiView = [[self alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height-216.0, [[UIScreen mainScreen] bounds].size.width, 216.0)];
    });
    return emojiView;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self layoutUI];
    }
    return self;
}
-(void)layoutUI
{
    _dataListArray = [JSEmoji allEmojis];
    
    self.cellIdentifierDic = [NSMutableDictionary dictionary];
    NSMutableArray *tempArray  = [NSMutableArray array];
    for (JSEmoji *emoji in _dataListArray) {
        [tempArray addObject:emoji.title];
    }
    
    JSHeaderScrollView *scv = [[JSHeaderScrollView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 30)];
    [self addSubview:scv];
    _headerView = scv;
    [self titleShouldChanged:0];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    CGFloat marigin = (self.frame.size.width - EmojiWidth*8)/9;
    
    flowLayout.sectionInset = UIEdgeInsetsMake(10, marigin, 10, marigin);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    

    flowLayout.minimumLineSpacing = 10;
    flowLayout.minimumInteritemSpacing = 10;
    
    
    UICollectionView *clv = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 30, self.frame.size.width, 146) collectionViewLayout:flowLayout];
    clv.backgroundColor = [UIColor whiteColor];
    clv.showsHorizontalScrollIndicator = NO;
    clv.delegate = self;
    clv.dataSource = self;
    [self addSubview:clv];
   
    _collectionView = clv;
    
    JSFooterScrollView *fsv = [[JSFooterScrollView alloc]initWithFrame:CGRectMake(0, 176, self.frame.size.width, 40)];
    fsv.subDelegate = self;
    fsv.btnTitleArray = tempArray;
    [self addSubview:fsv];
    _footerView = fsv;
}
-(void)titleShouldChanged:(int)tag
{
    JSEmoji *emoji = _dataListArray[tag];
    _headerView.title = emoji.title;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return _dataListArray.count;
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    JSEmoji *emoji = _dataListArray[section];
    return emoji.emojis.count;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    JSEmoji *emoji = _dataListArray[indexPath.section];
    NSString *emojiStr = emoji.emojis[indexPath.row];
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectEmoji:)]) {
        [self.delegate didSelectEmoji:emojiStr];
    }
  
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(EmojiWidth, EmojiWidth);
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reuseIden  = cellID;
    [collectionView registerClass:[JSCollectionViewCell class] forCellWithReuseIdentifier:reuseIden];
    
    
    JSCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIden forIndexPath:indexPath];
    JSEmoji *emoji = _dataListArray[indexPath.section];
    NSString *emojiStr = emoji.emojis[indexPath.row];
    cell.emoji = emojiStr;
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (_lastSectionIndex != indexPath.section) {
        [self titleShouldChanged:(int)indexPath.section];
        [_footerView changeSelectedBtnAtIndex:(int)indexPath.section];
        
        _lastSectionIndex = indexPath.section;
    }
}
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    
}
#pragma mark -JSFooterScrollViewDelegate
-(void)jSFooterScrollViewDidSelectBtn:(UIButton *)sender
{
    int tag = (int)sender.tag-100;
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:tag];
    [_collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
}
-(void)jSFooterScrollViewDeleteBtnClicked:(UIButton *)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(backspaceText)]) {
        [self.delegate backspaceText];
    }
}
-(void)jSFooterScrollViewSendBtnClicked:(UIButton *)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(emojiSendBtn:)]) {
        [self.delegate emojiSendBtn:sender];
    }
}
@end
