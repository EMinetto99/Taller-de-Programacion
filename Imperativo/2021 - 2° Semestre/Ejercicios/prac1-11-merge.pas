program PeliculasMergeadas;
const
	cantGen=8;
type
	rango8=1..cantGen;
	pelicula=record
		cod: integer;
		gen: rango8;
		// prom: real;
		end;
	lista=^nodo;
	nodo=record
		dato: pelicula;
		sig: lista;
		end;
	vec_movies=array[rango8] of lista;
procedure leerPelicula(var md: pelicula);
	begin
		write('Codigo de pelicula: ');
		readln(md.cod);
		if (md.cod<>-1) then begin
			write('Genero de pelicula: ');
			readln(md.gen);
{			write('Puntaje promedio de la pelicula: ');
			readln(md.prom);
}			end;
		writeln();
	end;
procedure inicializarVector(var vM: vec_movies);
	var
		i: integer;
	begin
		for i:=1 to cantGen do
			vM[i]:=nil;
	end;
procedure almacenarOrdenado(var vm: lista; m: pelicula);
	var
		aux, act, ant: lista;
	begin
		new(aux);
		aux^.dato:=m;
		aux^.sig:=nil;
		act:=vm;
		ant:=vm;
		while (act<>nil) and (act^.dato.cod<m.cod) do begin
			ant:=act;
			act:=act^.sig;
			end;
		if (act=ant) then
			vm:=aux
			else
				ant^.sig:=aux;
		aux^.sig:=act;
	end;
procedure minimo(var vM: vec_movies; var min: pelicula);
	var
		i, minAct: integer;
	begin
		min.cod:=9999;
		minAct:=-1;
		for i:=1 to cantGen do begin
			if (vM[i]<>nil) and (vM[i]^.dato.cod<=min.cod) then begin
					min:=vM[i]^.dato;
					minAct:=i;
					end;
			end;
		if (minAct<>-1) then
			vM[minAct]:=vM[minAct]^.sig;
	end;
procedure agregarAtras(var p, ult: lista; m: pelicula);
	var
		aux: lista;
	begin
		new(aux);
		aux^.dato:=m;
		aux^.sig:=nil;
		if (p=nil) then
			p:=aux
			else
				ult^.sig:=aux;
		ult:=aux;
		end;
procedure imprimirPeliculas(v: vec_movies);
	var
		i: integer;
	begin
		for i:=1 to cantGen do begin
			write('Pos (',i,') L');
			while (v[i]<>nil) do begin
				write('---> |',v[i]^.dato.cod,'|');
				v[i]:=v[i]^.sig;
				end;
			write('---> [nil]');
			writeln;
			end;
		end;
procedure imprimirLista(L: lista);
	begin
		if (L<>nil) then begin
			write(' L');
			while (L<>nil) do begin
				write('---> |',L^.dato.cod,'|');
				L:=L^.sig;
				end;
			writeln;
			end
			else begin
				write('L: nil');
				writeln();
				end;
		end;
procedure mergeListas(var p: lista; vM: vec_movies);
	var
		min: pelicula;
		ult: lista;
	begin
		p:=nil;
		ult:=nil;
		minimo(vM,min);
		while (min.cod<>9999) do begin
			agregarAtras(p,ult,min);
			minimo(vM,min);
			end;
	end;
var
	vM: vec_movies;
	mDates: pelicula;
	PriL: lista;
begin
	inicializarVector(vM);
	leerPelicula(mDates);
	while (mDates.cod<>-1) do begin
		almacenarOrdenado(vM[mDates.gen],mDates);
		leerPelicula(mDates);
		end;
	imprimirPeliculas(vM);
	mergeListas(PriL,vM);
	imprimirLista(PriL);
	readln();
end.