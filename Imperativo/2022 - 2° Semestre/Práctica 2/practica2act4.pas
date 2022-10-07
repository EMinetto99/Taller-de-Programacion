program practica2act4;
const
	dimF=20;
	rangeRND=100;
type
	vector= array[1..dimF] of integer;
procedure inicializar_Vector_Numeros(var v: vector);
	var
		i: integer;
	begin
		for i:=1 to dimF do
			v[i]:=0;
		end;
procedure GenerarVector(var v: vector);
	procedure cargarVector(var v: vector; dimL: integer);
		var
			num: integer;
  		begin
  			if (dimL<dimF) then begin
  				repeat
  					num:=random(rangeRND);
  					until (num <> 0);
  				dimL:=dimL+1;
  				v[dimL]:=num;
  				cargarVector(v,dimL);
				end;
			end;
	var
		dimL: integer;
	begin
		dimL:=0;	// Sin elementos
		randomize;
		cargarVector(v,dimL);
		end;
procedure imprimirVector(v: vector);
	var
		i: integer;
	begin
		write(' |');
		for i:=1 to dimF do
			write(' ',v[i],' |');
		writeln;
		end;

function buscarMaximoVector(v: vector): integer;
	function buscarMaximo_VR(v: vector; i, max: integer): integer;
		begin
			if (i < dimF) then begin
				if (v[i]>max) then
					max:=v[i];
				i:=i+1;
				buscarMaximo_VR:=buscarMaximo_VR(v, i, max);
				end
				else
					buscarMaximo_VR:=max;
			end;
	var
		iterador, max: integer;
	begin
		iterador:=0;
		max:=-9999;
		buscarMaximoVector:=buscarMaximo_VR(v, iterador, max);
		end;
function sumaVector(v: vector; dim: integer): integer;
	begin
		if (dim = 0) then
			sumaVector := 0
			else
				sumaVector := sumaVector(v, dim-1) + v[dim];
		end;
var
	vN: vector;
begin
	inicializar_Vector_Numeros(vN);
	GenerarVector(vN);
	imprimirVector(vN);
	writeln('Valor MAXIMO del vector: ',buscarMaximoVector(vN));
	writeln('Suma de todos los valores del vector: ',sumaVector(vN, dimF));
	readln();
end.