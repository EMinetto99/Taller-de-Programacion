program listaOrdenada;

procedure agregarAdelante(var L: lista; valor: integer);
	var
		nue: lista;
	begin
		new(nue);
		nue^.dato := valor;
		nue^.sig := L;
		L := nue;
		end;