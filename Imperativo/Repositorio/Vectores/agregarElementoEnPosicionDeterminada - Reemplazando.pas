// Agregar un dato en una posicion determinada

procedure insertarEnPosicion(var v:vector; var dimL: integer; elemento: integer; pos: integer); // var exito: boolean
  var
    i : integer;
  begin
    // exito := false;
    if (dimL < dimF) and ((pos >= 1) and (pos <= dimL)) then begin  // verifica que haya lugar y que la posicion que le manden sea válida
      // exito:= true;
      for i := dimL downto pos do
        v[i+1] := v[i];     // hace el corrimiento para la derecha
      v[pos] := elemento;
      dimL := dimL + 1;
      end;
    end;