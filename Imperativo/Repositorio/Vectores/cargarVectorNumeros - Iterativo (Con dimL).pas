procedure cargarVector_Numeros(var v: vector; var dimL: integer);
	var
		num: integer;
	begin
		// inicializarVec(v);
		write('Ingrese un valor a cargar en el vector (',dimF,' espacios restantes) o "0" para terminar: ');
		readln(num);
		while (num<>0) and (dimL<dimF)do begin
			dimL:=dimL+1;
			v[dimL]:=num;
			if (dimL<dimF) then begin
				write('Ingrese otro valor a cargar en el vector (',dimF-dimL,' espacios restantes) o "0" para terminar: ');
				readln(num);
				end;
			end;
		{ if (dimL<>0) and (dimL<>1) then
			ordenarVector(v,dimL); }
		end;