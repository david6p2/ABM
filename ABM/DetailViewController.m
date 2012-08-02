//
//  DetailViewController.m
//  ABM
//
//  Created by LSR Marketing Service on 1/08/12.
//  Copyright (c) 2012 LSR Marketing Service. All rights reserved.
//

#import "DetailViewController.h"
#import "Cliente.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

@synthesize cliente;
@synthesize detailDescriptionLabel = _detailDescriptionLabel;
@synthesize txtNombre;
@synthesize swDebe;

#pragma mark - Managing the detail item

/*- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}*/

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    txtNombre.text = cliente.nombre;
    swDebe.on = cliente.debeDinero;
    
    /*[self configureView];*/
}

- (void)viewDidUnload
{
    [self setTxtNombre:nil];
    [self setSwDebe:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.detailDescriptionLabel = nil;
}

- (void)viewWillDisappear:(BOOL)animated{
    cliente.nombre = txtNombre.text;
    cliente.debeDinero = swDebe.on;
    
    [super viewWillDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
