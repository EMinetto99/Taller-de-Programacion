program ABBEnteros;
const
	corte=0;
type
	arbol=^nodo;
	nodo=record
		dato: integer;
		HI: arbol;
		HD: arbol;
		end;
procedure cargarABB(var a: arbol; z: integer);
	begin
		if (a=nil) then begin
			new(a);
			a^.dato:=z;
			a^.HI:=nil;
			a^.HD:=nil;
			end
			else begin
				if (z<>a^.dato) then begin
					if (z<a^.dato) then
						cargarABB(a^.HI,z)
						else
							cargarABB(a^.HD,z);
					end;
				end;
		end;
function valorMAX(a: arbol):integer;
	begin
		if (a=nil) then
			valorMAX:=-9999
			else begin
				if (a^.HD=nil) then
					valorMAX:=a^.dato
					else
						valorMAX:=valorMAX(a^.HD);
					end;
		end;
function valorMIN(a: arbol):integer;
	begin
		if (a=nil) then
			valorMIN:=32767
			else begin
				if (a^.HI=nil) then
					valorMIN:=a^.dato
					else
						valorMIN:=valorMIN(a^.HI);
				end;
		end;
procedure cantELEM(a: arbol; var cant: integer);
	begin
		if (a<>nil) then begin
			cant:=cant+1;
			cantELEM(a^.HI,cant);
			cantELEM(a^.HD,cant);
			end;
		end;
procedure printABBCreciente(a: arbol);
	begin
		if (a<>nil) then begin
			printABBCreciente(a^.HI);
			write(' |',a^.dato,'| ');
			printABBCreciente(a^.HD);
			end;
		end;
procedure printABBDecreciente(a: arbol);
	begin
		if (a<>nil) then begin
			printABBDecreciente(a^.HD);
			if (a^.dato mod 2)=0 then
				write(' |',a^.dato,'| ');
			printABBDecreciente(a^.HI);
			end;
		end;
var
	aZ: arbol;
	num, cant: integer;
begin
	aZ:=nil;
	cant:=0;
	write('Ingrese un numero entero o "0" para terminar: ');
	readln(num);
	while (num<>corte) do begin
		cargarABB(aZ,num);
		write('Ingrese otro numero a cargar o "0" para terminar: ');
		readln(num);
		end;
	cantELEM(aZ,cant);
	writeln('Numero mas grande del ABB: ',valorMAX(aZ));
	writeln('Numero mas chico del ABB: ',valorMIN(aZ));
	writeln('Cantidad de elementos en el Arbol (Sin repetir): ',cant);
	write('ORDEN CRECIENTE ');
	printABBCreciente(aZ);
	writeln;
	write('ORDEN DECRECIENTE (Solo de pares): ');
	printABBDecreciente(aZ);
	readln();
end.