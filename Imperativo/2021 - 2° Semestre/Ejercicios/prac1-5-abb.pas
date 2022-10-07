program vector20Enteros;
const
	cantZ=5;
type
	vectorZ=array[1..cantZ] of integer;
function sumaTotal(v: vectorZ; pos: integer):integer;
	begin
		if (pos<=cantZ) then
			sumaTotal:=v[pos]+sumaTotal(v,pos+1)
			else
				sumaTotal:=0;
		end;
function valorMax(v: vectorZ; pos, max: integer):integer;
	begin
		if (pos<=cantZ) then begin
			if (v[pos]>max) then
				max:=v[pos];
			valorMax:=valorMax(v,pos+1,max);
			end
			else
				valorMax:=max;
		end;
procedure inicializarVector(var v: vectorZ);
	var
		j: integer;
	begin
		for j:=1 to cantZ do
			v[j]:=0;
		end;
procedure cargarVector(var ve: vectorZ);
	var
		i, num: integer;
	begin
		inicializarVector(ve);
		for i:=1 to cantZ do begin
			writeln('Ingrese un numero a cargar en el vector (',cantZ-i+1,' restantes): ');
			readln(num);
			ve[i]:=num;
			end;
		end;
var
	ve: vectorZ;
	max: integer;
begin
	max:=-9999;
	cargarVector(ve);
	writeln('Maximo valor del vector: ',valorMax(ve,1,max));
	writeln('Suma total de los valores contenidos en el vector: ',sumaTotal(ve,1));
	readln();
end.