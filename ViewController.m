//
//  ViewController.m
//  asdadad
//
//  Created by 苏庆林 on 2019/8/14.
//  Copyright © 2019 苏庆林. All rights reserved.
//

#import "ViewController.h"
#import "QLTableViewCell.h"


#define screenH [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UIScrollView *scroll;
@property (nonatomic, strong) UIView *headView;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 376, screenH)];
//    self.scroll = scroll;
//    scroll.delegate = self;
//    [self.view addSubview:scroll];
//    scroll.contentSize = CGSizeMake(0, 1500);
//    scroll.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 300)];
    self.headView = headView;
    UIView *redDot = [[UIView alloc] initWithFrame:CGRectMake(0, 280, 100, 30)];
    redDot.backgroundColor = [UIColor redColor];
    [headView addSubview:redDot];
    headView.backgroundColor = [UIColor greenColor];
//    [self.view addSubview:headView];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 375, screenH) style:UITableViewStylePlain];
    self.tableView = tableView;
    tableView.dataSource =self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    tableView.estimatedSectionFooterHeight = 0.01;
    
    self.tableView.tableHeaderView = headView;
//    self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 88;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 30)];
    headV.backgroundColor = [UIColor redColor];
    return headV;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    return cell;
}

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    CGPoint offset =  scrollView.contentOffset;
//    NSLog(@"偏移量：%f", offset.y);
//    CGPoint touchPoint = [scrollView.panGestureRecognizer locationInView:self.scroll];
//    if ([self.headView.layer containsPoint:touchPoint]) {
//
//    }
//    if ([self.headView.layer containsPoint:touchPoint]) {
//        NSLog(@"点的是scrollview");
//        if ( offset.y >= 300 ) {
//            self.scroll.scrollEnabled = NO;
//            [self.scroll setContentOffset:CGPointMake(0, 300)];
//            self.tableView.scrollEnabled = YES;
//            self.scroll.directionalLockEnabled = YES;
//        } else {
//            self.tableView.scrollEnabled = NO;
//            self.scroll.scrollEnabled = YES;
//            [self.scroll setContentOffset:offset];
//
//
//            NSLog(@"table偏移量：%f", self.tableView.contentOffset.y);
//        }
//    } else {
//       CGPoint newoffset = [self.scroll.panGestureRecognizer translationInView:self.scroll];
//
//        NSLog(@"点的是tableview:%f",newoffset.y);
//        if (newoffset.y <= 0) {
//            [self.scroll setContentOffset:CGPointMake(0, -newoffset.y)];
//            self.scroll.scrollEnabled = YES;
//            self.tableView.scrollEnabled = NO;
//        } else {
//            self.scroll.scrollEnabled = NO;
//            self.tableView.scrollEnabled = YES;
//        }
//    }
//}

//- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
//{
//    NSLog(@"加速度:%f", velocity.y);
//}
@end
