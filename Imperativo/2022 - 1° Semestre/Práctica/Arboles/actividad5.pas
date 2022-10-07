program actividad5;
type
	participante=record
		cod: integer;
		codCity: integer;
		age: integer;
		end;
	arbol=^nodoA;
	nodoA=record
		HI: arbol;
		HD: arbol;
		dato: participante;
		end;
	lista=^nodoL;
	nodoL=record
		dato: participante;
		sig: lista;
		end;
procedure agregarABB(var a: arbol; p: participante);
	begin
		if (a=nil) then begin
			new(a);
			a^.dato:=p;
			a^.HI:=nil;
			a^.HD:=nil;
			end
			else begin
				if (p.cod<a^.dato.cod) then
					agregarABB(a^.HI,p)
					else
						agregarABB(a^.HD,p);
				end;
		end;
procedure cargarABB(var a: arbol);
	var
		p: participante;
	begin
		writeln('==== CARGARGA DE PARTICIPANTES ====');
		write('Ingrese el codigo de participante (-1 para terminar): ');
		readln(p.cod);
		while (p.cod<>-1) do begin
			write('Ingrese codigo de ciudad: ');
			readln(p.codCity);
			write('Ingrese edad del participante: ');
			readln(p.age);
			agregarABB(a,p);
			writeln('===================================');
			write('Ingrese el codigo de participante (-1 para terminar): ');
			readln(p.cod);
			end;
		end;
procedure crearNodoLista(var l: lista; var ult: lista; a: arbol);
	var
		aux: lista;
		p: participante;
	begin
		new(aux);
		p.cod:=a^.dato.age;
		p.codCity:=a^.dato.codCity;
		p.age:=a^.dato.age;
		aux^.dato:=p;
		writeln('p.cod: ',p.cod);
		writeln('p.CodCity: ',p.codCity);
		writeln('p.Edad: ',p.age);
		aux:=nil;
		if (l=nil) then
			l:=aux
			else
				ult^.sig:=aux;
		ult:=aux;
		end;
procedure crearListaFromABB(var l: lista; var ult: lista; a: arbol; n: integer);
	begin
	{	Si el arbol (o nodo) no esta vacio
		Si el nodo actual es el buscado, creo un nuevi nodo de lista y agrego.
		Sigo buscando en las ramas hasta que se terminen las llamadas recursivas.
	}	if (a<>nil) then begin
			writeln('Entre!');
			writeln('Codigo de la ciudad NODO: ',a^.dato.codCity);
			if (a^.dato.codCity=n) then
				crearNodoLista(l,ult,a);
			crearListaFromABB(l,ult,a^.HI,n);
			crearListaFromABB(l,ult,a^.HD,n);
			end;
		end;
procedure imprimirLista(l: lista);
	begin
		write('L --->');
		while (l<>nil) do begin
			write('|',l^.dato.cod,'|--->');
			l:=l^.sig;
			end;
		writeln(' nil');
		end;
var
	a: arbol;
	l, ult: lista;
	num: integer;
begin
	a:=nil;
	l:=nil;
	ult:=nil;
	cargarABB(a);
	write('Ingrese un codigo de Ciudad para crear una lista de participantes (de esa ciudad): ');
	readln(num);
	crearListaFromABB(l,ult,a,num);
	imprimirLista(l);
	readln();
end.