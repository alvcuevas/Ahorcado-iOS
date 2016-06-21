//
//  AhorcadoViewController.m
//  Ahorcado
//
//  Created by Eric Navarro Losier on 07/10/13.
//  Copyright (c) 2013 Eric Navarro Losier. All rights reserved.
//

#import "AhorcadoViewController.h"

@interface AhorcadoViewController ()

@property int   numeroDeFallos;

@end

@implementation AhorcadoViewController

- (void) poneGuionesEnLabel{
    self.palabraOculta.text =@"";
    for (int i=0; i< _palabrasecreta.length; i++) {
        self.palabraOculta.text = [self.palabraOculta.text stringByAppendingString:@"_ "];
    }
    
}

- (int) chequeaLetra:(NSString *)letra;{
    int acierto = 0;
    char letraActual;
    char letraParaComparar = [letra characterAtIndex:0] ;
    NSRange rango;
    for (int i=0; i < _palabrasecreta.length; i++) {
        letraActual = [_palabrasecreta characterAtIndex: i];
        if (letraActual == letraParaComparar){
            acierto++;
            rango = NSMakeRange(2*i, 1);
            self.palabraOculta.text = [self.palabraOculta.text stringByReplacingCharactersInRange:rango withString:letra];
        }
    }
    NSLog(@"tiene%i", _numeroDeFallos);
    NSLog(@"La letra pulsada es %@", letra);
    return acierto;
}



- (IBAction)letraPulsada:(UIButton *)sender {
    NSString *letra = [sender currentTitle];
    [sender setHidden:true];
    
    int numeroLetras = [self chequeaLetra:letra];
    
    if (numeroLetras == 0) {
        _numeroDeFallos++;
    }
    [self cambiaImagenMonigote:_numeroDeFallos];
    if (self.partidaGanada) {
        [self cambiaImagenMonigote:30];
    }
}

- (BOOL) partidaGanada {
    bool ganador = false;
    
    char letraParaComparar;
    for (int i=0; i< _palabrasecreta.length; i++) {
        letraParaComparar = [self.palabraOculta.text characterAtIndex:i];
        if (letraParaComparar == '_'){
            ganador = false;
        }
    }
    return ganador;
}
    
    
- (void) cambiaImagenMonigote:(int) numeroImagen{
    
    switch (numeroImagen) {
        case 0:
            //acciones cuando hay cero fallos
            self.imagenesAhorcado.image = [UIImage imageNamed:@"ahorcado_0.png"];
            break;
        case 1:
            //acciones cuando hay un fallo
            self.imagenesAhorcado.image = [UIImage imageNamed:@"ahorcado_1.png"];
            break;
        case 2:
            //acciones cuando hay dos fallos
            self.imagenesAhorcado.image = [UIImage imageNamed:@"ahorcado_2.png"];
            break;
        case 3:
            //acciones cuando hay 3 fallos
            self.imagenesAhorcado.image = [UIImage imageNamed:@"ahorcado_3.png"];
            break;
        case 4:
            //acciones cuando hay 4 fallos
            self.imagenesAhorcado.image = [UIImage imageNamed:@"ahorcado_4.png"];
            break;
        case 5:
            //acciones cuando hay 5 fallos
            self.imagenesAhorcado.image = [UIImage imageNamed:@"ahorcado_5.png"];
            break;
        case 6:
            //acción al acertar la palabra
            if(self.numeroDeFallos < self.palabrasecreta.length){
                self.imagenesAhorcado.image = [UIImage imageNamed:@"acertasteTodo.png"];}
            break;
        default:
            //acciones cuando hay 6 fallos y termina el juego
            if (_numeroDeFallos > 5){
                self.imagenesAhorcado.image = [UIImage imageNamed:@"ahorcado_fin.png"];}
            break;
    }

    
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    _palabrasecreta = @"cetys";
	
    [self poneGuionesEnLabel];
    
    // Do any additional setup after loading the view, typically from a nib.
}






@end
