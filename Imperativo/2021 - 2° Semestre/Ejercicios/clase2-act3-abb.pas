program arbol10Enteros;
uses crt;
const
	cantZ=10;
type
	arbol=^nodoA;
	nodoA=record
		dato: integer;
		HI: arbol;
		HD: arbol;
		end;
procedure storeABB(var a: arbol; dato: integer);
	begin
		if (a=nil) then begin
			new(a);
			a^.dato:=dato;
			a^.HI:=nil;
			a^.HD:=nil;
			end
			else begin
				if (dato<a^.dato) then
					storeABB(a^.HI,dato)
					else
						storeABB(a^.HD,dato);
				end;
		end;
procedure printABB(a: arbol);
	begin
		if (a<>nil) then begin
			printABB(a^.HI);
			writeln('| ',a^.dato,' |');
			printABB(a^.HD);
			end;
		end;
function sumaTotal(a: arbol):integer;
	begin
		if (a=nil) then
			sumaTotal:=0
			else
				sumaTotal:=a^.dato+sumaTotal(a^.HI)+sumaTotal(a^.HD);
		end;
function valorMax(a: arbol):integer;
	begin
		if (a=nil) then
			valorMax:=-9999
			else begin
				if (a^.HD=nil) then
					valorMax:=a^.dato
					else
						valorMax:=valorMax(a^.HD);
				end;
		end;
var
	i, num: integer;
	aZ: arbol;
begin
	aZ:=nil;
	for i:=1 to cantZ do begin
		writeln('Ingrese un numero:');
		readln(num);
		storeABB(aZ,num);
		end;
	clrscr;
	printABB(aZ);
	writeln('Suma total del ABB: ',sumaTotal(aZ),'.');
	writeln('Elemento maximo del ABB: "',valorMax(aZ),'".');
	readln();
end.