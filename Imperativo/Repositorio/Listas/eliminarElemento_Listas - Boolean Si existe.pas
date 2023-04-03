procedure eliminarElemento(var L: lista; dato: integer; var exito: boolean);
  var
    ant, act: lista;
  begin 
    exito := false;
    act := L;
    // Recorro mientras no se termine la lista y no encuentre el elemento
    while (act <> nil) and (act^.dato <> dato) do begin
      ant := act;
      act := act^.sig;
      end;   
    if (act <> nil) then begin
        exito := true; 
        if (act = L) then
          L := act^.sig;
          else
            ant^.sig:= act^.sig;
        dispose(act);
        end;
    end;