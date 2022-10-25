{ Una biblioteca nos ha encargado procesar la información de los préstamos realizados durante cada el año 2021. De cada préstamo se conoce
el ISBN del libro, el número de socio, día y mes del préstamo y cantidad de días prestados. Implementar un programa con:

a.	Un módulo que lea préstamos y retorne en una estructura adecuada la información de los préstamos organizada por mes. Para cada mes, los
 préstamos deben quedar ordenados por ISBN. La lectura de los préstamos finaliza con ISBN -1.
b.	Un módulo recursivo que reciba la estructura generada en a. y muestre, para cada mes, ISBN y numero de socio.
c.	Un módulo que reciba la estructura generada en a. y retorne una nueva estructura con todos los préstamos ordenados por ISBN.
d.	Un módulo recursivo que reciba la estructura generada en c. y muestre todos los ISBN y número de socio correspondiente.
e.	Un módulo que reciba la estructura generada en a. y retorne una nueva estructura ordenada ISBN, donde cada ISBN aparezca una vez junto
    a la cantidad total de veces que se prestó durante el año 2021.
f.	Un módulo recursivo que reciba la estructura generada en e. y muestre su contenido.

}


program ejer1Clase4;
const dimF = 12;
      valorGrande = 9999;
type  rangoDias = 1..31;
      rangoMeses = 1..12;
      prestamo = record
                  ISBN: integer;
                  numeroSocio: integer;
                  dia: rangoDias;
                  mes: rangoMeses;
                  cantDias: integer;
                end;
     prestamoAGuardar = record    // NO contiene el mes
                          ISBN: integer;
                          numeroSocio: integer;
                          dia: rangoDias;
                          cantDias: integer;
                        end;
     lista = ^nodo;
     nodo = record
              dato: prestamoAGuardar;
              sig: lista;
            end;
     vector = array [1..dimF] of lista;
     elemAcumulador = record    
                        ISBN: integer;
                        cantPrestamos: integer;
                      end;
     listaAcumulador = ^nodoAcumulador;
     nodoAcumulador = record
                         dato: elemAcumulador;
                         sig: listaAcumulador;
                      end;

procedure GenerarVectorListas (var v: vector);
  procedure CrearListasEnVector (var v: vector);
    var i: integer;
    begin
      for i:= 1 to dimF do
        v [i]:= nil
      end;

  procedure LeerPrestamo (var p: prestamo);
    begin
      write ('Ingrese ISBN: ');
      readln (p.ISBN);
      if (p.ISBN <> -1) then begin
        write ('Ingrese numero de socio: ');
        p.numeroSocio:= random(100) + 100;
        writeln (p.numeroSocio);
        write ('Ingrese dia: ');
        p.dia:= random(30) + 1;
        writeln (p.dia);
        write ('Ingrese mes: ');
        readln (p.mes);
        write ('Ingrese cantidad: ');
        p.cantDias:= random(14) + 1;
        writeln (p.cantDias);
        end;
      end;

  procedure InsertarElementoEnLista(var l: Lista; pG: prestamoAGuardar);
    var 
      ant, nuevo, act: lista;
    begin
      new (nuevo);
      nuevo^.dato := pG;
      act := l;
      { Recorro mientras no se termine la lista y no encuentro la posición correcta }
      while (act <> NIL) and (act^.dato.ISBN < pG.ISBN) do begin
        ant := act;
        act := act^.sig ;
        end;
      if (act = l) then
        l:= nuevo   {el dato va al principio}
        else
          ant^.sig := nuevo; {va entre otros dos o al final}
      nuevo^.sig := act ;
   end;

  procedure ArmarPrestamoAguardar (p: prestamo; var pG: prestamoAGuardar);
    begin
      pG.ISBN:= p.ISBN;
      pG.numeroSocio:= p.numeroSocio;
      pG.dia:= p.dia;
      pG.cantDias:= p.cantDias;
      end;

var
  p: prestamo; pG: prestamoAGuardar;
begin
  CrearListasEnVector(v);
  LeerPrestamo(p);
  while (p.ISBN <> -1) do begin
    ArmarPrestamoAguardar (p, pG);
    InsertarElementoEnLista (v[p.mes], pG);
    LeerPrestamo (p);
    end;
  end;

