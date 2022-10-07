procedure inicializar_Vector_Listas(var v: vector_Listas; dimL: integer);
	var
		i: integer;
	begin
		for i:=1 to dimL do
			v[i]:=nil;
		end;