program ejer4act3;
const
	sucursales = 4;
type
	cadena30 = string[30];
	rango_suc = 0..sucursales;

	venta = record
		codigo: integer;
		fecha: cadena30;
		codSucursal: rango_suc;
		cant: integer;
		end;
	listaVen = ^nodoV;
	nodoV = record
		dato: venta;
		sig: listaVen;
		end;

	regVenta = record
		codigo: integer;
		cantTotal: integer;
		end;
	listaTot = ^nodo;
	nodo = record
		dato: regVenta;
		sig: listaTot;
		end;

	vec_sucursales = array[1..sucursales] of listaVen;
procedure inicializarVector(var v: vec_sucursales);
	var
		i: integer;
	begin
		for i := 1 to sucursales do
			v[i] := nil;
		end;
procedure leerVenta(var v: venta);
	var
		dia, mes: integer;
	begin
		write('Codigo de sucursal (de 1 a ',sucursales,'): ');
		readln(v.codSucursal);
		if (v.codSucursal <> 0) then begin
			write('Codigo de producto: ');
			readln(v.codigo);
			dia := random(30)+1;
			mes := random(12)+1;
			writeln('Fecha de la venta: ',dia,'/',mes,'/2023');
			v.cant := random(100)+1;
			writeln('Cantidad vendida: ',v.cant);
			end;
		writeln;
		end;
procedure almacenar(var vec: vec_sucursales; v: venta);
	procedure agregarListaOrdenado(var L: listaVen; v: venta);
	var
		aux, act, ant: listaVen;
	begin
		new(aux);				// Creo nuevo elemento, asigno el dato de entrada.
		aux^.dato := v;
		aux^.sig := nil;
		if (L = nil) then		// Si L es nil, la lista está vacia y lo asigno como primero.
			L := aux
			else begin			// Sino actualizo los punteros al primer elemento para iniciar el recorrido en la lista.
				act := L;
				ant := L;
				while (act <> nil) and (act^.dato.codigo < aux^.dato.codigo) do begin	// Condicion si el elemento debe ser MENOR o MAYOR (descendente/ascendente)
					ant := act;				// Recorrido mientras "act" sea menor al elemento nuevo
					act := act^.sig;		// y no se termine la lista.
					end;
				if (act = L) then begin		// Si "act" apunta al primer elemento, significa que
					aux^.sig := L;			// el nuevo elemento era menor al primero de la lista; entonces se hubicará
					L := aux;				// en el primer lugar de la lista (apuntará al primero).
					end
					else begin
						ant^.sig := aux;	// sino el nuevo es mayor al primero, por lo que puede que vaya al
						aux^.sig := act;	// final de la lista o en el medio.
						end;
				end;
		end;
	var
		index: integer;
	begin
		index := v.codSucursal;
		agregarListaOrdenado(vec[index], v);
		end;
procedure imprimirLista(L: listaTot);
		begin
			write('L --->');
			while (L <> nil) do begin
				write('|Codigo: ',L^.dato.codigo,' / Cantidad: ',L^.dato.cantTotal,'|--->');
				L := L^.sig;
				end;
			writeln(' NIL');
			end;
procedure imprimirVector_Listas(v: vec_sucursales);
	procedure imprimirLista(L: listaVen);
		begin
			write('L --->');
			while (L <> nil) do begin
				write('|Codigo: ',L^.dato.codigo,' / Cantidad: ',L^.dato.cant,'|--->');
				L := L^.sig;
				end;
			writeln(' NIL');
			end;
	var
		i: integer;
	begin
		for i := 1 to sucursales do begin
			write('[',i,'] ');
			imprimirLista(v[i]);
			end;
		writeln;
		end;
procedure minimo(var v: vec_sucursales; var min: regVenta);
	var
		i, pos: integer;
	begin
		min.codigo := 9999;	// "ZZZZ" / "9999" - valor muy alto para encontrar el minimo posible
		pos := -1;			// Flag por si no encontré
		for i := 1 to sucursales do	{ Recorro el vector de listas }
			{ Si la lista no esta vacia y Si encuentro un dato menor o igual al minimo, actualizo el minimo}
			if (v[i] <> nil) and (v[i]^.dato.codigo <= min.codigo) then begin
				pos := i;							// Guardo el indice actual
				min.codigo := v[i]^.dato.codigo;	// Actualizo el mínimo
				min.cantTotal := v[i]^.dato.cant;	// (Opcional) Tomo la cantidad del dato, para luego sumar al total
				end;
		if (pos <> -1) then		{Si encontré un minimo}
			v[pos] := v[pos]^.sig;					// Paso al siguiente elemento de la lista
		end;

procedure mergeAcumulador(v: vec_sucursales; var l: listaTot); // var l: lista (en caso de una lista)
	procedure agregarAtrasLista(var L: listaTot; r: regVenta; var ult: listaTot);
		var
    		aux: listaTot;
  		begin
    		new(aux);
    		aux^.dato := r;
    		aux^.sig := nil;
    		if (L <> nil) then
        		ult^.sig := aux
    			else
        			L := aux;
    		ult := aux;
			end;
	var
		ult: listaTot;		// Puntero al ultimo, sólo para listas
		min: regVenta;		// Dato temporal para encontrar el "minimo"
		act: regVenta;		// Dato acumulador
	begin
		minimo(v, min);					// Busco el minimo en el vector de listas
		while (min.codigo <> 9999) do begin	{ Si encontré un minimo, sigo; sino se me terminaron las listas}
			act.cantTotal := 0;			// Inicializo el contador
			act.codigo := min.codigo;	// Inicializo el minimo actual
			while (min.codigo <> 9999) and (min.codigo = act.codigo) do begin	{ Si encontre un minimo, sigo; sino cambió el tipo de dato o se me terminaron las listas }
				act.cantTotal := act.cantTotal + min.cantTotal;	// Acumulo el nuevo dato minimo encontrado
				minimo(v, min);			// Vuelvo a buscar el minimo
				end;
			agregarAtrasLista(l, act, ult);
			end;
		end;
var
	vs: vec_sucursales;
	v: venta;
	l: listaTot;
begin
	Randomize;
	inicializarVector(vs);
	leerVenta(v);
	while (v.codSucursal <> 0) do begin
		almacenar(vs, v);
		leerVenta(v);
		end;
	imprimirVector_Listas(vs);
	mergeAcumulador(vs, l);
	imprimirLista(l);
	readln;
end.