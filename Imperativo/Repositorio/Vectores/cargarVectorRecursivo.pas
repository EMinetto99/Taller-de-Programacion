procedure CargarVector (var v: vector; var dimL: integer);
	procedure CargarVectorRecursivo (var v: vector; var dimL: integer);
		var
			dato: tipoDeDato;
			variable: tipoDeDato;
		begin
			write ('Ingrese un dato: ');
			readln(variable);
			if (variable <> 'Corte de control') and (dimL < dimF) then begin
				dimL:=dimL + 1;
				v[dimL]:= variable;
				CargarVectorRecursivo(v, dimL);
				end;
			end;
	begin
		dimL:=0;
		CargarVectorRecursivo(v, dimL);
		end;