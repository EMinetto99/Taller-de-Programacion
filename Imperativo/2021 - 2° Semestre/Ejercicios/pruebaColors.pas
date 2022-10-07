program PruebaDeCRT;
 uses crt;
 var
   bucle : integer;
   tecla : char;
 begin
   ClrScr;                        { Borra la pantalla }
   TextColor( Yellow );           { Color amarillo }
   TextBackground( Red );         { Fondo rojo }
   GotoXY( 40, 13 );              { Vamos al centro de la pantalla }
   write(' Hola! ');               { Saludamos ;-) }
   Delay( 1000 );                 { Esperamos un segundo }
   Window ( 1, 15, 80, 23 );      { Ventana entre las filas 15 y 23 }
   TextBackground (Black);       { Con fondo azul }
   ClrScr;                        { La borramos para que se vea }
   for bucle := 1 to 255 do begin
      TextBackground(bucle); 
      writeln();         { Escribimos del 1 al 100 }
      Delay(62);
      end;
   WriteLn( 'Pulse una tecla..');
   tecla := ReadKey;              { Esperamos que se pulse una tecla }
   Window( 1, 1, 80, 25 );        { Restauramos ventana original }
   GotoXY( 1, 24 );               { Vamos a la penúltima línea }
   Write( 'Ha pulsado ', tecla ); { Pos eso }
   Sound( 220 );                  { Sonido de frecuencia 220 Hz }
   Delay( 500 );                  { Durante medio segundo }
   NoSound;                       { Se acabó el sonido }
   Delay( 2000 );                 { Pausa antes de acabar }
   TextColor( LightGray );        { Colores por defecto del DOS }
   TextBackground( Black );       { Y borramos la pantalla }
   ClrScr;
 end.