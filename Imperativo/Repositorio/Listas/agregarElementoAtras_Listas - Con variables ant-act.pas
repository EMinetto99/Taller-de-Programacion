// Recorre la lista para encontrar el ultimo elemento

procedure agregarAtras(var L: lista; dato: integer);
var
	nue, act, ant: lista;
begin
	new(nue);
	nue^.dato := dato;
	ant := L;
	act := L;
	while (act <> nil) do begin
		ant := act;
		act := act^.sig;
		end;
	if (ant = act) then
		L := nue
		else
			ant^.sig := nue;
	nue^.sig := act;
end;