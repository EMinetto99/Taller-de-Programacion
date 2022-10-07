// IMPRIME LOS VALORES DEL VECTOR - CON DIM LOGICA

procedure imprimirVector(v: vector; dimL: integer);
	var
		i: integer;
	begin
		if (dimL=0) then
			writeln('El vector se encuentra sin elementos.')
			else begin
				write(' |');
				for i:=1 to dimL do
					write(' ',v[i],' |');
				writeln;
				end;
		end;