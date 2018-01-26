//
//  ViewController.m
//  QuoteGen
//
//  Created by William Kenrick on 25/01/2018.
//  Copyright © 2018 William Kenrick. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 1 - Add array of personal quotes
    self.myQuotes = @[
                      @"Live and let live",
                      @"Don't cry over spilt milk",
                      @"Always look on the bright side of life",
                      @"Nobody's perfect",
                      @"Can't see the woods for the trees",
                      @"Better to have loved and lost then not loved at all",
                      @"The early bird catches the worm",
                      @"As slow as a wet week"
                      ];
    
    NSString *plistCatPath = [[NSBundle mainBundle] pathForResource:@"quotes" ofType:@"plist"];
    self.movieQuotes= [NSMutableArray arrayWithContentsOfFile:plistCatPath];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)quoteButtonTapped:(id)sender {
    // 1 - Get number of rows in array
    if (self.quoteOpt.selectedSegmentIndex == 2) {
        int array_tot = [self.myQuotes count];
        // 2 - Get random index
        int index = (arc4random() % array_tot);
        // 3 - Get the quote string for the index
        NSString *my_quote = [self.myQuotes objectAtIndex:index];
        // NSString *my_quote = self.movieQuotes[index][@"quote"];
        // 4 - Display the quote in the text view
        self.quoteText.text = [NSString stringWithFormat:@"Quote:\n\n%@",  my_quote];
    } else {
        // 2.1 - determine category selected
        NSString *selectedCategory = @"classic";
        if (self.quoteOpt.selectedSegmentIndex == 1) {
            selectedCategory = @"modern";
        }
        // 2.2 - filter array by category using predicate
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"category == %@", selectedCategory];
        NSArray *filteredArray = [self.movieQuotes filteredArrayUsingPredicate:predicate];
        // 2.3 - get total number in filtered array
        int array_tot = [filteredArray count];
        //2.4 - as a safeguard, only get quote when array has rows in it
        if (array_tot > 0) {
            // 2.5 - get random index
            int index = (arc4random() % array_tot);
            // 2.6 - get the quote string for the index
            NSString *quote = filteredArray[index][@"quote"];
            self.quoteText.text = [NSString stringWithFormat:@"Movie Quote:\n\n%@", quote];
        } else {
            self.quoteText.text = @"No quotes to display.";
        }
    }
    NSLog(@"Hellooooooo");
}

@end
