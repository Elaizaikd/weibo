#import "StatusNormalCell.h"
#import <Masonry/Masonry.h>
#import "StatusPicsView.h"
#import "Common.h"
@implementation StatusNormalCell

- (void)setupUI{
    [super setupUI];
    
    [self.picsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.textContentLbl.mas_bottom).offset(StatusCellMargin);
        make.left.equalTo(self.contentView.mas_left).offset(StatusCellMargin);
        make.width.equalTo(self.contentView.mas_width).offset(-2*StatusCellMargin);
        make.height.equalTo(@30);
    }];
}

@end
