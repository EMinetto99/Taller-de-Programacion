procedure preOrden(a : arbol);
    begin       // Entrada 3, 5, 22, 12, 34, -1, 7, 0
        if (a <> nil) then begin
            write (' |',a^.dato,'| ');
            preOrden (a^.HI);
            preOrden (a^.HD);
            end;
        end;    // Salida 3, -1, 5, 22, 12, 7, 34 (raiz hacia las hojas)


writeln;    // Salto de linea fuera de la RECURSIÓN