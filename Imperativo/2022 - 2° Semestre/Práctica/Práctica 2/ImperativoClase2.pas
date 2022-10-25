{Implementar un programa que invoque a los siguientes módulos.

a. Implementar un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y los almacene en un vector con
   dimensión física igual a 10.
b. Implementar un módulo que imprima el contenido del vector.
c. Implementar un módulo recursivo que imprima el contenido del vector.
d. Implementar un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y retorne la cantidad de caracteres
   leidos. El programa debe informar el valor retornado.
e. Implementar un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y retorne una lista con los caracteres
   leidos.
f. Implemente un módulo recursivo que reciba la lista generada en d. e imprima los valores de la lista en el mismo orden que están
   almacenados.
g. Implemente un módulo recursivo que reciba la lista generada en d. e imprima los valores de la lista en orden inverso al que están
   almacenados.
}

program Clase2MI;
const 
  dimF = 10;
type 
  vector = array [1..dimF] of char;
  lista = ^nodo;
  nodo = record
        dato: char;
        sig: lista;
        end;

procedure CargarVector (var v: vector; var dimL: integer);

  procedure CargarVectorRecursivo (var v: vector; var dimL: integer);
  var
    caracter: char;
  begin
    write ('Ingrese un caracter: ');
    readln(caracter);  
    if (caracter <> '.' ) and (dimL<dimF) then begin
      dimL:= dimL + 1;
      v[dimL]:= caracter;
      CargarVectorRecursivo(v, dimL);
      end;
    end;
  begin
    dimL:= 0;
    CargarVectorRecursivo (v, dimL);
    end;

procedure ImprimirVector (v: vector; dimL: integer);
  var
    i: integer;
  begin
    for i:= 1 to dimL do
      write ('----');
    writeln;
    write (' ');
    for i:= 1 to dimL do
      write(v[i], ' | ');
    writeln;
    for i:= 1 to dimL do
      write ('----');
    writeln;
    writeln;
    end;
procedure ImprimirVectorRecursivo(v: vector; dimL: integer);
  procedure imprimirVector_R(v: vector; dimL, i: integer);
    begin
      if (i<=dimL) then begin
        write(v[i],'|');
        i:=i+1;
        imprimirVector_R(v,dimL,i);
        end;
      end;
  var
    i: integer;
  begin
    i:=1;
    write('|');
    imprimirVector_R(v,dimL,i);
    writeln;
    end;

function ContarCaracteres(): integer;
  var
    caracter: char;
  begin
    write ('Ingrese un caracter: ');
    readln(caracter);
    if (caracter <> '.') then
      ContarCaracteres:= ContarCaracteres() + 1
      else
        ContarCaracteres:=0  
    end;

procedure CargarLista (var l: lista);
  var caracter: char;
    nuevo: lista;
  begin
    write('Ingrese un caracter: ');
    readln(caracter);  
    if (caracter <> '.') then begin
      CargarLista(l);
      new(nuevo);
      nuevo^.dato:= caracter;
      nuevo^.sig:= l;
      l:= nuevo;
      end
      else
        l:= nil
    end;

procedure ImprimirListaMismoOrden (l: lista);
begin
  if (l<>nil) then begin
    write (' ', l^.dato);
    ImprimirListaMismoOrden (l^.sig);
    end;
  end;
procedure ImprimirListaOrdenInverso(l: lista);
  begin
    if (l<>nil) then begin
      ImprimirListaOrdenInverso(l^.sig);
      write(' ',l^.dato);
      end;
    end;

// PROGRAMA PRINCIPAL
var
  cont, dimL: integer; l: lista; v: vector;
begin 
  CargarVector (v, dimL);
  writeln;
  if (dimL = 0) then
    writeln ('--- Vector sin elementos ---')
    else begin
      ImprimirVector (v, dimL);
      writeln('====== IMPRESION de VECTOR de forma RECURSIVA ======');
      ImprimirVectorRecursivo (v, dimL);
      end;
  writeln;
  writeln;                   
  cont:= ContarCaracteres();
  writeln;
  writeln;
  writeln('Se ingresaron ',cont,' caracteres'); 
  writeln;
  writeln;
  CargarLista (l);
  writeln;
  writeln;
  if (l = nil) then
    writeln ('--- Lista sin elementos ---')
    else begin
      writeln ('--- Orden ingresado ---');
      writeln;
      ImprimirListaMismoOrden (l);
      writeln;
      writeln;
      writeln ('--- Orden inverso ---');
      writeln;
      ImprimirListaOrdenInverso (l);
      end;
  readln;
end.