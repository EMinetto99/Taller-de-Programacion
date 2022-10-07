// Busca el nodo maximo del arbol, solo devuelve el nodo

function maximo(a: arbol): arbol;
    begin
        if (a = nil) then
            maximo := nil
        else
            if (a^.HD = nil) then
                maximo := a
                else
                    maximo := maximo(a^.HD); 
        end;