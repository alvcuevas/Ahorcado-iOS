//
//  AhorcadoViewController.h
//  Ahorcado
//
//  Created by Eric Navarro Losier on 07/10/13.
//  Copyright (c) 2013 Eric Navarro Losier. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AhorcadoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *palabraOculta;


@property   (strong, nonatomic) NSString *palabrasecreta;

@property (strong, nonatomic) IBOutlet UIImageView *imagenesAhorcado;
- (int) chequeaLetra:(NSString *)letra;

- (void) poneGuionesEnLabel;
- (void) cambiaImagenMonigote:(int) numeroImagen;

- (BOOL) partidaGanada;


@end
