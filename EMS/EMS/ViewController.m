//
//  ViewController.m
//  EMS
//
//  Created by ankit on 1/13/17.
//  Copyright © 2017 anyone. All rights reserved.
//

#import "ViewController.h"
#import "CalenderCVCell.h"

@interface ViewController ()

@end

NSInteger daynum;
NSInteger currentdate;
@implementation ViewController{
    AppDelegate *app;
}


@synthesize CalendarView;


- (void)viewDidLoad {
    [super viewDidLoad];
   // [self.navigationItem setTitle:[CalendarSetting setTitle]];
  
    [self setupHome];
           }
-(void)setupHome{

    app=(AppDelegate*)[[UIApplication sharedApplication] delegate];
    [self.navigationItem setTitle:[app.currentcal setTitle]];
    [_nextMonthOut setTitle:@"Next"];
    [_prevMonth setTitle:@"Prev"];
}

-(void)setSidePanel{
   // [_sidePnl_left setConstant:-(_sidePanel.frame.size.width)];
    
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSInteger maxcells=(app.currentcal.maxdays+7+app.currentcal.presentMFD);
    if(maxcells%7>0){
        maxcells=(((app.currentcal.maxdays+7+app.currentcal.presentMFD)/7)+1)*7;
    }else{
        
    }
    return maxcells;
    //return 42;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(CalendarView.frame.size.width/7.2,CalendarView.frame.size.height/7);
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CalenderCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
  
    if([cell.contentView subviews].count>0){
        for(UIView *v in [cell.contentView subviews]){
            [v removeFromSuperview];
        }
        for(UILabel *v in [cell.contentView subviews]){
            [v removeFromSuperview];
        }
    }
    [cell.contentView addSubview:[cell setTxtforCell:indexPath withinst:app.currentcal]];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)nextMonth:(id)sender {
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDate *someDate = [cal dateByAddingUnit:NSCalendarUnitMonth value:1 toDate:app.currentcal.currentDate options:0];
    NSLog(@"time to load calendar for next month by button----<%@>",someDate);
    //[CalendarSetting set_member_var:someDate forInst:app.currentcal];
    [app.currentcal set_member_var:someDate];
    [self setupHome];
    [CalendarView reloadData];
    //[self.view setNeedsDisplay];
}
- (IBAction)prevMonthact:(id)sender {
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDate *someDate = [cal dateByAddingUnit:NSCalendarUnitMonth value:-1 toDate:app.currentcal.currentDate options:0];
    NSLog(@"time to load calendar for next month by button----<%@>",someDate);
   // [CalendarSetting set_member_var:someDate forInst:app.currentcal];
    [app.currentcal set_member_var:someDate];
    [self setupHome];
    [CalendarView reloadData];
    //[self.view setNeedsDisplay];
    
}
@end
