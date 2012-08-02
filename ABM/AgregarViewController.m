//
//  AgregarViewController.m
//  ABM
//
//  Created by LSR Marketing Service on 1/08/12.
//  Copyright (c) 2012 LSR Marketing Service. All rights reserved.
//

#import "AgregarViewController.h"
#import "Cliente.h"
#import "RepositorioClientes.h"

@interface AgregarViewController ()

@end

@implementation AgregarViewController
@synthesize txtNombre;
@synthesize swDebe;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)guardar:(id)sender {
    if ([txtNombre.text length]<3) {
        UIAlertView * alerta = [[UIAlertView alloc] initWithTitle:@"Error" message:@"El nombre debe tener al menos 3 letras" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles:nil];
        [alerta show];
    }else {
        Cliente * cliente = [[Cliente alloc] init]; 
        cliente.nombre = txtNombre.text;
        cliente.debeDinero = swDebe.on;
        
        NSMutableArray * clientes = [RepositorioClientes sharedInstance].clientes;
        [clientes addObject:cliente];
        
        [self dismissModalViewControllerAnimated:YES];
    }
    
}
- (IBAction)cancelar:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setTxtNombre:nil];
    [self setSwDebe:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


@end
