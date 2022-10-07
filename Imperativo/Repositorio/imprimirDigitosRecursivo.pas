// IMPRIME LOS DIGITOS DE UN NUMERO INGRESADO POR PARAMETRO

procedure ImprimirDigitos(num: integer);
  var
    dig: integer;
  begin
    if (num<>0) then begin
      dig:=num mod 10;
      num:=num div 10;
      ImprimirDigitos(num);
      write(dig,' ');
      end;
  end;