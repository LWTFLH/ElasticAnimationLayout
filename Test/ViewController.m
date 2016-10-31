//
//  ViewController.m
//  Test
//
//  Created by 李伟 on 16/10/19.
//  Copyright © 2016年 TFLH. All rights reserved.
//
#define Width [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height
#import "ViewController.h"
#import "LWCustomerLayout.h"
#import "LWCollectionViewCell.h"
#import "UserRecoedCollectionViewCell.h"
#import "RightPanBack.h"
@interface ViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic,strong) UICollectionView *collection;
@end

@implementation ViewController
-(UICollectionView *)collection{

    if (!_collection) {
        LWCustomerLayout *layout = [[LWCustomerLayout alloc]init];
     //   UICollectionViewFlowLayout *lay = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumLineSpacing  =0;
        layout.minimumInteritemSpacing  =0;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
       // lay.itemSize = CGSizeMake(Width/2, Width/2);
      //  layout.itemSize = CGSizeMake(self.view.frame.size.width/2, self.view.frame.size.width/2);
        
        _collection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 200) collectionViewLayout:layout];
        _collection.backgroundColor = [UIColor whiteColor];
        _collection.delegate = self;
        _collection.dataSource = self;
        _collection.pagingEnabled = YES;
        _collection.showsHorizontalScrollIndicator = NO;
        _collection.showsVerticalScrollIndicator = NO;
       // [_collection registerNib:[UINib nibWithNibName:@"LWCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"CELL"];
        [_collection registerNib:[UINib nibWithNibName:@"UserRecoedCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"UserID"];
    }
    return _collection;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{

    
    return CGSizeMake(Width, 50);
  //  return CGSizeMake((Width-20)/3.0,(Width-20)/3.0);
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mqzone://"]];
//    NSLog(@"open");
    
    [self. navigationController pushViewController:[[RightPanBack alloc] init] animated:YES];
    
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

//    UICollectionView *tempCollec =(UICollectionView *) scrollView;
//    
//   NSArray *visibCell  = [tempCollec visibleCells];
//    UICollectionViewCell *visibleView = nil;
//    if (visibCell.count>0) {
//        visibleView = [visibCell firstObject];
//        visibleView.transform= CGAffineTransformMakeScale(.8, .8);
//
//    }else{
//    
//        visibleView.transform= CGAffineTransformMakeScale(.5, .5);
//
//    }
//   
    
    
    
    
    
    }
- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self.view addSubview:self.collection];
    self.navigationItem.title = @"瀑布";
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return 30;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    UserRecoedCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UserID" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor lightTextColor];
    cell.layer.borderColor = [UIColor cyanColor].CGColor;
    cell.layer.borderWidth = 1.0;
    cell.layer.shadowColor = [UIColor redColor].CGColor;
    cell.layer.shadowOffset = CGSizeMake(1, 1);
    cell.layer.shadowOpacity = .4;
    //   cell.imageCell.layer.borderColor = [UIColor cyanColor].CGColor;
  //  cell.imageCell.layer.borderWidth  =1.0;
    return cell;
    
}
//-(void)addPushBehaveAni{
//
//
// pushBehavior = [[UIPushBehavior alloc]
//                initWithItems:@[self.view]
//                mode:UIPushBehaviorModeInstantaneous];
//
//}





//-(void)handlGesture:(UIGestureRecognizer *)gesture{

//CGPoint velocity = [gesture velocityInView:self.view];
//CGFloat magnitude = sqrtf((velocity.x * velocity.x) + (velocity.y * velocity.y));
//
//if (magnitude > ThrowingThreshold) {
//    //2
//    pushBehavior = [[UIPushBehavior alloc]
//                    initWithItems:@[iv]
//                    mode:UIPushBehaviorModeInstantaneous];
//    pushBehavior.pushDirection = CGVectorMake((velocity.x / 10) , (velocity.y / 10));
//    pushBehavior.magnitude = magnitude / ThrowingvelocityPadding;
//    
//    
//    [animator addBehavior:pushBehavior];
//    
//    //3
//    //                UIDynamicItemBehavior 其实是一个辅助的行为，用来在item层级设定一些参数，比如item的摩擦，阻力，角阻力，弹性密度和可允许的旋转等等
//    NSInteger angle = arc4random_uniform(20) - 10;
//    
//    itemBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[iv]];
//    itemBehavior.friction = 0.2;
//    itemBehavior.allowsRotation = YES;
//    [itemBehavior addAngularVelocity:angle forItem:iv];
//    [animator addBehavior:itemBehavior];
//    
//    //4
//    [self performSelector:@selector(resetDemo) withObject:nil afterDelay:0.4];
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
