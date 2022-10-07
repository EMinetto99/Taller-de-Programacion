program merge4Listas;
const
	cantEstantes=4;
type
	codISBN=0..15;
	libro=record
		isbn: codISBN;
		nom: string;
		end;
	lista=^nodo;
	nodo=record
		dato: libro;
		sig: lista;
		end;
	vec_estantes=array [1..cantEstantes] of lista;

procedure inicializarVecListas(var v: vec_estantes);
	var
		i: integer;
	begin
		for i:=1 to cantEstantes do
			v[i]:=nil;
		end;
procedure crearListaOrdenada(var l: lista; lb: libro);
	var
		aux, ant, act: lista;
	begin
		new(aux);
		aux^.dato:=lb;
		aux^.sig:=nil;
		if (l=nil) then
			L:=aux
			else begin
				act:=l;
				ant:=l;
				while (act<>nil) and (aux^.dato.nom>act^.dato.nom) do begin
					ant:=act;
					act:=act^.sig;
					end;
				if (act=l) then begin
					l:=aux;
					aux^.sig:=act;
					end
					else begin
						ant^.sig:=aux;
						aux^.sig:=act;
						end;
				end;
		end;
procedure cargarVectorListas(var v: vec_estantes);
	var
		i: integer;
		b: libro;
	begin
		for i:=1 to cantEstantes do begin
			writeln('====== Estante NRO ',i,' ======');
			write('Ingrese el codigo ISBN (entre 1 y 15) del libro a agregar en el estante ',i,' ("0" para terminar): ');
			readln(b.isbn);
			while (b.isbn<>0) do begin
				write('Ingrese el NOMBRE del libro: ');
				readln(b.nom);
				crearListaOrdenada(v[i],b);
				write('Ingrese el codigo ISBN (entre 1 y 15) del libro a agregar en el estante ',i,' ("0" para terminar): ');
				readln(b.isbn);
				end;
			writeln;
			end;
		end;
procedure imprimirLista(l: lista);
	begin
		write('L--->');
		while (l<>nil) do begin
			write('|',l^.dato.nom,'|--->');
			l:=l^.sig;
			end;
		writeln('NIL');
		end;
procedure imprimirVectorListas(v: vec_estantes);
	var
		i: integer;
	begin
		for i:=1 to cantEstantes do begin
			write('[',i,'] ');
			imprimirLista(v[i]);
			end;
		end;
procedure agregarAtras(var l, ult: lista; minLibro: libro);
	var
		aux: lista;
	begin
		new(aux);
		aux^.dato:=minLibro;
		aux^.sig:=nil;
		if (l=nil) then
			l:=aux
			else
				ult^.sig:=aux;
		ult:=aux;
		end;
procedure minimo(var v2: vec_estantes; var min: libro);	{ Listas o vector de listas a buscar el minimo
															 El vector copia va adelantando los punteros de las listas a medida que 
															 encuentra minimos y modificándose
}	var	
		i, idMin: integer;
	begin
		min.nom:='ZZZ';		//Inicializo la cadena en valor muy alto
		idMin:=-1;			//Inicializo id en un valor no valido.
		for i:=1 to cantEstantes do begin
			if (v2[i]<>nil) and (v2[i]^.dato.nom<=min.nom) then begin	// Comparo cada primer elemento de las listas, hasta hallar un minimo
				min:=v2[i]^.dato;
				idMin:=i;
				end;
			end;
		if (idMin<>-1) then
			v2[idMin]:=v2[idMin]^.sig;	//El elem. mínimo que encontré lo descarto de la siguientes comparaciones (paso al sig elemento, si ENCONTRE)
		end;
procedure merge(v2: vec_estantes; var nL: lista);	//Nueva lista y Nuevo vector copia con los punteros de las otras listas.
	var
		min: libro;	//Nueva cadena en valor muy alto
		ult: lista;
	begin
		nL:=nil;		//Inicializo la lista nueva
		ult:=nil;
		minimo(v2,min);	//Listas o vector de listas a buscar el minimo
		while (min.nom<>'ZZZ') do begin		//Si el mínimo quedó igual - Entonces no encontré un mínimo o las listas entán vacias
			agregarAtras(nL,ult,min);		//Si el mínimo se modificó - Encontré un minimo y lo agrego a la lista
			minimo(v2,min);
			end;
		imprimirLista(nL);
		end;
var
	vE: vec_estantes;
	newLista: lista;
begin
	inicializarVecListas(vE);
	cargarVectorListas(vE);
	imprimirVectorListas(vE);
	merge(vE,newLista);
	readln;
end.