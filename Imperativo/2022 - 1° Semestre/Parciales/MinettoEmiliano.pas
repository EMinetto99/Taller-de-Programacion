program MinettoEmiliano;
type
	cadena40=string[40];
	impresion=record
		nomDoc: cadena40;
		pags: integer;
		tamanio: real;
		nombreUser: cadena40;
		end;
	datosUsuario=record
		cantTotImp: integer;
		cantTotPags: integer;
		nomUltDoc: cadena40;
		end;
	lista=^nodo;
	nodo=record
		listaImp: listaI;
		datoUser: datosUsuario;
		sig: lista;
		end;
	listaI=^nodoI;				// Lista de (Listas de Impresiones) y de (Registro de Datos de Impresion)
	nodoI=record
		datoImp: impresion;
		sig: listaI;
		end;
procedure procesarListaOrdenada(var L: lista; i: impresion);
	var
		aux, act, ant: lista;
	begin
		new(aux);			// Creo nuevo elemento, lo pongo en nil:
		aux^.sig:=nil;
		if (L=nil) then		// Si L es nil, la lista está vacia y lo asigno como primero.
			L:=aux;
			else begin		// Sino actualizo los punteros al primer elemento para iniciar el recorrido en la lista.
				act:=L;
				ant:=L;
				while (act<>nil) and (act^.datoImp.nombreUser<aux^.datoImp.nombreUser) do begin	// Condicion si el elemento debe ser MENOR o MAYOR (descendente/ascendente)
					ant:=act;				// Recorrido mientras "act" sea menor al elemento nuevo
					act:=act^.sig;			// y no se termine la lista.
					end;
				end;
		if (ant^.datoImp.nombreUser=aux^.datoImp.nombreUser) then begin

			// Envio nuevo nodo a la lista de 
		if (act=L) then begin	// Si "act" apunta al primer elemento, significa que
			aux^.sig:=L;		// el nuevo elemento era menor al primero de la lista; entonces se hubicará
			L:=aux;				// en el primer lugar de la lista (apuntará al primero).
			end;
			else begin
				ant^.sig:=aux;	// sino el nuevo es mayor al primero, por lo que puede que vaya al
				aux^.sig:=act;	// final de la lista o en el medio.
				end;
		end;
var
	L: lista;
	Li: listaI;
	imp: impresion;
	num: integer;
begin
	L:=nil;
	Li:=nil;
	inicializarVector(); // Iniciar vector
	writeln('===== SISTEMA DE IMPRESIONES =====');
	write('Tamanio del archivo (0 para terminar): ');
	readln(imp.tamanio);
	while (num<>0) do begin
		write("Nombre del documento ");
		readln(imp.nomDoc);
		write("Paginas del documento: ");
		readln(imp.pags);
		write("Nombre de usuario:");
		readln(imp.nombreUser);
		procesarListaOrdenada(L,imp);
		end;
	writeln();
end.