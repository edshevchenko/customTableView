//
//  CustomFlowLayout.m
//  CustomCollectionView
//
//  Created by Екатерина Коляскина on 21/06/2019.
//  Copyright © 2019 Екатерина Коляскина. All rights reserved.
//
#import "CustomCollectionLayout.h"
@interface CustomCollectionLayout()
@property (nonatomic, strong) NSMutableArray* collectionAttributesArray;
@end

@implementation CustomCollectionLayout

#pragma mark - PrepareLayout

-(void)prepareLayout
{
    [super prepareLayout];
    
    self.collectionAttributesArray = [NSMutableArray array];
    self.minimumLineSpacing = 10;
    self.minimumInteritemSpacing = 10;
    self.itemSize = CGSizeMake(self.collectionView.frame.size.width/3*2,self.collectionView.frame.size.width/3*2);

    for (int i = 0; i < self.quantityOfItems; i++) {
        UICollectionViewLayoutAttributes * collectionAttributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        
        
        if (collectionAttributes.indexPath.item%6==0)
        {
            collectionAttributes.frame = CGRectMake(0, self.itemSize.height*collectionAttributes.indexPath.item/3, self.itemSize.height, self.itemSize.width);
            [self.collectionAttributesArray addObject:collectionAttributes];
        }
        
        else if (collectionAttributes.indexPath.item%6==1)
        {
            collectionAttributes.frame = CGRectMake(self.collectionView.frame.size.width-self.itemSize.width/2, self.itemSize.height*(collectionAttributes.indexPath.item/3), self.itemSize.width/2, self.itemSize.height/2);
            [self.collectionAttributesArray addObject:collectionAttributes];
        }
        
        else if (collectionAttributes.indexPath.item%6==2)
        {
            collectionAttributes.frame = CGRectMake(self.collectionView.frame.size.width-self.itemSize.width/2, self.itemSize.height*((collectionAttributes.indexPath.item-1)/3)+(self.itemSize.height/2), self.itemSize.width/2, self.itemSize.height/2);
            [self.collectionAttributesArray addObject:collectionAttributes];
        }
        
        else if (collectionAttributes.indexPath.item%6==3)
        {
            collectionAttributes.frame = CGRectMake(self.collectionView.frame.size.width-self.itemSize.width, self.itemSize.height*collectionAttributes.indexPath.row/3, self.itemSize.height, self.itemSize.width);
            [self.collectionAttributesArray addObject:collectionAttributes];
        }
        
        else if (collectionAttributes.indexPath.item%6==4)
        {
            collectionAttributes.frame = CGRectMake(0, self.itemSize.height*(collectionAttributes.indexPath.row/3), self.itemSize.height/2, self.itemSize.width/2);
            [self.collectionAttributesArray addObject:collectionAttributes];
        }
        
        else if (collectionAttributes.indexPath.item%6==5)
        {
            collectionAttributes.frame = CGRectMake(0, self.itemSize.height*((collectionAttributes.indexPath.item-1)/3)+(self.itemSize.height/2), self.itemSize.height/2, self.itemSize.width/2);
            self.collectionView.backgroundColor = [UIColor blackColor];
            [self.collectionAttributesArray addObject:collectionAttributes];
        }
    }
}

#pragma mark - CollectionViewContentSize

-(CGSize)collectionViewContentSize
{
    if (self.quantityOfItems%3==0)
    {
        CGSize collectionsize = CGSizeMake(self.collectionView.frame.size.width, self.itemSize.height*(self.quantityOfItems/3));
        return collectionsize;
    }
    else
    {
        CGSize collectionsize = CGSizeMake(self.collectionView.frame.size.width, self.itemSize.height*(self.quantityOfItems/3+1));
        return collectionsize;
    }
}



- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.collectionAttributesArray;
}



-(void)invalidateLayout
{
    [self.collectionAttributesArray removeAllObjects];
    [super invalidateLayout];
}


@end

