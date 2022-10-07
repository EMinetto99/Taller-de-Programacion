// PARCIAL IMPERATIVO - Fecha 12/9/2022 - Tema 1
{
Un comercio necesita el procesamiento de las compras realizadas por sus clientes durante el mes de Julio de 2022.
De cada compra se conoce código del cliente, día, cantidad de productos y monto pagado.

A) Implementar un módulo que lea compras, genere y retorne un estructora adecuada para la busqueda por código del cliente,
donde para cada codigo de cliente se almacenan juntas todas sus compras (día, cantidad de productos y monto) que realizó.
La lectura finaliza con cantidad de productos 0. Se sugiere usar el módulo leerRegistro ().

B) Implementar un módulo que reciba la estructura generada en a) y un código de cliente y retorne todas las compras de dicho
cliente.

C) Realizar un módulo recursivo que reciba la estructura que retorna el inciso b) y retorne el monto de la compra con mayor
cantidad de productos.

NOTA: Implementar en el programa principal, que invoque a los incisos a, b y c.
}
program parcialImperativo12_9_2022;
type
	rangoDias = 1..31;

	compra = record
		cod: integer;
		dia: rangoDias;
		cantProd: integer;
		monto: real;
		end;

	lista = ^nodoL;
	nodoL = record
		dato: compra;
		sig: lista;
		end;

	arbol = ^nodoA;
	nodoA = record
		dato: lista;
		HI: arbol;
		HD: arbol;
		end;

procedure imprimirLista(L: lista);
	begin
		write(' L --->');
		while (L <> nil) do begin
			write('|Codigo: ',L^.dato.cod);
			write(' CantProductos: ',L^.dato.cantProd);
			write(' Monto: ',L^.dato.monto:5:2);
			write('|---> ');
			L:= L^.sig;
			end;
		writeln(' nil');
		end;
procedure procesarCompras(var a: arbol);
	procedure leerCompra(var c: compra);
		begin
			c.cantProd:= random(30);
			if (c.cantProd <> 0) then begin
				write('Cantidad de productos: ');
				writeln(c.cantProd);
				c.cod:= 1 + random(100);
				write('Codigo de cliente: ');
				writeln(c.cod);
				c.monto:=150.8 + random(8000);
				write('Monto del producto: ');
				writeln(c.monto:5:2);
				c.dia:= 1 + random(31);
				write('Cantidad de dias: ');
				writeln(c.dia);
				end;
			end;
	procedure agregarLista(var L: lista; c: compra);
		var
			aux: lista;
		begin
			new(aux);
			aux^.dato:= c;
			aux^.sig:= L;
			L:= aux;
			end;
	procedure agregarArbol(var a: arbol; c: compra);
		begin
			if (a = nil) then begin
				new(a);
				a^.dato:= nil;				// Lista inicializada en nil
				agregarLista(a^.dato, c);
				a^.HI:= nil;
				a^.HD:= nil;
				end
				else begin
					if (a^.dato^.dato.cod = c.cod) then
						agregarLista(a^.dato, c)
						else
							if (c.cod < a^.dato^.dato.cod) then
								agregarArbol(a^.HI, c)
								else
									agregarArbol(a^.HD, c);
					end;
			end;

	var
		c: compra;
	begin
		writeln('======= SISTEMA DE COMPRAS =======');
		leerCompra(c);
		writeln;
		while (c.cantProd <> 0) do begin
			agregarArbol(a, c);
			leerCompra(c);
			writeln;
			end;
		// imprimirLista(a):
		end;
procedure buscarProductosDeCliente(a: arbol; var nodo: lista);
	function buscarCliente(a: arbol; num: integer): lista;
		begin
			if (a = nil) then
				buscarCliente := nil
				else begin
					if (a^.dato^.dato.cod = num) then
						buscarCliente := a^.dato
						else begin
							if (num < a^.dato^.dato.cod) then
								buscarCliente:= buscarCliente(a^.HI, num)
								else
									buscarCliente:= buscarCliente(a^.HD, num);
							end;
					end;
			end;

	var
		num: integer;
	begin
		write('Ingrese un NUMERO DE CLIENTE a buscar (si existe): ');
		readln(num);
		nodo:= buscarCliente(a, num);
		if (nodo = nil) then
			writeln('No se encontro el cliente especificado.')
			else
				imprimirLista(nodo);
		end;

function mayorMonto(n: lista): real;
	function mayorCantProductos(n: lista; max, maxMonto: real): real;
		begin
			if (n = nil) then
				mayorCantProductos:= maxMonto
				else begin
					if (n^.dato.cantProd > max) then begin
						max:= n^.dato.cantProd;
						maxMonto:= n^.dato.monto;
						end
						else
							if (n^.dato.cantProd = max) then
								if (n^.dato.monto > maxMonto) then
									maxMonto:= n^.dato.monto;
					mayorCantProductos:= mayorCantProductos(n^.sig, max, maxMonto);
					end;
			end;
	var
		max: integer;
		maxMonto: real;
	begin
		max:=-9999;
		maxMonto:= -1;
		mayorMonto:= mayorCantProductos(n, max, maxMonto);
		end;

// PROGRAMA PRINCIPAL
var
	a: arbol;
	nodo: lista;
begin
	Randomize;
	a:=nil;					// Arbol principal para guardar las compras por cliente, y la lista de cada cliente 
	nodo:= nil;				// Nodo auxiliar de lista para buscar si existe en el arbol
	procesarCompras(a);
	buscarProductosDeCliente(a, nodo);
	if (nodo <> nil) then
		writeln('Monto de la compra con mayor cantidad de productos: ',mayorMonto(nodo):5:2)
		else
			writeln('No hay monto mayor porque el numero de cliente no existe.');
	readln();
end.