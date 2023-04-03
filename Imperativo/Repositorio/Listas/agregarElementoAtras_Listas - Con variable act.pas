// Recorre la lista hasta encontrar el ultimo elemento (no usa variable anterior)

procedure agregarAtras(var L: lista; dato: integer);    // Recorre toda la lista
var
        aux, act : lista;
begin
        new(aux);
        aux^.dato := dato;
        aux^.sig := nil;
        if (L <> nil) then begin
            act := L;
            while (act^.sig <> nil) do
                act := act^.sig;
            act^.sig := aux;
            end
            else
                L := aux;
end;