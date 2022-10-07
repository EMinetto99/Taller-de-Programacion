program EdificioDeOficinas;
const
	cantOFI=300;
type
	oficina=record
		codIDE: integer;
		dni: integer;
		valExp: real;
		end;
	vOficinas=array[1..cantOFI] of oficina;
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
procedure ordenarVector(dimL: integer; var vOF: vOficinas);
	var
		i, j: integer;
		aux: oficina;
	begin
		for i:=2 to dimL do begin
			aux:=vOF[i];
			j:=i-1;
			while (j>0) and (vOF[j].codIDE>aux.codIDE) do begin
				
var
	vOF: vOficinas;
	dimL: integer;
begin
	dimL:=0;
	writeln('Codigo de identificacion:');
	readln(oficina.codIDE);
	while (codIDE<>-1) do begin
		leerOficina(oficina);
		cargarVector(oficina,vOF,dimL);
		writeln('Codigo de identificacion:');
		readln(oficina.codIDE);
		end;
	ordenarVector(dimL,vOF);