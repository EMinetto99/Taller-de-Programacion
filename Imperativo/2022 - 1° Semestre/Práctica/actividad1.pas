program ProgramaVector;
const
    cantN=10;
type
    v_numeros=array[1..cantN] of integer;
 procedure imprimirVector(v: v_numeros);
    var
        i: integer;
    begin
        write('|');
        for i:=1 to cantN do begin
            write(v[i],'|');
            end;
        writeln();
        end;
 procedure cargarVector(var v: v_numeros);
    var
        i: integer;
    begin
        for i:=1 to cantN do begin
            write('Ingrese un numero a cargar en el vector (',(cantN-i)+1,' restantes): ');
            readln(v[i]);
            end;
        end;
procedure OrdenacionPorInsercion(var v: v_numeros);
    var
        i, j, actual: integer;
    begin
        for i:=2 to cantN do begin
            actual:=v[i];   // Guardo elemento a ordenar
            j:=i-1;
            while (j>0) and (v[j]>actual) do begin
                v[j+1]:=v[j];
                j:=j-1;
                v[j+1]:=actual; // Guardar elemento en v[j+1]
                end;
            end;
        end;
 var
    vN: v_numeros;
    num: integer;
begin
    cargarVector(vN);
    imprimirVector(vN);
    OrdenacionPorInsercion(vN);
    imprimirVector(vN);
    write('Ingrese un numero a buscar en el vector: ');
    writeln(num);
    writeln('POSICION: ',BuscarElementoVectorOrdenado(vN,num));
    readln();
end.