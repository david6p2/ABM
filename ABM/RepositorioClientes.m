
#import "RepositorioClientes.h"
#import "Cliente.h"

@implementation RepositorioClientes

@synthesize clientes;

static RepositorioClientes * instancia;

-(id)init {
    if(self=[super init]){
        [self leer];
        if (self.clientes==nil) {
            self.clientes = [[NSMutableArray alloc] init];
        }
        
    }
    return self;
}

-(void) leer{
    NSArray * clientesLeidos = [[NSArray alloc] initWithArray:[[self ruta] objectForKey:@"clientesGuardados"]];
    if (clientesLeidos!=nil) {
        self.clientes = [[NSMutableArray alloc] init];
        for (NSDictionary * diccionario in clientesLeidos) {
            Cliente * cliente = [[Cliente alloc] init];
            cliente.nombre = [diccionario objectForKey:@"nombre"];
            cliente.debeDinero = [[diccionario objectForKey:@"debe"]boolValue];
            
            [self.clientes addObject:cliente];
        }
    }
}

-(void) guardar{
    NSMutableArray * clientesAGuardar = [[NSMutableArray alloc] init];
    for (Cliente * cliente in self.clientes) {
        NSDictionary * diccionario = [[NSDictionary alloc] initWithObjectsAndKeys:cliente.nombre,@"nombre",[NSNumber numberWithBool:cliente.debeDinero], @"debe", nil];
        [clientesAGuardar addObject:diccionario];
    }
    [[self ruta] setObject:clientesAGuardar forKey:@"clientesGuardados"];
}

-(NSUserDefaults *) ruta{
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    /*[defaults setObject:[self accessToken] forKey:kFBAccessTokenKey];
     [defaults setObject:[self expirationDate] forKey:kFBExpirationDateKey];
     [defaults synchronize];
      self.accessToken = [defaults objectForKey:kFBAccessTokenKey];*/
    return defaults;

}

+(RepositorioClientes *) sharedInstance{
    if (instancia == nil){
        instancia =  [[RepositorioClientes alloc] init];
    }
    return instancia;
}

@end
