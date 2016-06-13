//
//  ViewController.m
//  Colorboard
//
//  Created by Ernald on 6/7/16.
//  Copyright © 2016 Big Nerd. All rights reserved.
//

#import "ColorViewController.h"

@interface ColorViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (weak, nonatomic) IBOutlet UISlider *redSlider;

@property (weak, nonatomic) IBOutlet UISlider *greenSlider;

@property (weak, nonatomic) IBOutlet UISlider *blueSlider;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;

@end

@implementation ColorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIColor *color = self.colorDescription.color;
    
    CGFloat red, green, blue;
    
    [color getRed:&red
           green:&green
           blue:&blue
            alpha:nil];
    
    self.redSlider.value = red;
    self.greenSlider.value = green;
    self.blueSlider.value = blue;
    
    self.view.backgroundColor =  color;
    self.textField.text = self.colorDescription.name;
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.colorDescription.name = self.textField.text;
    self.colorDescription.color = self.view.backgroundColor;
    
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if(!self.existingColor)
    {
        self.navigationItem.rightBarButtonItem = nil;
    }
}

- (IBAction) dismiss:(id)sender
{
    [self.navigationController dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction) changeColor:(id)sender
{
    CGFloat red = self.redSlider.value;
    CGFloat green = self.greenSlider.value;
    CGFloat blue = self.blueSlider.value;
    
    self.view.backgroundColor =
        [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}

@end
