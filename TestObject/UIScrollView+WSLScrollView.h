//
//  UIScrollView+WSLScrollView.h
//  WSLTool
//
//  Created by wsl 王 on 2018/8/4.
//  Copyright © 2018年 wsl 王. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM (NSInteger,RefreshType){
    
    RefreshNewStart = 1,//重新开始刷新
    RefreshLoadMore,//加载更多
    
};
//代理方法
@protocol WSLScrollViewDelegate <NSObject>

@optional
/*设置接口相关参数属性*/
- (NSDictionary *)getRequestParaSet:(UIScrollView *)scrollView
                        refreshType:(RefreshType)refreshType;
/*设置model类型*/
- (NSString *)getModelClass:(UIScrollView *)scrollView;

@end

@interface UIScrollView (WSLScrollView)

//保存数据源数组
@property (nonatomic,strong) NSMutableArray * dataArr;
//代理
@property (nonatomic,weak) id <WSLScrollViewDelegate> wSLScrollViewDelegate;
//当前页数
@property (nonatomic,assign,readonly) int curPage;
//执行下拉刷新
- (void)beginRefreshWithNeedLoadMore:(BOOL)isLoadMore;

@end

//辅助类
@interface WSLWeakObjectContainer : NSObject

@property (nonatomic, readonly, weak) id weakObject;

- (instancetype)initWithWeakObject:(id)object;

@end
