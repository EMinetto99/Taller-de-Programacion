program parcial;
type
	cadena30 = string[30];
	pedido = record
		numCliente: integer;
		fecha: cadena30;
		combos: integer;
		monto: real;
		end;

	lista = ^nodoL;
	nodoL = record
		dato: pedido;
		sig: lista;
		end;

	regPedidos = record
		listaP: lista;
		montoTotal: real;
		end;

	arbol = ^nodoA;
	nodoA = record
		dato: regPedidos;
		HI: arbol;
		HD: arbol;
		end;
procedure leerPedido(var p: pedido);
	begin
		write('Monto del pedido: ');
		readln(p.monto);
		if (p.monto <> 0) then begin
			write('Numero de cliente: ');
			readln(p.numCliente);
			write('Fecha del pedido: ');
			readln(p.fecha);
			write('Cantidad de combos: ');
			readln(p.combos);
			writeln;
			end;
		end;
procedure agregarAdelanteLista(var L: lista; p: pedido);
	var
		aux: lista;
	begin
		new(aux);
		aux^.dato := p;
		aux^.sig := L;
		L := aux;
		end;
procedure almacenar(var a: arbol; p: pedido);
	begin
		if (a = nil) then begin	{SI EL NODO ESTÁ VACIO}
			new(a);					// Creo el nodo del arbol
			new(a^.dato.listaP);	// Creo la lista del nodo
			a^.dato.listaP := nil;	// Inicializo la lista
			agregarAdelanteLista(a^.dato.listaP, p);	// Agrego el primer pedido a la lista
			a^.dato.montoTotal := p.monto;				// Inicializo el monto con el primer pedido del nodo
			a^.HI := nil;
			a^.HD := nil;
			end
			else
				if (p.numCliente = a^.dato.listaP^.dato.numCliente) then begin	{SI EL CODIGO DE CLIENTE EL EL MISMO}
					agregarAdelanteLista(a^.dato.listaP, p);
					a^.dato.montoTotal := a^.dato.montoTotal + p.monto;
					end
					else
						if (p.numCliente < a^.dato.listaP^.dato.numCliente) then	{SI EL CODIGO DE CLIENTE ES MENOR}
							almacenar(a^.HI, p)
							else
								almacenar(a^.HD, p);								{SI EL CODIGO DE CLIENTE EL MAYOR}
		end;
function buscarCliente(a: arbol; n: integer): lista;
	begin
		if (a = nil) then
			buscarCliente := nil
			else
				if (a^.dato.listaP^.dato.numCliente = n) then
					buscarCliente := a^.dato.listaP
					else
						if (n < a^.dato.listaP^.dato.numCliente) then
							buscarCliente := buscarCliente(a^.HI, n)
							else
								buscarCliente := buscarCliente(a^.HD, n);
		end;
function buscarCombos(C: lista; n: integer): integer;
	begin
		if (C <> nil) then
			if (C^.dato.combos = n) then
				buscarCombos := buscarCombos(C^.sig) + 1
				else
					buscarCombos := buscarCombos(C^.sig);
			else
				buscarCombos := 0;
		end;
procedure imprimirArbol(a: arbol);
	begin
		if (a <> nil) then begin
			imprimirArbol(a^.HI);
			while (a^.dato.listaP <> nil) do begin
				write('| Numero: ',a^.dato.listaP^.dato.numCliente,' Monto: ',a^.dato.listaP^.dato.monto:5:2,'| ');
				a^.dato.listaP := a^.dato.listaP^.sig;
				end;
			imprimirArbol(a^.HD);
			end;
		end;
var
	a: arbol;
	p: pedido;
	cli: lista;
	num, cant: integer;
begin
	a := nil;
	leerPedido(p);
	while (p.monto <> 0) do begin
		almacenar(a, p);
		leerPedido(p);
		end;
	imprimirArbol(a);
	writeln('Ingrese un numero de cliente a buscar: ');
	readln(num);
	cli := buscarCliente(a, num);
	if (cli <> nil) then
		writeln('Cliente numero ',num,' encontrado!')
		else
			writeln('El cliente ',num,' no fue encontrado.');
	writeln('Ingrese la cantidad de combos a buscar en los pedidos: ');
	readln(num);
	cant := buscarCombos(cli, num);
	writeln('Cantidad de pedidos con "',num,'" combos exactamente: ',cant);
	readln;
end.