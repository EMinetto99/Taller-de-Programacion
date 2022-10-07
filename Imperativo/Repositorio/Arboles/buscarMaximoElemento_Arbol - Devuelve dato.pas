// Busca el maximo elemento del arbol, solo devuelve el dato almacenado

function maximo(a: arbol): integer;
    begin 
        if ( a^.HD <> nil ) then
            maximo := maximo(a^.HD)
            else
                maximo := a^.dato;
        end;