program integerToBinary;
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
var
	num: integer;
begin
	write('Ingrese un numero Entero a convertir o "0" para terminar: ');
	readln(num);
	while (num<>0) do begin
		if (num>=1) then begin
			writeln;
			write('  ');
			conversorBinario(num);
			writeln;
			writeln;			
			end
			else begin
				writeln;
				writeln('  Por favor, ingrese un numero mayor a 0!');
				writeln;
				end;
		write('Ingrese un numero Entero a convertir o "0" para terminar: ');
		readln(num);
		end;
end.