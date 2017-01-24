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
NSInteger current;
NSInteger daynum;
int colorcase;
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
    app.currentcal.delegate=self;
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
    [cell.contentView addSubview:[cell setTxtforCell:indexPath withText:[self getDateValueforIndex:indexPath] andcolor:[self getColorforCase:colorcase]]];
   // [cell.contentView addSubview:[cell setTxtforCell:indexPath withinst:app.currentcal]];
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
-(NSString *)getDateValueforIndex:(NSIndexPath *)index{
    
    current=app.currentcal.currentdt;
        NSString *text1;
        int que=index.row/7;
        if(que==0 ){
            text1=[app.currentcal.weekdays objectAtIndex:(index.row)];
            colorcase=0;
        }
        if(index.row<=(app.currentcal.presentMFD+6) && que>0 ){
            text1=[[NSString alloc]initWithFormat:@"%d",(app.currentcal.prevMax-app.currentcal.presentMFD+1)+(index.row%7)];
            colorcase=2;
        }
        if(index.row>(app.currentcal.presentMFD+6) && index.row<(app.currentcal.maxdays+7+app.currentcal.presentMFD) && que>0){ //set start index by
    
            text1=[[NSString alloc]initWithFormat:@"%u",(unsigned)index.row-6-app.currentcal.presentMFD];
            
            if((current+app.currentcal.presentMFD)==index.row-6){
                colorcase=3;
                
            }else{
              
                colorcase=1;
                if((index.row%7)>4){
                    colorcase=4;
                }
            }
            NSLog(@"index path %@",text1);
    
        }
    
        if(index.row>(app.currentcal.maxdays+app.currentcal.presentMFD+6) && que>0){
            colorcase=2;
            text1=[[NSString alloc]initWithFormat:@"%d",((index.row-app.currentcal.maxdays-app.currentcal.presentMFD)-6)];
            
        }
    NSLog(@"text ready to be returned to date %@",text1);
    
    
    return text1;
}

-(UIColor *)getColorforCase:(NSInteger )caseOfCalendar{
    UIColor *color;
    NSLog(@"case for color--- %d",(int)caseOfCalendar);
    switch ((long)caseOfCalendar) {
        case 0:
            color=[UIColor redColor];
            break;
            case 1:
            color=[UIColor blueColor];
            break;
            case 2:
            color=[UIColor grayColor];
            break;
            case 3:
            color=[UIColor orangeColor];
            break;
            case 4:
            color=[UIColor purpleColor];
            break;
        default:
            color=[UIColor blueColor];
            break;
    }
    
    return color;
    
    
}
@end
