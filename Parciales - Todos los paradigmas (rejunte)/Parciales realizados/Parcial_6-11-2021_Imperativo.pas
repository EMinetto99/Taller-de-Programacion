program OMS;
const
	cantVac = 4;
type
	cadena30 = string[30];
	rangoVac = 1..cantVac;

	notificacion = record
		cantDosis: integer;
		fecha: cadena30;
		nomPais: cadena30;
		tipoVacuna: rangoVac;
		end;

	lista = ^nodo;
	nodo = record
		dato: notificacion;
		sig: lista;
		end;

	vec_vacunas = array[rangoVac] of lista;

	regVacunas = record
		cantTotal: integer;
		nomPais: cadena30;
		end;

	arbol = ^nodoA;
	nodoA = record
		dato: regVacunas;
		HI: arbol;
		HD: arbol;
		end;

procedure inicializarVectorListas(var v: vec_vacunas);
	begin
		end;
procedure leerNotificacion(var n: notificacion);
	begin
		end;
procedure almacenarVector(var v: vec_vacunas; n: notificacion);
	begin
		end;
procedure agregarOrdenado(var L: lista; n: notificacion);
	begin
		end;

procedure minimo(var v: vec_vacunas; var min: notificacion);
	var
		i, pos: integer;
	begin
		min.nomPais := 'ZZZZ';	// "ZZZZ" / "9999" - valor muy alto para encontrar el minimo posible
		pos := -1;				// Flag por si no encontré
		for i := 1 to cantVac do	{ Recorro el vector de listas }
			{ Si la lista no esta vacia y Si encuentro un dato menor o igual al minimo, actualizo el minimo}
			if (v[i] <> nil) and (v[i]^.dato.nomPais <= min.nomPais) then begin	
				pos := i;								// Guardo el indice actual
				min.nomPais := v[i]^.dato.nomPais;		// Actualizo el mínimo
				min.cantDosis := v[i]^.dato.cantDosis;	// Tomo la cantidad del dato, para luego sumar al total
				end;
		if (pos <> -1) then begin	{Si encontré un minimo}
			v[pos] := v[pos]^.sig;						// Paso al siguiente elemento de la lista
			end;
		end;
procedure mergeAcumulador(v: vec_vacunas; var a: arbol);
	procedure agregarArbol(var a: arbol; r: regVacunas);
		begin
			if (a = nil) then begin
				new(a);
				a^.dato := r;
				a^.HI := nil;
				a^.HD := nil;
				end
				else
					if (r.cantTotal < a^.dato.cantTotal) then
						agregarArbol(a^.HI, r)
						else
							agregarArbol(a^.HD, r);
			end;
	var
		// ult: lista;		// Puntero al ultimo, sólo para listas
		min: notificacion;	// Dato temporal para encontrar el "minimo"
		act: regVacunas;	// Dato acumulador
	begin
		minimo(v, min);					// Busco el minimo en el vector de listas
		while (min.nomPais <> 'ZZZZ') do begin	{ Si encontré un minimo, sigo; sino se me terminaron las listas}
			act.cantTotal := 0;			// Inicializo el contador
			act.nomPais := min.nomPais;	// Inicializo el minimo actual
			while (min.nomPais <> 'ZZZZ') and (min.nomPais = act.nomPais) do begin	{ Si encontre un minimo, sigo; sino cambió el tipo de dato o se me terminaron las listas }
				act.cantTotal := act.cantTotal + min.cantDosis;	// Acumulo el nuevo dato minimo encontrado
				minimo(v, min);			// Vuelvo a buscar el minimo
				end;
			agregarArbol(a, act);		// Agrego el registro acumulado a la estructura de datos a guardar
			end;
		end;
function buscarPaisMayorDosis(a: arbol): cadena30;
	function buscar(a: arbol; mayor: integer): cadena30;
		begin
			if (a^.HD <> nil) then
				buscar := buscar(a^.HD, mayor)
				else
					buscar := a^.dato.nomPais;
			end;
	var
		mayor: integer;
	begin
		mayor := -9999;
		buscarPaisMayorDosis := buscar(a, mayor);	// Podría arreglarse para que solo encuentre el primer mayor
		end;
var
	v: vec_vacunas;
	notify: notificacion;
	a: arbol;
begin
	a := nil;
	inicializarVectorListas(v);		// Se dispone
	leerNotificacion(notify);
	while (notify.tipoVacuna <> 0) do begin
		almacenarVector(v, notify);	// Se dispone
		leerNotificacion(notify);	// Se dispone
		end;
	mergeAcumulador(v, a);
	writeln('Nombre del pais con mayor cantidad de dosis: ',buscarPaisMayorDosis(a));
	readln;
end.