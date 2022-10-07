program arboles;
type
  // Arbol de enteros
  arbol= ^nodoA;
  nodoA = record
    dato: integer;
    HI: arbol;
    HD: arbol;
    end;

  // Lista de Arboles PARA IMPRIMIRPORNIVEL
  listaNivel = ^nodoN;
  nodoN = record
    info: arbol;
    sig: listaNivel;
  end;


{-------------------MODULOS PARA IMPRIMIRPORNIVEL------------------------------}

// CONTARELEMENTOS - Devuelve la cantidad de elementos de una lista l

function ContarElementos (l: listaNivel): integer;
  var c: integer;
begin
  c:= 0;
  while (l <> nil) do begin
    c:= c+1;
    l:= l^.sig;
    end;
 contarElementos := c;
end;

//  AGREGARATRAS - Agrega un elemento atras en l

Procedure AgregarAtras (var l, ult: listaNivel; a:arbol);
  var
    nue:listaNivel;
  begin
    new (nue);
    nue^.info := a;
    nue^.sig := nil;
    if (l=nil) then
      l:=nue
      else 
        ult^.sig:=nue;
    ult:= nue;
  end;


// IMPRIMIRPORNIVEL - Muestra los datos del arbol a por niveles

Procedure imprimirpornivel(a: arbol);
var
   l, aux, ult: listaNivel;
   nivel, cant, i: integer;
begin
  l:= nil;
  if(a <> nil) then begin
    nivel:=0;
    agregarAtras (l,ult,a);
    while (l<> nil) do begin
      nivel := nivel + 1;
      cant:= contarElementos(l);
      write ('Nivel ', nivel, ': ');
      for i:= 1 to cant do begin
        write (l^.info^.dato, ' - ');
        if (l^.info^.HI <> nil) then
          agregarAtras(l,ult,l^.info^.HI);
        if (l^.info^.HD <> nil) then
          agregarAtras(l,ult,l^.info^.HD);
        aux:= l;
        l:= l^.sig;
        dispose (aux);
        end;
        writeln;
        end;
    end;
  end;
{-------------------FIN MODULOS PARA IMPRIMIRPORNIVEL-------------------------}

procedure Insertar(var a: arbol; dato: integer);
  begin
    if (a=nil) then begin
      new(a);
      a^.dato:= dato;
      a^.HI:=nil;
      a^.HD:=nil;
      end
      else begin
        if (a^.dato<>dato) then begin
          if (a^.dato>dato) then
            Insertar(a^.HI,dato)
            else
              Insertar (a^.HD,dato);
            end;
          end;
    end;
procedure crearABB(var a: arbol);
  var
    n: integer;
  begin
    write('Ingrese un numero (0 para terminar): ');
    readln(n);
    while (n<>0) do begin
      Insertar(a,n);
      write('Ingrese un numero (0 para terminar): ');
      readln(n);
      end;
    imprimirpornivel(a);
    end;
{PROGRAMA PRINCIPAL}
var
  a: arbol;
begin
  a:=nil;
  crearABB(a);
  readln;
end.