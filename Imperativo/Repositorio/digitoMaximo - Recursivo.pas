// DEVUELVE EL DIGITO MAS GRANDE DE UN NUMERO INGRESADO POR PARAMETRO

procedure digitoMaximo_Recursivo(num: integer; var max: digito);
	var
		dig: integer;
	begin
		if (num <> 0) then begin
			dig:= num mod 10;
			if (dig > max) then begin
				max:= dig;
				num:= num div 10;
				digitoMaximo_Recursivo(num, max);
				end;
			end;
		end;