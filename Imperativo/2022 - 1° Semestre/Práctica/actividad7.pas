{

    a) Implementar el procedimiento recursivo ImprimirDigitos1 que imprime los
    dígitos de un número dado, empezando por la unidad.
    b) Implementar el procedimiento recursivo ImprimirDigitos2 que imprime los
    dígitos de un número dado, finalizando con la unidad.

}
program actividad7;
type digito=-1..9;
procedure digitoMaximoRec(n: integer; var max: digito);
var
  dig: integer;
begin
  if (n<>0) then begin
    dig:= n mod 10;
    if (dig > max) then
      max:= dig;
      n:= n div 10;
      digitoMaximoRec(n, max);
      end;
end;
procedure ImprimirDigitos1(num: integer);
  var
    dig: integer;
  begin
    if (num<>0) then begin
      dig:=num mod 10;
      write(dig,' ');
      num:=num div 10;
      ImprimirDigitos1(num);
      end;
  end;
procedure ImprimirDigitos2(num: integer);
  var
    dig: integer;
  begin
    if (num<>0) then begin
      dig:=num mod 10;
      num:=num div 10;
      ImprimirDigitos2(num);
      write(dig,' ');
      end;
  end;
var 
    num: integer;
    max: digito;
begin
  write('Ingrese un numero entero a descomponer: ');
  readln(num);
  max:=-1;
  digitoMaximoRec(num, max);
  writeln('El digito maximo de ',num, ' es: ',max);
  write('Digitos del numero ingresado EMPEZANDO por la unidad: ');
  ImprimirDigitos1(num);
  writeln();
  write('Digitos del numero ingresado TERMINANDO por la unidad: ');
  ImprimirDigitos2(num);
  readln;
end.