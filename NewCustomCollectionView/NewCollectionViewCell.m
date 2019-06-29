//
//  NewCollectionViewCell.m
//  NewCustomCollectionView
//
//  Created by Екатерина Коляскина on 23/06/2019.
//  Copyright © 2019 Екатерина Коляскина. All rights reserved.
//

#import "NewCollectionViewCell.h"
@interface NewCollectionViewCell()
@end

@implementation NewCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = 20.f;
        self.indexLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 30, 50, 30)];

        self.indexLabel.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.indexLabel];
    }
    return self;
}
@end
