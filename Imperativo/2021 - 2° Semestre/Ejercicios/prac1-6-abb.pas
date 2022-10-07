program busquedaDicoVector;
uses crt;
const
	cantZ=10;
type
	vectorZ=array[1..cantZ] of integer;
procedure inicializarVec(var v: vectorZ);
	var
		j: integer;
	begin
		for j:=1 to cantZ do
			v[j]:=0;
	end;
procedure ordenarVector(var v: vectorZ; dimL: integer);
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
procedure cargarVector(var v: vectorZ; var dimL: integer);
	var
		num: integer;
	begin
		inicializarVec(v);
		write('Ingrese un valor a cargar en el vector (',cantZ,' espacios restantes) o "0" para terminar: ');
		readln(num);
		while (num<>0) and (dimL<=cantZ)do begin
			dimL:=dimL+1;
			v[dimL]:=num;
			write('Ingrese otro valor a cargar en el vector (',cantZ-dimL+1,' espacios restantes) o "0" para terminar: ');
			readln(num);
			end;
		if (dimL<>0) and (dimL<>1) then
			ordenarVector(v,dimL);
		end;
procedure busquedaDicotomica(v: vectorZ; ini, fin, dato: integer; var pos: integer);
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
							busquedaDicotomica(v,ini,(medio-1),dato,pos)
							else
								busquedaDicotomica(v,(medio+1),fin,dato,pos);
						end;
				end;
		end;
procedure imprimir(v: vectorZ; dimL, dato, pos: integer);
	var
		k: integer;
	begin
		if (dimL=0) then begin
			write('vector ');
			textbackground(white);
			textcolor(black);
			write(' |"Vacio"| ');
			sound(400);
			delay(125);
			nosound;
			sound(400);
			delay(125);
			nosound;
			sound(400);
			delay(125);
			nosound;
			end
			else begin
				k:=1;
				write(' vEnteros |');
				while (k<=dimL) do begin
					write(v[k],'|');
					k:=k+1;
					end;
				writeln;
				if (pos=-1) then begin
					textbackground(red);
					textcolor(yellow);
					writeln(' El dato ',dato,' no se ha encontrado en la estructura :( ');
					sound(220);
					delay(500);
					nosound;
					delay(2000);
					end
					else begin
						textbackground(green);
						textcolor(white);
						writeln(' El dato ',dato,' SE HA ENCONTRADO en la posicion "',pos,'" de la estructura!');
						sound(900);
						delay(200);
						nosound;
						delay(2000);
						end;
				end;
		end;
var
	ve: vectorZ;
	ini, dimL, pos, dato: integer;
begin
	dimL:=0;
	ini:=1;
	cargarVector(ve,dimL);
	write('Que dato desea buscar en la estructura? Ingrese numero: ');
	readln(dato);
	busquedaDicotomica(ve,ini,dimL,dato,pos);
	imprimir(ve,dimL,dato,pos);
	readln();
end.