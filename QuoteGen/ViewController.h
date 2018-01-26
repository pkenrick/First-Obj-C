//
//  ViewController.h
//  QuoteGen
//
//  Created by William Kenrick on 25/01/2018.
//  Copyright © 2018 William Kenrick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) NSArray *myQuotes;
@property (nonatomic, strong) NSMutableArray *movieQuotes;

@property (nonatomic, strong) IBOutlet UISegmentedControl *quoteOpt;
@property (nonatomic, strong) IBOutlet UITextView *quoteText;

- (IBAction)quoteButtonTapped:(id)sender;

@end

