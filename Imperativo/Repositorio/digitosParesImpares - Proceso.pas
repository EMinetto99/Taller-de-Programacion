procedure digParesImpares(num: integer; var par, impar: integer);
var
    dig: integer;
begin
    // No se lee el numero "0", ya que no se sabe si es par o impar. Queda a criterio de uno.
    while (num <> 0) do begin
        dig := num mod 10;
        if ((dig mod 2) = 0) then
            par := par + 1
        else
            impar := impar + 1;
        num := num div 10;
    end;
end;