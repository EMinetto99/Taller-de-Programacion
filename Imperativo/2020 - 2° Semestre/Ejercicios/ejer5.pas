program VectorNumeros;
const
	cantN=5;
type
	vectorN=array[1..cantN] of integer;
function elementoMax(v: vectorN; pos, max: integer):integer;
	begin
		if (pos<=cantN) then begin
			if (v[pos]>max) then
				max:=v[pos];
			pos:=pos+1;
			elementoMax:=elementoMax(v,pos,max);
			end
			else
				elementoMax:=max;
	end;
function sumaTotal(v: vectorN; pos: integer):integer;
	begin
		if (pos<=cantN) then
			sumaTotal:=v[pos]+sumaTotal(v,pos+1)
			else
				sumaTotal:=0;
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
		max, total, pos: integer;
	begin
		pos:=1;
		total:=0;
		max:=-9999;
		max:=elementoMax(vn,pos,max);
		total:=sumaTotal(vn,pos);
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