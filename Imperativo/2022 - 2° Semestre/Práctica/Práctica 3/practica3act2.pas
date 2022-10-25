program practica3act2;
type
	infoVentas = record
		cod: integer;
		fecha: string;
		cant: integer;
		end;
	prodVendidos = record
		cod: integer;
		cant: integer;
		end;
	arbol_info=^nodoI;
	nodoI = record
		dato: infoVentas;
		HI: arbol_info;
		HD: arbol_info;
		end;
	arbol_prod=^nodoP;
	nodoP = record
		dato: prodVendidos;
		HI: arbol_prod;
		HD: arbol_prod;
		end;

procedure enOrdenSales(a: arbol_info);
	begin
    	if (a <> nil) then begin
        	enOrdenSales (a^.HI);
        	write (' | ',a^.dato.cod,' | ');
        	enOrdenSales (a^.HD);
        	end;
        end;
procedure enOrdenSold_Products(a: arbol_prod);
	begin
    	if (a <> nil) then begin
        	enOrdenSold_Products (a^.HI);
        	write (' | ',a^.dato.cod,' |');
        	write (a^.dato.cant,'| ');
        	enOrdenSold_Products (a^.HD);
        	end;
        end;
function sumaArbolDesordenado(a: arbol_info; num: integer): integer;
	begin
		if (a = nil) then
			sumaArbolDesordenado:= 0
			else begin
				if (num < a^.dato.cod) then
					sumaArbolDesordenado:= sumaArbolDesordenado(a^.HI, num)
					else begin
						if (num = a^.dato.cod) then
							sumaArbolDesordenado:= a^.dato.cant + sumaArbolDesordenado(a^.HD, num)
							else
								sumaArbolDesordenado:= sumaArbolDesordenado(a^.HD, num);
						end;
				end;
		end;
function sumaArbolOrdenado(a: arbol_prod; num: integer): integer;
	begin
		if (a = nil) then
			sumaArbolOrdenado:= 0
			else begin
				if (num < a^.dato.cod) then
					sumaArbolOrdenado:= sumaArbolOrdenado(a^.HI, num)
					else begin
						if (num = a^.dato.cod) then
							sumaArbolOrdenado:= a^.dato.cant
							else
								sumaArbolOrdenado:= sumaArbolOrdenado(a^.HD, num);
						end;
				end;
		end;
procedure procesarInfo(var aI: arbol_info; var aV: arbol_prod);

	procedure leerVentas(var a: arbol_info);
		procedure cargarArbolInfo(var a: arbol_info; i: infoVentas);
			begin
				if (a = nil) then begin
					new(a);
					a^.dato:=i;
					a^.HI:=nil;
					a^.HD:=nil; 
					end
					else begin
						if (i.cod<a^.dato.cod) then
							cargarArbolInfo(a^.HI, i)
							else
								cargarArbolInfo(a^.HD, i);
						end;
				end;
		var
			info: infoVentas;
		begin
			writeln('====== SISTEMA DE VENTAS ======');
			write('Ingrese el codigo de producto (0 para terminar): ');
			readln(info.cod);
			while (info.cod <> 0) do begin
				write('Ingrese la fecha del producto: ');
				readln(info.fecha);
				write('Ingrese la cantidad de productos: ');
				readln(info.cant);
				cargarArbolInfo(a, info);
				writeln;
				write('Ingrese el codigo de producto (0 para terminar): ');
				readln(info.cod);
				end;
			end;
	procedure cargarArbolSold(var aV: arbol_prod; aI: arbol_info);
		var
			aux: arbol_prod;
		begin
			if (aV = nil) then begin
				new(aux);
				aux^.dato.cod:=aI^.dato.cod;
				aux^.dato.cant:=aI^.dato.cant;
				aux^.HI:=nil;
				aux^.HD:=nil;
				aV:=aux;
				end
				else begin
					if (aI^.dato.cod < aV^.dato.cod) then
						cargarArbolSold(aV^.HI, aI)
						else begin
							if (aV^.dato.cod = aI^.dato.cod) then
								aV^.dato.cant:= aV^.dato.cant + aI^.dato.cant // Actualizo el DATO del campo
								else
									cargarArbolSold(aV^.HD, aI);
							end;
					end;
			end;
	procedure recorrerArbol(aI: arbol_info; var aV: arbol_prod);
		begin
			if (aI <> nil) then begin
				recorrerArbol(aI^.HI, aV);
				cargarArbolSold(aV, aI);
				recorrerArbol(aI^.HD, aV);
				end;
			end;
	begin
		leerVentas(aI);
		recorrerArbol(aI, aV);
		end;
// PROGRAMA PRINCIPAL
var
	aI: arbol_info;
	aV: arbol_prod;
	num: integer;
begin
	aI:=nil;
	aV:=nil;
	procesarInfo(aI, aV);
	enOrdenSales(aI);
	writeln;
	enOrdenSold_Products(aV);
	writeln;
	write('Ingrese un codigo de producto a buscar en el PRIMER arbol: ');
	readln(num);
	writeln('Suma total de unidades vendidas del producto "',num,'": ',sumaArbolDesordenado(aI, num));
	// Agregar modulo que informe si no existe el dato
	write('Ingrese otro codigo de producto a buscar en el SEGUNDO arbol: ');
	readln(num);
	writeln('Suma total de unidades vendidas del producto "',num,'": ',sumaArbolOrdenado(aV, num));
	// Agregar modulo que informe si no existe el dato
	readln;
end.