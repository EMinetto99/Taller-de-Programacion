{Implementar un programa que procese la información de las ventas de productos de un comercio (como máximo 20). 
De cada venta se conoce código del producto (entre 1 y 15) y cantidad vendida (como máximo 99 unidades). 
El ingreso de las ventas finaliza con el código 0 (no se procesa).

a. Almacenar la información de las ventas en un vector. El código debe generarse automáticamente (random) y la edad se debe leer. 
b. Mostrar el contenido del vector resultante.
c. Ordenar el vector de ventas por código.
d. Mostrar el contenido del vector resultante.
e. Eliminar del vector ordenado las ventas con código de producto entre dos valores que se ingresan como parámetros. 
f. Mostrar el contenido del vector resultante.
g. Generar una lista ordenada por código de producto de menor a mayor a partir del vector resultante del inciso e., sólo para los códigos pares.
h. Mostrar la lista resultante.}

program Clase1MI;
const dimF = 20;
type rango1 = 0..15;
     rango2 = 0..99;
     rango3 = 0..dimF;
     venta = record
        codigoP: rango1;
        cantidad: rango2;
        end;
	 vector = array [1..dimF] of venta;

procedure AlmacenarInformacion (var v: vector; var dimL: rango3);
    procedure LeerVenta (var v: venta);
        begin
            Randomize;
            write ('Codigo de producto: ');
            v.codigoP:=random(16);
            writeln(v.codigoP);
            if (v.codigoP<>0) then begin
                repeat
                    write('Ingrese cantidad (entre 1 y 99): ');
                    readln(v.cantidad);
                    until (v.cantidad>0) and (v.cantidad<100);
                end;
            end;
    var
        unaVenta: venta;
    begin
        dimL := 0;
        LeerVenta(unaVenta);
        while (unaVenta.codigoP <> 0)  and (dimL < dimF) do begin
            dimL := dimL + 1;
            v[dimL]:= unaVenta;
            LeerVenta (unaVenta);
            end;
        end;

procedure ImprimirVector (v: vector; dimL: rango3);
var
   i: integer;
begin
     for i:= 1 to dimL do
         write ('-----');
     writeln;
     write (' Codigo ');
     for i:= 1 to dimL do begin
        if(v[i].codigoP <= 9)then
            write('0');
        write(v[i].codigoP, ' | ');
     end;
     writeln;
     writeln;
     write (' Cantidad ');
     for i:= 1 to dimL do begin
        if (v[i].cantidad <= 9)then
            write ('0');
        write(v[i].cantidad, ' | ');
     end;
     writeln;
     for i:= 1 to dimL do
         write ('-----');
     writeln;
     writeln;
End;

procedure Ordenar(var v: vector; dimL: rango3);
    var
        i, j, pos: rango3; item: venta;	
	begin
        for i:= 1 to dimL - 1 do begin {busca el mínimo y guarda en pos la posición}
            pos := i;
            for j := i+1 to dimL do
                if (v[j].codigoP < v[pos].codigoP) then
                    pos:=j;
            {intercambia v[i] y v[pos]}
            item := v[pos];
            v[pos] := v[i];
            v[i] := item;
            end;
        end;
procedure Eliminar(var v: vector; dimL, vInferior, vSuperior: integer);
    var
        i, j: integer;
    begin
        j:=vInferior;
        for i:=vSuperior+1 to dimL do begin
            v[j]:=v[i];
            v[i].codigoP:=0;    // Limpio/inicializo el dato a 0
            v[i].cantidad:=0;   // Limpio/inicializo el dato a 0
            j:=j+1;
            end;
        dimL:=j+1;
        end;
var
    v: vector;
    dimL: rango3;
    valorInferior, valorSuperior: rango1;
begin
    AlmacenarInformacion (v, dimL);
    writeln;
    if (dimL = 0) then
        writeln ('--- Vector sin elementos ---')
        else begin
            ImprimirVector (v, dimL);
            Ordenar (v, dimL);
            ImprimirVector (v, dimL);
            write('Ingrese un rango a ELIMINAR: valor inferior (entre 1 y 15): ');
            readln(valorInferior);
            write('Ingrese: valor superior (al valor anterior): ');
            readln(valorSuperior);
            Eliminar(v, dimL, valorInferior, valorSuperior);
            if (dimL = 0) then
                writeln ('--- Vector sin elementos, luego de la eliminación ---')
                else begin
                    ImprimirVector(v, dimL);
                    {GenerarLista(v, dimL, L);
                    if (L = nil) then
                        writeln ('--- Lista sin elementos ---')
                        else
                            ImprimirLista (L);}
                    end;
            end;
    readln;
end.