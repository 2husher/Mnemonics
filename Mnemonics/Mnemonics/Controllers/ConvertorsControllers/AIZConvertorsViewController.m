//
//  AIZWord2NumbersViewController.m
//  Mnemonics
//
//  Created by X on 18/12/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZConvertorsViewController.h"

@interface AIZConvertorsViewController ()

@end

@implementation AIZConvertorsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    if (self)
    {
        self.title = NSLocalizedString(@"Convertors", @"Convertors");

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self addSegmentedControl];
    [self addSegmentedControlConstraints];
}

- (void)addSegmentedControl
{
    self.segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"Word2Numbers", @"Number2Words"]];

    [self.segmentedControl addTarget:self
                              action:@selector(toggleControls:)
                    forControlEvents:UIControlEventValueChanged];

    self.segmentedControl.selectedSegmentIndex = 0;

    [self.view addSubview:self.segmentedControl];
}

- (void)toggleControls:(UISegmentedControl *)sender
{
    if (sender.selectedSegmentIndex == 0)
    {

    }
    else if (sender.selectedSegmentIndex == 1)
    {

    }
}

- (void)addSegmentedControlConstraints
{
    self.segmentedControl.translatesAutoresizingMaskIntoConstraints = NO;

    id topGuide = self.topLayoutGuide;

    NSDictionary *nameMap = @{ @"topGuide" : topGuide,
                               @"segmentedControl" : self.segmentedControl };

    NSArray *verticalConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"V:[topGuide]-50-[segmentedControl]"
                                            options:0
                                            metrics:nil
                                              views:nameMap];

    [self.view addConstraints:verticalConstraints];

    NSArray *horizontalConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[segmentedControl]-|"
                                            options:0
                                            metrics:nil
                                              views:nameMap];

    [self.view addConstraints:horizontalConstraints];
}

@end
