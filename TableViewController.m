//
//  TableViewController.m
//  Test
//
//  Created by 李伟 on 16/10/21.
//  Copyright © 2016年 TFLH. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()
@property(nonatomic,strong)UIDynamicAnimator *dynamincAnimator;
@end

@implementation TableViewController
-(UIDynamicAnimator *)dynamincAnimator{

    if (!_dynamincAnimator) {
        _dynamincAnimator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];

    }
    
    
    return _dynamincAnimator;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets  =NO;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"CELL"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld行",indexPath.row];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"详情%ld",indexPath.row];
  //  [self addGravityAndCollisionWithView:tableView];
    
    return cell;
}
#pragma maark  重力效果
-(void)addGravityAndCollisionWithView:(UITableView *)view{

    
    for (UITableViewCell *cell in [view visibleCells]) {
        
        [self gravityAndCollsionWithView:cell];
        
    }
    
  
}

-(void)gravityAndCollsionWithView:(UITableViewCell *)cell{

    UIGravityBehavior *gravitybehave = [[UIGravityBehavior alloc]init];
    UICollisionBehavior *collisionBehave =[[UICollisionBehavior alloc]init];
   // [gravitybehave addItem:cell];
   // [collisionBehave addItem:cell];
    collisionBehave.translatesReferenceBoundsIntoBoundary  =YES;
    [self.dynamincAnimator addBehavior:gravitybehave];
    [self.dynamincAnimator addBehavior:collisionBehave];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
