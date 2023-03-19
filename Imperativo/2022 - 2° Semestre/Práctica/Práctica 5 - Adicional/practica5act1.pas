program practica5act1;
const
	cantOfi = 300;
type
	infoExpensa = record
		cod: integer;
		dni: integer;
		valor: real;
		end;
	vec_oficinas = array [1..cantOfi] of infoExpensa;
procedure leerOficina(var e: infoExpensa);
	begin
		write('Ingrese codigo: ');
		readln(e.cod);
		if (e.cod <> -1) then begin
			write('Ingrese DNI: ');
			readln(e.dni);
			write('Ingrese el valor de la expensa: ');
			readln(e.valor);
			end;
		end;
procedure almacenar(var v: vec_oficinas; var dimL: integer; e: infoExpensa);
	begin
		dimL := dimL + 1;
		v[dimL] := e;
		end;
procedure ordenarVectorEnOrden(var v: vec_oficinas; dimL: integer);
	var
		i, j: integer;
		actual: infoExpensa;
	begin
		for i:=2 to dimL do begin
			actual := v[i];
			j:= i - 1;
			while (j > 0) and (v[j].cod > actual.cod) do begin
				v[j+1] := v[j];
				j:= j - 1;
				end;
			v[j+1]:=actual;
			end;
		end;
procedure busquedaDicotomica(v: vec_oficinas; ini, fin, dato: integer; var pos: integer);
		var
			medio: integer;
		begin
			if (ini > fin) then
				pos:=-1
				else begin
					medio:= (ini+fin) div 2;
					if (dato = v[medio].cod) then
						pos := medio
						else begin
							if (dato < v[medio].cod) then
								busquedaDicotomica(v, ini, (medio-1), dato, pos)
								else
									busquedaDicotomica(v, (medio+1), fin, dato, pos);
							end;
					end;
			end;
function totalRecursivo(v: vec_oficinas; dimL: integer): real;
	begin
		if (dimL = 0) then
			totalRecursivo := 0
			else
				totalRecursivo := v[dimL].valor + totalRecursivo(v, (dimL-1))
		end;
var
	e: infoExpensa;
	vO: vec_oficinas;
	dimL, num, pos: integer;
begin
	dimL := 0;
	leerOficina(e);
	while (e.cod <> -1) do begin
		almacenar(vO, dimL, e);
		writeln;
		leerOficina(e);
		end;
	ordenarVectorEnOrden(vO, dimL);
	write('Ingrese un codigo a BUSCAR en el vector: ');
	readln(num);
	busquedaDicotomica(vO, 1, dimL, num, pos);
	writeln;
	if (pos <> -1) then begin
		writeln('El dato indicado EXISTE!');
		writeln('DNI: ',vO[pos].dni);
		end
		else
			writeln('El dato ingresado no existe en el vector.');
	writeln;
	writeln('Valor total de las expensas de oficinas: ',totalRecursivo(vO, dimL):5:2);
	readln;
end.