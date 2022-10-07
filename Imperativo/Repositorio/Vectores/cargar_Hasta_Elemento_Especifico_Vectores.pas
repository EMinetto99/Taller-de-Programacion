// La dimensión lógica (dimL) tiene que estar inicializada en 0 o con elementos desde donde se llame al método
procedure cargar_Hasta_Elemento_Especifico( var v: vector; var dimL: integer );
 var
    dato: tipoDato;
 begin
	readln(dato);
	while (dato <> "Elemento a discriminar" ) and ( dimL < dimF ) do begin  {Si el dato a buscar no llegó y no se terminó el espacio, continúo}
        dimL := dimL + 1;	{ Incremento el tamaño }
        v [dimL] := dato;	{ Ingreso el dato al vector }
        read (dato);		{ Leo el siguiente dato }
		end;
	end;