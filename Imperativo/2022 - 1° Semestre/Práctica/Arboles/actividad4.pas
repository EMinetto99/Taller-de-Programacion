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
procedure enOrden(a: arbol);
  begin
    if (a<>nil) then begin
      enOrden(a^.HI);
      write('|',a^.dato,'|');
      enOrden(a^.HD);
      end;
    end;
procedure preOrden(a: arbol);
  begin
    if (a<>nil) then begin
      write('|',a^.dato,'|');
      preOrden(a^.HI);
      preOrden(a^.HD);
      end;
    end;
procedure postOrden(a: arbol);
  begin
    if (a<>nil) then begin
      postOrden(a^.HI);
      postOrden(a^.HD);
      write('|',a^.dato,'|');
      end;
    end;
function Buscar(a: arbol; n: integer):arbol;
  begin
    if (a=nil) then
      Buscar:=nil
      else begin
        if (n=a^.dato) then
          Buscar:=a
          else begin
            if (n<a^.dato) then
              Buscar:=Buscar(a^.HI,n)
              else
                Buscar:=Buscar(a^.HD,n)
            end;
        end;
    end;
function VerMin(a: arbol):integer;  // Funcion - Si el arbol esta vacio (nil) devuelve -1 | Sino el elemento mas chico del ABB
  begin
    if (a=nil) then
      VerMin:=-1
      else begin
        if (a^.HI<>nil) then
          VerMin:=VerMin(a^.HI)
          else
            VerMin:=a^.dato;
        end;
    end;
function VerMax(a: arbol):integer;  // Funcion - Si el arbol esta vacio (nil) devuelve -1 | Sino el elemento mas grnade del ABB
  begin
    if (a=nil) then
      VerMax:=-1
      else begin
        if (a^.HD<>nil) then
          VerMax:=VerMax(a^.HD)
          else
            VerMax:=a^.dato;
        end;
    end;
{PROGRAMA PRINCIPAL}
var
  a: arbol;
  num: integer;
begin
  a:=nil;
  crearABB(a);
  write('ORDEN ');
  enOrden(a);
  writeln;
  write('Pre-ORDEN ');
  preOrden(a);
  writeln;
  write('Post-ORDEN ');
  postOrden(a);
  writeln;
  write('Ingrese un numero a buscar en el ABB: ');
  readln(num);
  if (Buscar(a,num)<>nil) then
    writeln('SE ENCONTRO!!!')
    else
      writeln('NIL - No se encontro elemento.');
  writeln('Numero MINIMO en la estructura ABB: ',VerMin(a));
  writeln('Numero MAXIMO en la estructura ABB: ',VerMax(a));
  readln;
end.