{ Un comercio necesita el procesamiento de las compras realizadas por sus clientes durante el mes de julio de 2022. De cada compra se conoce código del 
cliente, día, cantidad de productos y monto pagado.
a) Implementar un módulo que lea compras, genere y retorne una estructura adecuada para la búsqueda por código del cliente, donde para cada código de cliente 
se almacenan juntas todas sus compras (día, cantidad de productos y monto) que realizó. La lectura finaliza con cantidad de productos 0. 
Se sugiere utilizar el módulo leerRegistro ().
b) Implementar un módulo que reciba la estructura generada en a) y un código de cliente y retorne todas las compras de dicho cliente.
c) Realizar un módulo recursivo que reciba la estructura que retorna el inciso b) y retorne el monto de la compra con mayor cantidad de productos. 

NOTA: Implementar el programa principal, que invoque a los incisos a, b y c.
}

program Tema1;
type
 rangoDias= 1..31;
 registro= record 
             codCliente: integer;
             dia:rangoDias;
             cantProductos:integer;
             monto:real;
          end;
 datoGuardar= record
                dia:rangoDias;
                cantProductos:integer;
                monto:real;
             end;
 lista= ^nodo;
 nodo= record
         dato:datoGuardar;
         sig:lista;
       end;
 info = record
          codCliente:integer;
          compras: lista;
        end;
 arbol=^nodoA;
 nodoA= record
          dato: info;
          hd:arbol;
          hi:arbol;
        end;
       
procedure generarArbol (var a: arbol);
{Implementar un módulo que lea compras, genere y retorne una estructura adecuada para la búsqueda por código del cliente, donde para cada código de cliente 
se almacenan juntas todas sus compras (día, cantidad de productos y monto) que realizó. La lectura finaliza con cantidad de productos 0.}

    procedure LeerRegistro( var R: registro);
      begin
          r.cantProductos:= random(15);
          if(r.cantProductos<> 0) then begin
             {r.codCliente:= 1 + random (99);}
             write ('Ingrese codigo: ');
             read (r.codCliente);
             r.monto:= 150.80 + random(800);
             r.dia:= 1 + random( 31);
             writeln ('                   Cantidad: ', r.cantProductos, ' Monto: ' , r.monto:2:2);
           end;
        end;
    procedure agregarAdelante( var l: lista; r: datoGuardar);
    var  nue:lista;
    begin
         new(nue);
         nue^.dato:= r;
         nue^.sig:= l;
         l:= nue;
    end;
    procedure insertarEnArbol ( var a: arbol; elem: registro);
      procedure ArmarRegistroAGuardarEnLista (r: registro; var aGuardar: datoGuardar);
      begin
         aGuardar.cantProductos:= r.cantProductos;
         aGuardar.monto:= r.monto;
         aGuardar.dia:= r.dia;
      end;

    var aGuardar: datoGuardar;
    begin
        if( a= nil)
        then begin
               new(a);
               a^.dato.codCliente:= elem.codCliente;
               a^.dato.compras:= nil;
               ArmarRegistroAGuardarEnLista (elem, aGuardar);
               agregarAdelante(a^.dato.compras, aGuardar);
               a^.hd:= nil;
               a^.hi:= nil;
             end
        else if(elem.codCliente = a^.dato.codCliente)
             then begin
                     ArmarRegistroAGuardarEnLista (elem, aGuardar);
                     agregarAdelante( a^.dato.compras, aGuardar);
                  end
             else if (elem.codCliente < a^.dato.codCliente)
                  then insertarEnArbol (a^.hi, elem)
                  else insertarEnArbol (a^.hd, elem);
    end;

var  compra:registro;
begin
  writeln ('---------------------- Generar arbol ----------------------');
  writeln;
  a:= nil;
  leerRegistro(compra);
  while(compra.cantProductos<>0) do
  begin
    insertarEnArbol (a, compra);
    leerRegistro (compra);
  end;
end;

function buscarCompras (a: arbol; codigo: integer):lista;
{ Implementar un módulo que reciba la estructura generada en a) y un código de cliente y retorne todas las compras de dicho cliente. }
begin
  if (a= nil)
  then buscarCompras:= nil
  else if( a^.dato.codCliente = codigo)
       then buscarCompras:= a^.dato.compras
       else if(codigo < a^.dato.codCliente )
            then buscarCompras:= buscarCompras (a^.hi, codigo)
            else buscarCompras:= buscarCompras (a^.hd, codigo);
end;

procedure ObtenerMontoDeMayorCantidadProductos (l:lista; var maxProd: integer; var monto: real);
{ Realizar un módulo recursivo que reciba la estructura que retorna el inciso b) y retorne el monto de la compra con mayor cantidad de productos. }
begin
  if(l= nil)
  then maxProd:= -1
  else begin
         ObtenerMontoDeMayorCantidadProductos (l^.sig, maxProd, monto);
         if( l^.dato.cantProductos > maxProd) 
         then begin
                maxProd:= l^.dato.cantProductos;
                monto:= l^.dato.monto;
              end;
       end;
end;

var a: arbol;
    codigoClienteABuscar: integer;
    listaCompras: lista;
    monto:real;
    maxProd: integer;
begin
  generarArbol(a);
  if(a= nil)
  then begin
         writeln;
         writeln('////////// Arbol sin elementos //////////');
         writeln;
       end
  else begin
         writeln;
         writeln ('////////// Arbol generado ///////////');
         writeln;
         write ('Ingrese codigo a buscar: ');
         readln (codigoClienteABuscar);
         writeln;
         listaCompras:= buscarCompras(a, codigoClienteABuscar);
         if (listaCompras = nil)
         then writeln ('El cliente con codigo ', codigoClienteABuscar, ' no existe en el arbol')
         else begin
                 writeln;
                 writeln ('////////// Lista de compras retornada ///////////');
                 writeln; 
                 ObtenerMontoDeMayorCantidadProductos (listaCompras, maxProd, monto);
                 writeln ('El cliente con codigo ', codigoClienteABuscar, ' gasto $ ', monto:2:2, ' en la compra de mayor cantidad de productos');
              end;
       end;
end.
           
                     

