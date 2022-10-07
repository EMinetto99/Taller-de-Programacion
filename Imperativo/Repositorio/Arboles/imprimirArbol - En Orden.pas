procedure enOrden(a: arbol);
	begin
    	if (a <> nil) then begin
        	enOrden(a^.HI);
        	write (' | ',a^.dato,' | ');
        	enOrden(a^.HD);
        	end;
        end;

writeln;	// Salto de linea fuera de la RECURSIÓN