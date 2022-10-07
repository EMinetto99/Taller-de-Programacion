program vectorRequeteCargado;
const
	cantN=100;
type
	vectorNum=array[1..cantN] of integer;
procedure inicializarVector(var vN: vectorNum);
	var
		i:integer;
	begin
		for i:=1 to cantN do
			vN[i]:=0;
	end;
procedure cargarVector(var vN: vectorNum; var dimL: integer);
	var
		num: integer;
	begin
		num:=0;
		writeln('Ingrese un numero a cargar o coloque "-1" para cancelar:');
		readln(num);
		while (dimL<cantN) and (num<>-1) do begin
			dimL:=dimL+1;
			vN[dimL]:=num;
			writeln('Ingrese otro numero a cargar o "-1" para terminar:');
			readln(num);
			end;
	end;
procedure ordenarVectorAMayor(var vN: vectorNum; dimL: integer);
	var
		i, j, actual: integer;
	begin
		actual:=0;
		for i:=2 to dimL do begin
			actual:=vN[i];
			j:=i-1;
			while (j>0) and (vN[j]>actual) do begin
				vN[j+1]:=vN[j];
				j:=j-1;
				end;
			vN[j+1]:=actual;
			end;
	end;
procedure imprimirVector(vN: vectorNum; dimL: integer);
	var
		i: integer;
	begin
		write('|');
		for i:=1 to dimL do
			write(vN[i],'|');
	end;
var
	vN: vectorNum;
	dimL: integer;
begin
	dimL:=0;
	inicializarVector(vN);
	cargarVector(vN,dimL);
	ordenarVectorAMayor(vN,dimL);
	imprimirVector(vN,dimL);
	readln();
end.