//
//  AIZNumberDetailsViewController.m
//  Mnemonics
//
//  Created by X on 11/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZNumberDetailsViewController.h"
#import "AIZNumberEditViewController.h"

@interface AIZNumberDetailsViewController ()

@end

@implementation AIZNumberDetailsViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem)
    {
        _detailItem = newDetailItem;

        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem)
    {
        self.detailDescriptionLabel.text =
            [[self.detailItem valueForKey:@"value"] description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self addNumberLettersWordLabels];
    [self addNumberLettersWordLabelsConstraints];

    [self addNavItem];

    [self configureView];
}

- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    if (self)
    {
        self.title = NSLocalizedString(@"Detail", @"Detail");
    }
    return self;
}

- (void)addNumberLettersWordLabels
{
    self.numberLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.numberLabel.text = @"69";
    self.numberLabel.textAlignment = NSTextAlignmentCenter;
    self.numberLabel.font = [UIFont systemFontOfSize:100.0f];
    [self.numberLabel sizeToFit];
    [self.view addSubview:self.numberLabel];

    self.lettersLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.lettersLabel.text = @"ШР";
    self.lettersLabel.textAlignment = NSTextAlignmentCenter;
    self.lettersLabel.font = [UIFont systemFontOfSize:30.0f];
    [self.lettersLabel sizeToFit];
    [self.view addSubview:self.lettersLabel];

    self.wordLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.wordLabel.text = @"шар";
    self.wordLabel.textAlignment = NSTextAlignmentCenter;
    self.wordLabel.font = [UIFont systemFontOfSize:50.0f];
    [self.wordLabel sizeToFit];
    [self.view addSubview:self.wordLabel];
}

- (void)addNumberLettersWordLabelsConstraints
{
    self.numberLabel.translatesAutoresizingMaskIntoConstraints  = NO;
    self.lettersLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.wordLabel.translatesAutoresizingMaskIntoConstraints    = NO;

    NSDictionary *nameMap = @{ @"topGuide" : self.topLayoutGuide,
                               @"numberLabel" : self.numberLabel,
                               @"lettersLabel" : self.lettersLabel,
                               @"wordLabel" : self.wordLabel };

    NSArray *horizontalNumberLabelConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[numberLabel]-|"
                                            options:0
                                            metrics:nil
                                              views:nameMap];
    [self.view addConstraints:horizontalNumberLabelConstraints];

    NSArray *horizontalLetterLabelConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[lettersLabel]-|"
                                            options:0
                                            metrics:nil
                                              views:nameMap];
    [self.view addConstraints:horizontalLetterLabelConstraints];

    NSArray *horizontalWordLabelConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[wordLabel]-|"
                                            options:0
                                            metrics:nil
                                              views:nameMap];
    [self.view addConstraints:horizontalWordLabelConstraints];

    NSArray *verticalConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"V:[topGuide]-[numberLabel]-[lettersLabel]-[wordLabel]"
                                            options:0
                                            metrics:nil
                                              views:nameMap];
    [self.view addConstraints:verticalConstraints];
}

- (void)addNavItem
{
    UIBarButtonItem *bbi = [[UIBarButtonItem alloc]
                            initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
                            target:self
                            action:@selector(editNumber)];
    self.navigationItem.rightBarButtonItem = bbi;
}

- (void)editNumber
{
    AIZNumberEditViewController *numberEditVC = [[AIZNumberEditViewController alloc] init];

    UINavigationController *nc = [[UINavigationController alloc]
                                  initWithRootViewController:numberEditVC];

    [self presentViewController:nc animated:YES completion:nil];
}

@end

























