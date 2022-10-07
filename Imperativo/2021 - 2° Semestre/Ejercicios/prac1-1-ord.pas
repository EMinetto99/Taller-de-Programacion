program EdificioDeOficinas;
const
	cantOFICCE=300;
type
	oficina=record
		codIDE: integer;
		dni: integer;
		valExp: real;
		end;
	vOficinas=array[1..cantOFICCE] of oficina;
procedure leerOficina(var ofi: oficina);
	begin
		writeln('DNI del propietario:');
		readln(ofi.dni);
		writeln('Valor de la Expensa:');
		readln(ofi.valExp);
	end;
procedure cargarVector(ofi: oficina; var vOF: vOficinas; var dimL: integer);
	begin
		dimL:=dimL+1;
		vOF[dimL]:=ofi;
	end;
procedure imprimirVector(dimL: integer; vOF: vOficinas);
	var
		i: integer;
	begin
		for i:=1 to dimL do
			write('| CODIGO de IDENT: ',vOF[i].codIDE,' |');
		end;
procedure ordenarVector(dimL: integer; var vOF: vOficinas);
	var
		i, j: integer;
		act: oficina;
	begin
		for i:=2 to dimL do begin
			act:=vOF[i];
			j:=i-1;
			while (j>0) and (vOF[j].codIDE>act.codIDE) do begin
				vOF[j+1]:=vOF[j];
				j:=j-1;
				end;
			vOF[j+1]:=act;
			end;
		end;
var
	vOF: vOficinas;
	ofi: oficina;
	dimL: integer;
begin
	dimL:=0;
	writeln('Codigo de identificacion:');
	readln(ofi.codIDE);
	while (ofi.codIDE<>-1) do begin
		leerOficina(ofi);
		cargarVector(ofi,vOF,dimL);
		writeln('Codigo de identificacion:');
		readln(ofi.codIDE);
		end;
	ordenarVector(dimL,vOF);
	imprimirVector(dimL,vOF);
	readln();
end.