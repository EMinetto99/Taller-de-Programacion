program PeliculasEnOctubre;
type
	ranCrit=1..10;
	generos=8;
	punteros=record
		priE: lista;
		ult: lista;
		end;
	infoPeli=record
		cod: integer;
		gen: 1..generos;
		crit: ranCrit;
		end;
	lista=^nodo
	nodo=record
		dato: infoPeli;
		sig: lista;
		end;
	vecPeliculas=array[1..generos] of punteros;
	vecCriticas=array[1..generos] of infoPeli;
procedure inicializarVector(var vP: vecPeliculas);
	var
		i: integer;
	begin
		for i:=1 to generos do begin
			vP[i].priE:=nil;
			vP[i].ult:=nil;
			end;
		end;
procedure leerDataPeli(var dat: infoPeli);
	begin
		write('Codigo de la pelicula:');
		readln(dat.cod);
		if (dat.cod<>-1) then begin
			write('Genero de la pelicula:');
			readln(dat.gen);
			write('Puntaje promedio de criticas (1 al 10):');
			readln(dat.crit);
			end;
		end;
procedure almacenarEnVEC(var vP: vecPeliculas; dat: infoPeli);
	var
		i: integer;
		aux: lista;
	begin
		i:=dat.gen;
		new(aux);
		aux^.dato:=dat;	//Almaceno el registro en el campo de datos del nodo nuevo
		aux^.sig:=nil;
		if (vP[i].priE=nil) then begin
			vP[i].priE:=aux;
			vP[i].ult:=aux;
			end
			else begin
				vP[i].ult^.sig=aux;
				vP[i].ult:=aux;
				end;
		end;
procedure almacenarVECrit(var vC: vecCriticas; vP: vecPeliculas);
	var
		i: integer;
	begin
		for i:=1 to generos do begin
			recorrerVP(vP);
			vC[i];
		end;
procedure leerPeliculas(var vP: vecPeliculas; var vC: vecCriticas);
	var
		datos: infoPeli;
	begin
		leerDataPeli(datos);
		while (datos.cod<>-1) do begin
			almacenarEnVEC(datos,vP);
			leerDataPeli(datos);
			end;
		almacenarVECrit(vP,vC);
var
	vP: vecPeliculas;
	vC: vecCriticas;
begin
	inicializarVector(vP);
	leerPeliculas(vP);