program abbAmacenar10Datos;
const
	cantN=10;
type
	arbol=^nodo;
	nodo=record
		dato: integer;
		HI: arbol;
		HD: arbol;
		end;
procedure almacenarOnTree(var an: arbol; n: integer);
	begin
		if (an=nil) then begin
			new(an);
			an^.dato:=n;
			an^.HI:=nil;
			an^.HD:=nil;
			end
			else begin
				if (n<an^.dato) then
					almacenarOnTree(an^.HI,n)
					else
						almacenarOnTree(an^.HD,n);
					end;
				end;

var
	an: arbol;
	i, dato: integer;
begin
	an:=nil;
	writeln('Ingrese un dato a guardar: (',cantN,' datos)');
	for i:=1 to cantN do begin	
		readln(dato);
		almacenarOnTree(an,dato);
		if (i<>cantN) then
			writeln('Ingrese otro dato a guardar: (',cantN-i,' datos restantes)');
		end;
	readln();
end.