//
//  MPAViewController.m
//  MyPersistantApp
//
//  Created by Teddy Wyly on 9/22/13.
//  Copyright (c) 2013 Teddy Wyly. All rights reserved.
//

#import "MPAViewController.h"

@interface MPAViewController ()

@end

@implementation MPAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // Initializing a Dictionary and then adding two Key-Value pairs.  Remember, a dictionary is very much like a rolodex or address book.  You have a key (for example, a person's name) and you find the value (a persons phone number).
    NSMutableDictionary *myFirstDictionary = [[NSMutableDictionary alloc] init];
    [myFirstDictionary setObject:[UIColor redColor] forKey:@"AppleColor"];
    [myFirstDictionary setObject:[UIColor blueColor] forKey:@"SkyColor"];
    NSLog(@"My Dictionary contains %@", myFirstDictionary);
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveButtonPressed:(UIButton *)sender
{
    // Access our persistant array in the file system
    NSArray *savedArray = [[NSUserDefaults standardUserDefaults] arrayForKey:@"Key"];
    
    // If there isn't one, initialize one
    if (!savedArray) savedArray = [[NSArray alloc] init];
    
    // Create a mutable copy of this array and add text to it
    NSMutableArray *mutableSavedArray = [savedArray mutableCopy];
    [mutableSavedArray addObject:self.enterTextField.text];
    
    // Put our newly edited array back into the file system
    [[NSUserDefaults standardUserDefaults] setObject:mutableSavedArray forKey:@"Key"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

- (IBAction)showWhatIsSavedButtonPressed:(UIButton *)sender
{
    //Access the persistant array in the file system.
    NSArray *mySavedArray = [[NSUserDefaults standardUserDefaults] arrayForKey:@"Key"];
    
    //Create a mutable string that's text is the text in our enterTextField.  Then add the text from our persistant array.
    NSMutableString *mutableString = [[NSMutableString alloc] initWithString:self.enterTextField.text];
    for (NSString *string in mySavedArray) {
        [mutableString appendString:string];
    }
    
    //Update our displayTextView to show the saved text
    
    self.displayTextView.text = mutableString;
    
}

@end
