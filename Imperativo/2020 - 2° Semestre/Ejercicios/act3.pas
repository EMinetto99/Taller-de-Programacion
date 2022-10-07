program actividad1;
const
	cantN=20;
type
	vectorEnt=array[1..cantN] of integer;
procedure inicializarVector(var vE: vectorEnt);
	var
		i:integer;
	begin
		for i:=1 to cantN do
			vE[i]:=0;
	end;
procedure cargarVector(var vE: vectorEnt; var dimL: integer);
	var
		num: integer;
	begin
		num:=0;
		writeln('Ingrese un numero a cargar o coloque "0" para cancelar:');
		readln(num);
		while (dimL<cantN) and (num<>0) do begin
			dimL:=dimL+1;
			vE[dimL]:=num;
			writeln('Ingrese otro numero a cargar o "0" para terminar:');
			readln(num);
			end;
	end;
procedure eliminarElemento(var vE: vectorEnt; num: integer; var dimL: integer);
	var
		i, j: integer;
	begin
		i:=1;
		while (vE[i]<>num) and (i<dimL) do
			i:=i+1;
		if (vE[i]=num) then begin
			for j:=i to dimL-1 do
				vE[j]:=vE[j+1];
			dimL:=dimL-1;
			end;
	end;
procedure imprimirVector(vE: vectorEnt; dimL: integer);
	var
		i: integer;
	begin
		write('|');
		for i:=1 to dimL do
			write(vE[i],'|');
	end;
var
	vE: vectorEnt;
	dimL, n: integer;
begin
	dimL:=0;
	inicializarVector(vE);
	cargarVector(vE,dimL);
	imprimirVector(vE,dimL);
	writeln('Elemento a eliminar del vector:');
	readln(n);
	eliminarElemento(vE,n,dimL);
	imprimirVector(vE,dimL);
	readln();
end.