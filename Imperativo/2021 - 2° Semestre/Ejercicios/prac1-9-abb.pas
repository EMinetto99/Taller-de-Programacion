program arboldeNombres;
uses crt;
const
	corte='ZZZ';
type
	nombre=string[30]; 
	arbol=^nodo;
	nodo=record
		dato: nombre;
		HI: arbol;
		HD: arbol;
		end;
function buscarABB(a: arbol; n: nombre):boolean;
	begin
		if (a=nil) then
			buscarABB:=false
			else begin
				if (a^.dato=n) then
					buscarABB:=true
					else begin
						if (n<a^.dato) then
							buscarABB:=buscarABB(a^.HI,n)
							else
								buscarABB:=buscarABB(a^.HD,n);
						end;
				end;
		end;
procedure armarArbol(var a: arbol; n: nombre);
	begin
		if (a=nil) then begin
			new(a);
			a^.dato:=n;
			a^.HI:=nil;
			a^.HD:=nil;
			end
			else begin
				if (a^.dato>n) then
					armarArbol(a^.HI,n)
					else
						armarArbol(a^.HD,n);
					end;
		end;
var
	aN: arbol;
	nom: nombre;
begin
	aN:=nil;
	writeln('Ingrese un nombre a cargar en la estructura o escriba "ZZZ" para terminar:');
	readln(nom);
	writeln('NOMBRE: ',nom);
	writeln('CORTE: ',corte);
	while (nom<>corte) do begin
		armarArbol(aN,nom);
		writeln('Ingrese o otro nombre o "ZZZ" para terminar:');
		readln(nom);
		end;
	write('Nombre a buscar en la estructura: ');
	readln(nom);
	if (buscarABB(aN,nom)=true) then begin
		textbackground(green);
		textcolor(white);
		writeln('El nombre "',nom,'" SE ENCONTRO en la estructura!!!');
		end
		else begin
			textbackground(red);
			textcolor(yellow);
			writeln('El nombre "',nom,'" NO SE ENCONTRO en la estructura :(');
			end;
	readln();
end.