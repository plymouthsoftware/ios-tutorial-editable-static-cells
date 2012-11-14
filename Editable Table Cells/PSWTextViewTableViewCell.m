#import "PSWTextViewTableViewCell.h"

@implementation PSWTextViewTableViewCell

@synthesize textField = _textField;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        CGRect fieldRect = CGRectMake(112, 0, 185, 30);
        
        self.textField = [[UITextView alloc] initWithFrame:fieldRect];
        self.textField.editable = YES;
        self.textField.keyboardType = UIKeyboardAppearanceDefault;
        self.textField.backgroundColor = [UIColor clearColor];
        self.textField.contentInset = UIEdgeInsetsZero;
        self.textField.font = [UIFont systemFontOfSize:17.0f];
        
        [self addSubview:self.textField];
        
    }
    return self;
}

- (CGFloat)textViewTextHeight
{
    CGSize stringSize = [self.textField.text sizeWithFont:[UIFont boldSystemFontOfSize:15]
                                        constrainedToSize:CGSizeMake(185, 9999)
                                            lineBreakMode:UILineBreakModeWordWrap];
    
    return stringSize.height;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
