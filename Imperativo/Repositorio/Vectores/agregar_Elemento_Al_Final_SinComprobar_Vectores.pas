procedure AgregarElemento_AlFinal_SinComprobar_Vector(var v: vector; var dimL: integer; elemento: tipoDato);
begin
    if (dimL < dimF) then begin		{verifica si hay espacio en el vector}
    	dimL:= dimL+1;   			{se incrementa la dimension lógica del vector}
    	v[dimL] := elemento;		{se guarda el elemento al final del vector}
    	end;
    end;