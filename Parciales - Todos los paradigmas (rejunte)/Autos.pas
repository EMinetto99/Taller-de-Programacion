{4. Una agencia dedicada a la venta de autos ha organizado su stock y, dispone en papel de la
información de los autos en venta.
Implementar un programa que:
a. Genere un árbol binario de búsqueda ordenado por patente identificatoria del auto en
venta. Cada nodo del árbol debe contener patente, año de fabricación (2010..2018), la
marca y el modelo.
b. Contenga un módulo que recibe el árbol generado en a) y una marca y devuelva la
cantidad de autos de dicha marca que posee la agencia. Mostrar el resultado.

c. Contenga un módulo que reciba el árbol generado en a) y retorne una estructura con la
información de los autos agrupados por año de fabricación.

d. Contenga un módulo que reciba el árbol generado en a) y una patente y devuelva el
año de fabricación del auto con dicha patente. Mostrar el resultado.}

program Hello;

const
    anioInicio = 2010;
    anioFin = 2018;
    fin = -1;
type
    rangoFab = anioInicio..anioFin;
    cadena30 = string[30];
    
    infoAuto = record
        patente:integer;
        anioFab: rangoFab;
        marca:cadena30;
        modelo:cadena30;
    end;
    
    arbol = ^nodo; 

    nodo = record
        dato: infoAuto;
        HI: arbol;
        HD: arbol;
    end;
    
    lista = ^nodoLista;
    
    nodoLista = record
        dato:infoAuto;
        sig: lista;
    end;
    
    vector = array [rangoFab] of lista;
//-----------------MODULOS------------------
procedure randomString(tamanio:integer; var palabra:string);
var  str,Result: String;
begin
    str:='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    Result:='';
    repeat
        Result:=Result+str[Random(Length(str))+1];
    until(Length(Result)=tamanio);
    palabra:=Result;
end;
procedure leerInfoAuto(var elem:infoAuto);
begin
    with elem do begin
        write('PATENTE:');
        patente := random(50)-1;
        writeln(patente);
        if(patente <> fin) then begin
            write('AÑO DE FABRICACION:');
            anioFab:= random(9) + 2010;//revisar
            writeln(anioFab);
            write('MARCA:');
            randomString(3,marca);
            writeln(marca);
            write('MODELO:');
            randomString(7,modelo);
            writeln(modelo);
            writeln('____');
        end;
    end;
end;

procedure generarArbol(var a:arbol);

    procedure agregar (var a: arbol; elem: infoAuto);
begin
    if (a = nil) then // caso base: que el árbol sea igual a nil (está vacío o llegué a una hoja)
    begin
        new (a);
        a^.dato := elem;
        a^.hi := nil; // inicializo los hijos en nil
        a^.hd := nil;
    end
    else
        if (elem.patente < a^.dato.patente) then // veo dónde voy a guardar el nuevo nodo (izq o der)
            agregar (a^.hi, elem)
        else
            agregar (a^.hd, elem)// si el valor que ingreso es mayor o igual va a ir a la derecha
end;

var
    elem: infoAuto;
begin
    leerInfoAuto(elem);
    while (elem.patente <> fin) do begin
        agregar (a, elem);
        leerInfoAuto(elem);
    end;
end;

procedure calcularCantidad(a : arbol; mark : String; var cont : integer);
begin
  if(a <> nil) then begin
    if(mark = a^.dato.marca) then
      cont := cont + 1;
    calcularCantidad(a^.hi,mark,cont);
    calcularCantidad(a^.hd,mark,cont);
  end;
end;
procedure enOrden (a: arbol);
begin
    if ( a <> nil ) then begin
        enOrden (a^.hi);
        writeln (a^.dato.patente);
        writeln('Marca: ', a^.dato.marca);
        enOrden (a^.hd);
    end;
end;

//Queda al revés de cómo se ingresan los datos
procedure agregarAdelante (var pri: lista; dato: infoAuto);
var
     aux: lista;
begin
     new (aux);
     aux^.dato := dato;
     aux^.sig := pri;
     pri := aux;
end;

procedure inicializarVector (var v:vector);
var
    i:integer;
begin 
    for i:= anioInicio to anioFin do
        v[i]:=nil;
end;
procedure crearVectorDeListas(var v: vector; a:arbol);
begin
    if (a <> nil) then begin //le puse if pero por la recursión(??????) creo que me falta avanzar
        agregarAdelante(v[a^.dato.anioFab],a^.dato);
        crearVectorDeListas(v,a^.HI);
        crearVectorDeListas(v,a^.HD);
    end;
end;

procedure ImprimirLista(l:lista);
begin
    while (l <> nil) do begin
    	writeln('PATENTE: ',l^.dato.patente);
    	writeln('ANIO DE FABRICACION: ',l^.dato.anioFab);
    	writeln('MARCA: ',l^.dato.marca);
    	writeln('MODELO ',l^.dato.modelo);
    	writeln('-----------------------------');
	    l:=l^.sig;
	end;
end;

procedure ImprimirVector (v:vector);
var
	i:integer;
begin
	for i:=anioInicio to anioFin  do begin
	    writeln;
	    writeln;
	    writeln('----VECTOR en ',i,'----');
	    ImprimirLista(v[i]);
	    readln;
	end;
end;

function buscarPatente(a : arbol; pat: integer) : integer;
begin
  if(a <> nil) then
    if(pat = a^.dato.patente) then
      buscarPatente := a^.dato.anioFab
    else
      if(pat < a^.dato.patente) then
        buscarPatente := buscarPatente(a^.hi,pat)
      else
        buscarPatente := buscarPatente(a^.hd,pat)
  else
    buscarPatente := fin;
end;
//-------PROGRAMA PRINCIPAL----------
var
    a:arbol;
    cantAutos:integer;
    marcaPrueba:cadena30;
    v:vector;
    patenteABuscar: integer;
    esDelAnio:rangoFab;
begin
    randomize;
    cantAutos:=0;
    generarArbol(a);
    enOrden(a);
    write('Marca de prueba:');
    readln(marcaPrueba);
    calcularCantidad(a, marcaPrueba, cantAutos);
    writeln('cantidad de autos de marca ', marcaPrueba,' es ', cantAutos);
    inicializarVector(v);
    crearVectorDeListas(v,a);
    write('__VECTOR DE LISTAS___');
    ImprimirVector(v);
    write('Patente a buscar, si retorna -1 es que no existe:');
    readln(patenteABuscar);
    write('Año de fabricación para dicha patente:',buscarPatente(a,patenteABuscar));
end.
