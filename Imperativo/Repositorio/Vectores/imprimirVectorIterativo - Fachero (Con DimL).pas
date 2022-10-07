procedure imprimirVectorIterativo_Fachero (v: vector; dimL: integer);
	var
		i: integer;
	begin
		for i:= 1 to dimL do
			write('----');
		writeln;
		write(' ');
		for i:= 1 to dimL do
			write(v[i], ' | ');
		writeln;
		for i:= 1 to dimL do
			write('----');
		writeln;
		writeln;
		end;