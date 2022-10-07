// Busca el nodo minimo del arbol, solo devuelve el nodo

function minimo(a: arbol): arbol;
    begin
        if (a = nil) then
            minimo := nil
        else
            if (a^.HI = nil) then
                minimo := a
                else
                    minimo := minimo(a^.HI);
        end;