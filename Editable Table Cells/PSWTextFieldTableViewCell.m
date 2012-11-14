#import "PSWTextFieldTableViewCell.h"

@implementation PSWTextFieldTableViewCell

@synthesize textField = _textField;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        CGRect fieldRect = CGRectMake(120, 12, 185, 30);
        
        self.textField = [[UITextField alloc] initWithFrame:fieldRect];
        self.textField.placeholder = @"Your title";
        self.textField.keyboardType = UIKeyboardAppearanceDefault;

        [self addSubview:self.textField];
    }
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
