//
//  MainTopView.m
//  Hakenman
//
//  Created by Lee jaeeun on 2014/03/22.
//  Copyright (c) 2014年 kjcode. All rights reserved.
//

#import "MainTopView.h"
#import "WorkStatusCell.h"
#import "TodoListCell.h"
#import "MapViewCell.h"
#import "WeekWorkStatusCell.h"

@interface MainTopView() <UITableViewDataSource, UITableViewDelegate> {
    
    IBOutlet UITableView *startWorkTableView;
    IBOutlet UITableView *endWorkTableView;
}

@property (nonatomic, strong) WorkStatusCell *workStatusCell;
@property (nonatomic, strong) TodoListCell *todoListCell;
@property (nonatomic, strong) MapViewCell *mapViewCell;
@property (nonatomic, strong) WeekWorkStatusCell *weekWorkStatusCell;

- (WorkStatusCell *)tableView:(UITableView *)tableView workStatusCellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (TodoListCell *)tableView:(UITableView *)tableView todoListCellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (MapViewCell *)tableView:(UITableView *)tableView mapViewCellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (WeekWorkStatusCell *)tableView:(UITableView *)tableView weekWorkStatusCellForRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@implementation MainTopView

+ (id)createView {
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"MainTopView" owner:nil options:nil];
    return [views objectAtIndex:0];
}

- (id)initTableCellView:(tableCellType)cellType {
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"MainTopView" owner:nil options:nil];
    
    return [views objectAtIndex:(cellType + 1)];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


#pragma mark - tableView private method
- (WorkStatusCell *)tableView:(UITableView *)tableView workStatusCellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    NSString *cellIdentifier = @"WorkStatusCellIdentifier";
//    WorkStatusCell *cell = (WorkStatusCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
//    if (!cell) {
//        cell = [[WorkStatusCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
//    }
//    
//    //TODO: cell更新
//    
//    return cell;
    
    if (_workStatusCell == nil) {
        _workStatusCell = (WorkStatusCell *)[self initTableCellView:tableCellTypeCurrentStatus];
    }
    
    return _workStatusCell;
}

- (TodoListCell *)tableView:(UITableView *)tableView todoListCellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (_todoListCell == nil) {
        _todoListCell = (TodoListCell *)[self initTableCellView:tableCellTypeTodoList];
    }
    
    return _todoListCell;
}

- (MapViewCell *)tableView:(UITableView *)tableView mapViewCellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (_mapViewCell == nil) {
        _mapViewCell = (MapViewCell *)[self initTableCellView:tableCellTypeMapView];
    }
    
    return _mapViewCell;
}

- (WeekWorkStatusCell *)tableView:(UITableView *)tableView weekWorkStatusCellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (_weekWorkStatusCell == nil) {
        _weekWorkStatusCell = (WeekWorkStatusCell *)[self initTableCellView:tableCellTypeWeekStatus];
    }
    
    return _weekWorkStatusCell;
}

#pragma mark - UITableView Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == tableCellTypeCurrentStatus) {
        return 150.0f;
        
    }else if(indexPath.row == tableCellTypeTodoList) {
        return 50.0f;
        
    }else if(indexPath.row == tableCellTypeMapView) {
        return 50.0f;
        
    }else if(indexPath.row == tableCellTypeWeekStatus) {
        return 200.0f;
        
    }
    
    return 44.0f;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return tableCellTypeMaxCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if ([tableView isEqual:startWorkTableView] == YES) {
        
        if (indexPath.row == tableCellTypeCurrentStatus) {
            WorkStatusCell *cell = [self tableView:tableView workStatusCellForRowAtIndexPath:indexPath];
            
            return cell;
            
        }else if(indexPath.row == tableCellTypeTodoList) {
            TodoListCell *cell = [self tableView:tableView todoListCellForRowAtIndexPath:indexPath];
            
            return cell;
            
        }else if(indexPath.row == tableCellTypeMapView) {
            MapViewCell *cell = [self tableView:tableView mapViewCellForRowAtIndexPath:indexPath];
            
            return cell;
            
        }else if(indexPath.row == tableCellTypeWeekStatus) {
            WeekWorkStatusCell *cell = [self tableView:tableView weekWorkStatusCellForRowAtIndexPath:indexPath];
            
            return cell;
            
        }else {
            //その他
        }
        
    }else if ([tableView isEqual:endWorkTableView] == YES) {
        
        if (indexPath.row == tableCellTypeCurrentStatus) {
            WorkStatusCell *cell = [self tableView:tableView workStatusCellForRowAtIndexPath:indexPath];
            
            return cell;
            
        }else if(indexPath.row == tableCellTypeTodoList) {
            TodoListCell *cell = [self tableView:tableView todoListCellForRowAtIndexPath:indexPath];
            
            return cell;
            
        }else if(indexPath.row == tableCellTypeMapView) {
            MapViewCell *cell = [self tableView:tableView mapViewCellForRowAtIndexPath:indexPath];
            
            return cell;
            
        }else if(indexPath.row == tableCellTypeWeekStatus) {
            WeekWorkStatusCell *cell = [self tableView:tableView weekWorkStatusCellForRowAtIndexPath:indexPath];
            
            return cell;
            
        }else {
            //その他
        }
    }
    
    
    
    //ここにくることはありえないのでnilにする
    return nil;
    
}

@end
