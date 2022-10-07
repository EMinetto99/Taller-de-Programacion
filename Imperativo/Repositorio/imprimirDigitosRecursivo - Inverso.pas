// IMPRIME LOS DIGITOS DE UN NUMERO INGRESADO POR PARAMETRO, DE FORMA INVERSA

procedure ImprimirDigitos_Inverso(num: integer);
  var
    dig: integer;
  begin
    if (num<>0) then begin
      dig:=num mod 10;
      num:=num div 10;
      write(dig,' ');
      ImprimirDigitos(num);
      end;
  end;