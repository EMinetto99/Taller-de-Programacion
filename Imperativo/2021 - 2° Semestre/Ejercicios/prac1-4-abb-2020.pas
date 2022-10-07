program ListaEnteros;
uses crt;
type
	lista=^nodo;
	nodo=record
		dato: integer;
		sig: lista;
		end;
procedure storeList(var L: lista; z: integer);
	var
		aux: lista;
	begin
		new(aux);
		aux^.dato:=z;
		aux^.sig:=L;
		L:=aux;
		end;
procedure valorMin(L: lista; var min: integer);
	begin
		if (L<>nil) then begin
			if (L^.dato<min) then
				min:=L^.dato;
			L:=L^.sig;
			valorMin(L,min);
			end;
		end;
procedure valorMax(L: lista; var max: integer);
	begin
		if (L<>nil) then begin
			if (L^.dato>max) then
				max:=L^.dato;
			L:=L^.sig;
			valorMax(L,max);
			end;
		end;
function encontrarValor(L: lista; n: integer):boolean;						//ALTERNATIVA - PERO CONSUME UN MÓDULO MÁS DE MEM. DINÁMICA
	begin																	//	function buscarElemento(L: lista; n: integer):boolean;
		if (L=nil) then														//	begin	
			encontrarValor:=false											//		if (L=nil) then	
			else begin														//			buscarElemento:=false
				if (L^.dato=n) then											//			else begin	
					encontrarValor:=true									//				if (L^.dato=n) then	
					else begin												//					buscarElemento:=true
						if (L^.sig=nil) then								//					else begin	
							encontrarValor:=false							//						L:=L^.sig;
							else											//						buscarElemento:=buscarElemento(L,n);
								encontrarValor:=encontrarValor(L^.sig,n);	//						end;
						end;												//				end;
				end;														//	end;
		end;
var
	priL: lista;
	num, min, max: integer;
begin
	min:=9999;
	max:=-9999;
	priL:=nil;
	writeln('Ingrese un numero a cargar o "0" para terminar: ');
	readln(num);
	while (num<>0) do begin
		storeList(priL,num);
		writeln('Ingrese otro numero a cargar o "0" para terminar: ');
		readln(num);
		end;
	write('Ingrese un valor a buscar en la lista: ');
	readln(num);
	valorMin(priL,min);
	valorMax(priL,max);
	writeln('Valor minimo de la lista: ',min);
	writeln('Valor maximo de la lista: ',max);
	if (encontrarValor(priL,num)=true) then begin
		TextBackground(green);
		TextColor(white);
		writeln(' El valor ',num,' se encontro en la lista! ');
		end
		else begin
			TextBackground(red);
			TextColor(yellow);
			writeln(' El valor ',num,' no se encontro en la lista. ');
			end;
	readln();
end.