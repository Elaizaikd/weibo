#import "StatusPicsView.h"
#import "Common.h"
#import "StatusViewModel.h"
#import <SDWebImage/SDWebImage.h>
#define CollectionCellID @"ImageCell"

@interface StatusPicsView()<UICollectionViewDataSource>
@property (nonatomic, strong)UICollectionViewFlowLayout* layout;
@end

@implementation StatusPicsView

#pragma mark 计算size
- (void)setViewModel:(StatusViewModel *)viewModel{
    _viewModel = viewModel;
    [self sizeToFit];
    
    [self reloadData];
}

- (CGSize)sizeThatFits:(CGSize)size{
    int count = (int)self.viewModel.picURLs.count;
    if (count == 0) {
        return CGSizeZero;
    }
    
    int rowCount = (count-1) / 3 + 1;
    float w = 3 * self.layout.itemSize.width - 2*StatusCellMargin;
    float h = rowCount * self.layout.itemSize.height + (rowCount-1) * StatusCellMargin;
    
    return CGSizeMake(w,h);
}

#pragma mark 数据源方法
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectionCellID forIndexPath:indexPath];
    
    UIImageView* imgV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.layout.itemSize.width, self.layout.itemSize.height)];
    [imgV sd_setImageWithURL:self.viewModel.picURLs[indexPath.row] placeholderImage:[UIImage imageNamed:@"compose_toolbar_picture"]];
    
    [cell.contentView addSubview: imgV];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.viewModel.picURLs.count;
}

#pragma mark 初始化
- (instancetype)init{
    self = [super initWithFrame:CGRectZero collectionViewLayout:self.layout];
    self.dataSource = self;
    [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:CollectionCellID];
    self.backgroundColor = UIColor.whiteColor;
    return self;
}

#pragma mark 懒加载 初始化 布局属性
- (UICollectionViewFlowLayout *)layout{
    UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc]init];
    
    CGFloat itemWidth = (UIScreen.mainScreen.bounds.size.width - 5 * StatusCellMargin) / 3;
    layout.itemSize = CGSizeMake(itemWidth, itemWidth);
    
    layout.minimumLineSpacing = StatusCellMargin;
    layout.minimumLineSpacing = StatusCellMargin;
    
    return layout;
}

@end
