procedure ImprimirVectorRecursivo(v: vector; dimL: integer);
	procedure imprimirVector_R(v: vector; dimL, i: integer);
		begin
			if (i<=dimL) then begin
				write(v[i],'|');
				i:=i+1;
				imprimirVector_R(v,dimL,i);
				end;
			end;
	var
		i: integer;
	begin
		i:=1;
		write('|');
		imprimirVector_R(v,dimL,i);
		writeln;
		end;