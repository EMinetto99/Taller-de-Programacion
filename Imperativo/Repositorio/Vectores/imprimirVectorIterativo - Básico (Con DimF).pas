// IMPRIME LOS VALORES DEL VECTOR - CON DIM FISICA

procedure imprimirVector(v: vector);
	var
		i: integer;
	begin
		write(' |');
		for i:=1 to dimF do
			write(' ',v[i],' |');
		writeln;
		end;