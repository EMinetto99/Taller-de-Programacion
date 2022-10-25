program practica2act2;
type digito=-1..9;
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
var 
    num: integer;
begin
  write('Ingrese un numero entero a descomponer (0 para terminar): ');
  readln(num);
  while (num <> 0) do begin
    ImprimirDigitos(num);
    writeln;
    write('Ingrese otro numero a descomponer (0 para terminar): ');
    readln(num);
    end;
  readln;
end.