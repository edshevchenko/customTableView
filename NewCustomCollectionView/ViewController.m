//
//  ViewController.m
//  CustomCollectionView
//
//  Created by Екатерина Коляскина on 21/06/2019.
//  Copyright © 2019 Екатерина Коляскина. All rights reserved.
//

#import "ViewController.h"
#import "CustomCollectionLayout.h"
#import "NewCollectionViewCell.h"
@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic) UICollectionView *mycollectionView;
@property (nonatomic) CustomCollectionLayout *myFlowLayout;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CustomCollectionLayout *myFlowLayout = [CustomCollectionLayout new];
    myFlowLayout.quantityOfItems = 10000;
    self.mycollectionView = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:myFlowLayout];
    self.mycollectionView.backgroundColor = [UIColor whiteColor];
    self.mycollectionView.delegate = self;
    self.mycollectionView.dataSource = self;
    [self.mycollectionView registerClass:[NewCollectionViewCell class] forCellWithReuseIdentifier:@"malevich"];
    [self.view addSubview:self.mycollectionView];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
       return 10000;
}



- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NewCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"malevich" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:0.8];
    cell.indexLabel.text = [NSString stringWithFormat:@"%ld",indexPath.item];
    return cell;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}


@end




