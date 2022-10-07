program ProgramaUno;
const
    CORTE=0;
type
    lista= ^nodo;
    nodo= record
       dato: integer;
       sig: lista;
    end;
procedure AgregarAlFinal (var pri, ult: lista; dato: integer);
    var  
      nue: lista;
    begin 
      new (nue);
      nue^.dato:=dato;
      nue^.sig :=nil;
      if (pri <> nil) then
        ult^.sig:=nue
        else
          pri:=nue;
          ult:=nue;
    end;
procedure CrearListaAgregarAtras(var l,ult: lista);
    var
      dato: integer;
    begin
      l:=nil;
      ult:=nil;
      writeln('Valores generados aleatorios');
      randomize;
      dato:=random(21);
      write(dato, ' ');
      while (dato<>CORTE) do begin
        AgregarAlFinal (l,ult, dato);
        dato:=random(21);
        write(dato, ' ');
        end;
      writeln;
    end;
procedure ImprimirLista (l:lista);
    begin
        while (l<>nil) do begin
          write (l^.dato, ' ');
          l:= l^.sig;
          end;
        writeln;
    end;
var
   l, ult: lista;
begin
     randomize;
     CrearListaAgregarAtras(l,ult);
     writeln('Datos almacenados en lista: ');
     ImprimirLista(l);
     readln;
end.