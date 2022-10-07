function sumaVector(v: vector; dimL: integer): integer;
	begin
		if (dimL = 0) then
			sumaVector := 0
			else
				sumaVector := sumaVector(v, dimL-1) + v[dimL]
		end;