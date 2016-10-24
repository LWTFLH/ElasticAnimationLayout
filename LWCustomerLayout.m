//
//  LWCustomerLayout.m
//  Test
//
//  Created by 李伟 on 16/10/21.
//  Copyright © 2016年 TFLH. All rights reserved.
//

#import "LWCustomerLayout.h"
#import <math.h>
@implementation LWCustomerLayout
{

    UIDynamicAnimator *_animator;
    CGFloat   resistanceFactor;
}
-(void)prepareLayout{
    [super prepareLayout];
    if (!_animator) {
        _animator = [[UIDynamicAnimator alloc]initWithCollectionViewLayout:self];
        CGSize contentSize = [self collectionViewContentSize];
        
        NSArray *items = [super layoutAttributesForElementsInRect:CGRectMake(0, 0, contentSize.width, contentSize.height)];
        
        for (UICollectionViewLayoutAttributes *item in items) {
            UIAttachmentBehavior *attachment = [[UIAttachmentBehavior alloc]initWithItem:item  attachedToAnchor:item.center];
             attachment.length = 0;
            attachment.damping = 500;
           attachment.frequency = 200;
            attachment.frictionTorque = 3;
            [_animator addBehavior:attachment];
           // [_animator addBehavior:snap];
        }
    }
}

-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{

    return  [_animator itemsInRect:rect];
}
-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{

    return [_animator layoutAttributesForCellAtIndexPath:indexPath];
}

-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    UIScrollView *scrollView = self.collectionView;
    CGFloat scrollDelta = newBounds.origin.y - scrollView.bounds.origin.y;
    NSLog(@" %f   %f",newBounds.origin.y,scrollView.bounds.origin.y);
    CGPoint touchLocation = [scrollView.panGestureRecognizer locationInView:scrollView];
    
    for (UIAttachmentBehavior *behavior in _animator.behaviors) {
        
        CGPoint anchorPoint = behavior.anchorPoint;
        CGFloat distanceFromTouch = fabs(touchLocation.y - anchorPoint.y);
        CGFloat scrollResistance = distanceFromTouch / 500;
        
        UICollectionViewLayoutAttributes *item = (UICollectionViewLayoutAttributes *)[behavior.items firstObject];
        CGPoint center = item.center;
        center.y += (scrollDelta > 0) ? MIN(scrollDelta, scrollDelta * scrollResistance)
        : MAX(scrollDelta, scrollDelta * scrollResistance);
        item.center = center;
        
        [_animator updateItemUsingCurrentState:item];
    }
    return NO;
}


































@end
