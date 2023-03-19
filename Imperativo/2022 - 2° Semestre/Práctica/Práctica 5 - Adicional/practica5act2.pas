program practica5act2;
type
	cadena30 = string[30];
	rango = 2010..2018;
	infoAuto = record
		patente: cadena30;
		anio: rango;
		marca: cadena30;
		modelo: cadena30;
		end;

	arbol = ^nodoA;
	nodoA = record
		dato: infoAuto;
		HI: arbol;
		HD: arbol;
		end;

	lista = ^nodoL;
	nodoL = record
		dato: infoAuto;
		sig: lista;
		end;

	vec_anios = array [1..9] of lista;
procedure inicializarVector(var v: vec_anios);
	var
		i: integer;
	begin
		for i:= 1 to 9 do
			v[i] := nil;
		end;
procedure leerAuto(var i: infoAuto);
	begin
		write('Patente: ');
		readln(i.patente);
		if (i.patente) <> ('z') then begin
			write('Anio: ');
			readln(i.anio);
			write('Marca: ');
			readln(i.marca);
			write('Modelo: ');
			readln(i.modelo);
			end;
		end;
procedure almacenar(var a: arbol; i: infoAuto);
	var
		aux: arbol;
	begin
		if (a = nil) then begin
			new(aux);
			aux^.dato := i;
			aux^.HI := nil;
			aux^.HD := nil;
			a := aux;
			end
			else begin
				if (i.patente < a^.dato.patente) then
					almacenar(a^.HI, i)
					else
						almacenar(a^.HD, i);
				end;
		end;
procedure buscarCantidad(a: arbol; m: cadena30; var cant: integer);
	begin
		if (a <> nil) then begin
			if (a^.dato.marca = m) then
				cant := cant + 1;
			buscarCantidad(a^.HI, m, cant);
			buscarCantidad(a^.HD, m, cant);
			end;
		end;
procedure almacenarVector(a: arbol; v: vec_anios);
	procedure agregarAdelanteLista(var l: lista; i: infoAuto);
		var
			aux: lista;
		begin
			new(aux);
			aux^.dato := i;
			aux^.sig := l;
			l := aux;
			end;
	var
		index: integer;
	begin
		if (a <> nil) then begin
			index := (a^.dato.anio - 2010) + 1;
			agregarAdelanteLista(v[index], a^.dato);
			almacenarVector(a^.HI, v);
			almacenarVector(a^.HD, v);
			end;
		end;
function buscarPatente(a: arbol; str: cadena30): arbol;
	begin
		if (a = nil) then
			buscarPatente := nil
			else
				if (a^.dato.patente = str) then
					buscarPatente := a
					else
						if (str < a^.dato.patente) then
							buscarPatente := buscarPatente(a^.HI, str)
							else
								buscarPatente := buscarPatente(a^.HD, str)

		end;
var
	vA: vec_anios;
	a, patente: arbol;
	info: infoAuto;
	cant: integer;
	marca, strPatente: cadena30;
begin
	a:= nil;
	cant := 0;
	inicializarVector(vA);
	leerAuto(info);
	while (info.patente) <> ('z') do begin
		almacenar(a, info);
		writeln;
		leerAuto(info);
		end;
	write('Marca de auto a buscar en la estructura: ');
	readln(marca);
	buscarCantidad(a, marca, cant);
	writeln('Cantidad de autos de marca "',marca,'": ',cant);
	writeln;
	almacenarVector(a, vA);
	writeln;
	write('Ingrese una patente a buscar en la estructura: ');
	readln(strPatente);
	patente := buscarPatente(a, strPatente);
	if (patente <> nil) then begin
		writeln('Patente "',strPatente,'" ENCONTRADA! ');
		writeln('Anio de fabricacion: ',patente^.dato.anio);
		end
		else
			writeln('La patente "',strPatente,'" no se ha encontrado.');
	readln;
end.