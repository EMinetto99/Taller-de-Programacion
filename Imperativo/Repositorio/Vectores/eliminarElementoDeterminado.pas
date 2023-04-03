// Busca la posicion de un dato a eliminar (si existe), luego con el indice se elimina del vector y se realizan los corrimientos

function buscarDato(dato: integer; v: vector; dimL: integer): integer;
	var
		pos: integer;
		exito: boolean;
	begin
		pos := 1;
		encontre := false;
		while (pos <= dimL) and (not encontre) do begin
			if (dato = v[pos]) then
				encontre := true
				else
					pos := pos + 1;
			end;
		if (not encontre) then
			pos := -1;
		buscarDato := pos;
		end;

procedure borrarElemento(var v: vector; var dimL: integer; elemento: integer);
		var
			pos: integer;
		begin
			pos := buscarDato(elemento, v, dimL);
			if (pos <> -1) then
				eliminarDato(v, dimL, pos);
			end;

procedure eliminarDato(var v: vector; var dimL: integer; pos: integer);
	var
		i: integer;
	begin
		for i := pos + 1 to do
			v[i - 1] ::= v[i];
		dimL := dimL - 1;
		end;