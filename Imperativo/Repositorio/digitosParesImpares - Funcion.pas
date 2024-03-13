function digitosParesQueImpares(num: integer): boolean;
var
	pares, impares: integer;
	estado: boolean;
begin
	pares := 0;
	impares := 0;
	estado := false;
	while (num <> 0) do begin
		if ((num mod 10) mod 2 = 0) then 
			pares := pares + 1;
		else
			impares := impares + 1;
		num:= num div 10;
	end;
	if (pares > impares) then
		estado := true;
	digitosParesQueImpares := estado;
end;