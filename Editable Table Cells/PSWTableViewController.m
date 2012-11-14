#import "PSWTableViewController.h"
#import "PSWTextFieldTableViewCell.h"
#import "PSWTextViewTableViewCell.h"

@interface PSWTableViewController ()

@end

@implementation PSWTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 1) {
        PSWTextViewTableViewCell *cell = [[PSWTextViewTableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@"StaticCell"];
        
        cell.textLabel.text = @"Notes";
        cell.textField.delegate = self;
        
        [self textViewDidChange:cell.textField];
        
        return cell;
        
    }
    else {
        PSWTextFieldTableViewCell *cell = [[PSWTextFieldTableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@"StaticCell"];
        
        cell.textLabel.text = @"Title";
        cell.textField.placeholder = @"Enter your title here";
        
        return cell;
    }
}

#pragma mark Text view delegate
- (void)textViewDidChange:(UITextView *)textView
{
    PSWTextViewTableViewCell *cell = (PSWTextViewTableViewCell *) textView.superview;
    
    CGRect frame = textView.frame;
    frame.size.height = textView.contentSize.height;
    textView.frame = frame;
    
    frame = cell.frame;
    frame.size.height = MAX(35.0f, textView.frame.size.height + 1);
    cell.frame = frame;
    
    frame = cell.textLabel.frame;
    frame.origin.y = 11.0f;
    cell.textLabel.frame = frame;
    
    [cell.textField setContentOffset:CGPointMake(0, 0) animated:NO];
}

#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    
    if (indexPath.row == 1) {
        PSWTextViewTableViewCell *theCell = (PSWTextViewTableViewCell *) cell;
        return theCell.textField.contentSize.height;
    }
    
    return tableView.rowHeight;
}

@end
