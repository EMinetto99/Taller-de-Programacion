// Devuelve la cantidad de DATOS impares (recorriendo todo) que haya en el arbol.
// PUEDE REALIZARSE UN PROCESO EN LUGAR DE UNA FUNCIÓN, es a gusto del programador.

function cantImpares(a: arbol): integer;
	procedure workImpares(a: arbol; var imp: integer);
		begin
			if (a <> nil) then begin
				(a^.HI, impares);
				if ((a^.dato.leg mod 2) = 1) then
					impares := impares + 1;
				workImpares(a^.HD, impares);
				end;
			end;
	var
		cantImp: integer;
	begin
		cantImp := 0;
		workImpares(a, cantImp);
		cantImpares := cantImp;
		end;