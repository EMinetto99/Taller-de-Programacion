procedure postOrden(a : arbol);
    begin       // Entrada 3, 5, 22, 12, 34, -1, 7, 0
        if (a <> nil) then begin
            postOrden (a^.HI);
            postOrden (a^.HD);
            write (' |',a^.dato,'| ');
            end;
        end;    // Salida -1, 7, 12, 34, 22, 5, 3 (hojas hacia la raiz)


writeln;    // Salto de linea fuera de la RECURSIÓN