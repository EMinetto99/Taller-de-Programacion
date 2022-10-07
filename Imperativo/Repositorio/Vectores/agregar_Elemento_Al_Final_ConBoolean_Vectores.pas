procedure AgregarElemento_AlFinal_ConBoolean_Vector(var v: vector; var dimL: integer; elemento: integer; var exito: boolean);
begin
    exito:= false;   {Boolean para saber si se puede agregar o no}
    if (dimL < dimF) then begin  {verifica si hay espacio en el vector}
      exito:= true;    {se pudo agregar}
      dimL:= dimL+1;   {se incrementa la dimension lógica del vector}
      v[dimL] := elemento; {se guarda el elemento al final del vector}
      end;
    end;