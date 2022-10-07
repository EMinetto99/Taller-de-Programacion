// Busca el minimo elemento del arbol, solo devuelve el dato almacenado

function minimo(a : arbol): integer;
    begin 
        if ( a^.HI <> nil ) then
            minimo := minimo(a^.HI)
            else
                minimo := a^.dato;
        end;