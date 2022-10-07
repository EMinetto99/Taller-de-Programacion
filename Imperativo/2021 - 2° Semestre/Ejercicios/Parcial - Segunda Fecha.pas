program supermercado;
type
	producto=record
		codProducto: integer;
		cantidad: integer;
		end;
	lista_productos=^nodo;
	nodo=record
		dato: producto;
		sig: lista_productos;
		end;
	pedido=record
		codPedido: integer;
		dni: integer;
		listProd: lista_productos;
		end;
	lista_pedidos=^nodo2;
	nodo2= record
		dato: pedido;
		sig: lista_pedidos;
		end;
	arbol_prod=record
		cod: integer;
		stock: integer;
		end;
	arbol_productos=^nodoA;
	nodoA=record
		dato: arbol_prod;
		HI: arbol_productos;
		HD: arbol_productos;
		end;
procedure buscarABB(a: arbol_productos; cod: integer):arbol_productos;
	begin
		if (a=nil) then
			buscarABB:=nil;
			else
				if (cod=a^.dato.cod) then
					buscarABB:=a;
					else
						if (cod<a^.dato.cod) then
							buscarABB:=buscarABB(a^.HI,cod);
							else
								buscarABB:=buscarABB(a^.HD,cod);
	end;
procedure recorrerPedido(l_ped: lista_pedidos; var a_prod: arbol_productos);
	var
		if (l_ped<>nil) then begin
			if (buscarABB(a_prod,l_ped^.dato.listProd.dato.codProducto)<>nil);
				a_prod^.dato.stock:=a_prod^.dato.stock-(l_ped^.dato.listProd.dato.cantidad);
				else
					insertarABB(a_prod,a_prod,l_ped^.dato.listProd.dato.codProducto);
var
	l_ped: lista_pedidos;
	a_prod: arbol_productos;
begin
	//Se dispone pedidos
	//Se dispone productos
	//Se dispone arbol de productos
	recorrerPedido(l_ped,a_prod);
end.