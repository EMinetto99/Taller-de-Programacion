program practica2act5;
const
	dimF=10;
type
	vector= array[1..dimF] of integer;

procedure inicializar_Vector_Numeros(var v: vector);
	var
		i: integer;
	begin
		for i:=1 to dimF do
			v[i]:=0;
		end;
procedure cargarVector_Numeros(var v: vector; var dimL: integer);
	var
		num: integer;
	begin
		// inicializarVec(v);
		write('Ingrese un valor a cargar en el vector (',dimF,' espacios restantes) o "0" para terminar: ');
		readln(num);
		while (num<>0) and (dimL<dimF)do begin
			dimL:=dimL+1;
			v[dimL]:=num;
			if (dimL<dimF) then begin
				write('Ingrese otro valor a cargar en el vector (',dimF-dimL,' espacios restantes) o "0" para terminar: ');
				readln(num);
				end;
			end;
		{ if (dimL<>0) and (dimL<>1) then
			ordenarVector(v,dimL); }
		end;
procedure imprimirVector(v: vector; dimL: integer);
	var
		i: integer;
	begin
		if (dimL=0) then
			writeln('El vector se encuentra sin elementos.')
			else begin
				write(' |');
				for i:=1 to dimL do
					write(' ',v[i],' |');
				writeln;
				end;
		end;
procedure ordenarVector(var v: vector; dimL: integer);
	var
		i, j, act: integer;
	begin
		for i:=2 to dimL do begin
			j:=i-1;
			act:=v[i];
			while (j>0) and (v[j]>act) do begin
				v[j+1]:=v[j];
				j:=j-1;
				end;
			v[j+1]:=act;
			end;
		end;
procedure busquedaDicotomica(v: vector; dimL: integer; dato: integer; var pos: integer);
	procedure busquedaDicotomica_P2(v: vector; ini, fin, dato: integer; var pos: integer);
		var
			medio: integer;
		begin
			if (ini>fin) then
				pos:=-1
				else begin
					medio:=(ini+fin) div 2;
					if (dato=v[medio]) then
						pos:=medio
						else begin
							if (dato<v[medio]) then
								busquedaDicotomica_P2(v,ini,(medio-1),dato,pos)
								else
									busquedaDicotomica_P2(v,(medio+1),fin,dato,pos);
							end;
					end;
			end;
	var
		ini: integer;
	begin
		ini:=1;
		busquedaDicotomica_P2(v, ini, dimL, dato, pos);
		end;
var
	v: vector;
	num, dimL, pos: integer;
begin
	dimL:=0;
	inicializar_Vector_Numeros(v);
	cargarVector_Numeros(v, dimL);
	ordenarVector(v, dimL);
	imprimirVector(v, dimL);
	write('Ingrese un dato a buscar en el vector: ');
	readln(num);
	busquedaDicotomica(v, dimL, num, pos);
	if (pos=-1) then
		writeln('El dato "',num,'" NO SE ENCUENTRA en el vector :(')
		else
			writeln('!!! El dato "',num,'" SE ENCONTRO en la posicion ',pos,' del vector !!!');
	readln;
end.