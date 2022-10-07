procedure conversorBinario(num: integer);
	var
		dig: integer;
	begin
		if (num>1) then begin
			dig:=num mod 2;	//Resto 11 mod 2 = 1
			num:=num div 2;	//Cociente 11 div 2 = 5
			conversorBinario(num);
			write(dig);
			end
			else
				write('1');
		end;