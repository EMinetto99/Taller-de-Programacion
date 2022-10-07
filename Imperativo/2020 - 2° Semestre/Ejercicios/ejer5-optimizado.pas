program VectorNumeros;
const
	cantN=20;
type
	vectorN=array[1..cantN] of integer;
function elementoMax(v: vectorN; max, pos: integer):integer;
	begin
		if (v[pos]>max) then
			max:=v[pos];
		elementoMax:=max;
	end;
procedure inicializarVec(var vn: vectorN);
	var
		i: integer;
	begin
		for i:=1 to cantN do
			vn[i]:=0;
	end;
procedure almacenarVec(var vn: vectorN; pos, num: integer);
	begin
		vn[pos]:=num;
	end;
procedure recorrerVector(vn: vectorN);
	var
		i, max, total: integer;
	begin
		total:=0;
		max:=-9999;
		for i:=1 to cantN do begin
			max:=elementoMax(vn,max,i);
			total:=total+vn[i];
			end;
		writeln('Elemento maximo del vector: ',max);
		writeln('Suma total de los elementos del vector: ',total);
	end;
var
	vn: vectorN;
	i, num: integer;
begin
	inicializarVec(vn);
	writeln('Ingrese un numero a almacenar en el vector: (',cantN,' numeros)');
	for i:=1 to cantN do begin
		readln(num);
		almacenarVec(vn,i,num);
		writeln('Ingrese otro numero a almacenar en el vector: (',cantN-i,' restantes)');
		end;
	recorrerVector(vn);
	readln();
end.