procedure imprimirLista(l: lista);
  begin
    if (l <> nil) then begin
      writeln('      ISBN: ', l^.dato.ISBN, '  Numero de socio: ', l^.dato.numeroSocio);
      imprimirLista (l^.sig);
      end;
    end;

procedure ImprimirVectorListas(v: vector);
  var
    i: integer;
  begin
    writeln;
    writeln ('----- Vector de listas ----->');
    writeln;
    for i:= 1 to dimF do begin
      writeln;
      writeln ('Mes ',i);
      if (v[i] = nil ) then
        writeln ('      Sin elementos')
        else
          imprimirLista (v[i]);
      end;
    end;

procedure minimo(var v: vector; var prestamoMin: prestamoAGuardar);
  var
    indiceMin, i: integer;
  begin
    prestamoMin.ISBN:= valorGrande;
    for i:= 1 to dimF do begin
      if (v[i] <> nil) then
        if (v[i]^.dato.ISBN <= prestamoMin.ISBN) then begin
          indiceMin:= i;
          prestamoMin:= v[i]^.dato;
          end; 
      end;
      if (prestamoMin.ISBN <> valorGrande) then
        v[indiceMin]:= v[indiceMin]^.sig;
    end;

procedure Merge(v: vector; var l: lista);
  procedure AgregarAtras (var l, ult: lista; p: prestamoAGuardar); 
    var
      nuevo: lista;
    begin
      new (nuevo);
      nuevo^.dato:= p;
      nuevo^.sig := nil;
      if (l = nil) then
        l:= nuevo
        else
          ult^.sig := nuevo;
      ult := nuevo;
      end;

  var
    prestamoMin: prestamoAGuardar; ult: lista;
  begin
    l:= nil;
    minimo (v, prestamoMin);
    while (prestamoMin.ISBN <> valorGrande) do begin
      agregarAtras(l, ult, prestamoMin);
      minimo(v, prestamoMin);
      end;
    end;

procedure imprimirEstructuraMerge(l: lista);
  begin
    writeln;
    writeln ('----- Estructura merge ----->');
    writeln;
    if (l = nil ) then
      writeln ('      Sin elementos')
      else
        imprimirLista (l);
    end;

procedure MergeAcumulador (v: vector; var l: listaAcumulador);
  procedure agregarAtras2 (var l, ult: listaAcumulador; e: elemAcumulador);
    var
      nuevo: listaAcumulador;
    begin
      new (nuevo);
      nuevo^.dato:= e;
      nuevo^.sig := nil;
      if (l = nil) then
        l:= nuevo
        else
          ult^.sig := nuevo;
      ult := nuevo;
      end;

var
  prestamoMin: prestamoAGuardar;
  ult: listaAcumulador;
  actual: elemAcumulador;
begin
  l:= nil;
  minimo (v, prestamoMin);
  while (prestamoMin.ISBN <> valorGrande) do begin
    actual.ISBN:= prestamoMin.ISBN; actual.cantPrestamos:= 0;
    while (actual.ISBN = prestamoMin.ISBN) do begin
      actual.cantPrestamos:= actual.cantPrestamos + 1;
      minimo (v, prestamoMin);
      end;
    agregarAtras2 (l, ult, actual);
    end;
  end;

procedure ImprimirEstructuraMergeAcumulador (l: listaAcumulador);
  procedure imprimirListaAcumulador (l: listaAcumulador);
  begin
     if (l <> nil) then 
     begin
        writeln('      ISBN: ', l^.dato.ISBN, '  Cantidad prestamos: ', l^.dato.cantPrestamos);
        imprimirListaAcumulador (l^.sig);
     end;
  end;
  
begin
  writeln;
  writeln ('----- Estructura merge acumulador ----->');
  writeln;
  if (l = nil ) 
     then writeln ('      Sin elementos')
     else imprimirListaAcumulador (l);
end;

var
  v: vector; l1: lista; l2: listaAcumulador;
begin
  Randomize;
  GenerarVectorListas(v);
  ImprimirVectorListas(v);
  Merge(v, l1);
  ImprimirEstructuraMerge (l1);
  MergeAcumulador (v, l2);
  ImprimirEstructuraMergeAcumulador (l2);
end.