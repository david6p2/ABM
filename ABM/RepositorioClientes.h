#import <Foundation/Foundation.h>

@interface RepositorioClientes : NSObject

@property (nonatomic, strong) NSMutableArray * clientes;

+(RepositorioClientes *) sharedInstance;

-(void) leer;
-(void) guardar;
-(NSUserDefaults *) ruta;



@end
