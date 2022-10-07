
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

program repaso4;

type
rango= 2010..2018;

auto=record
	patente:integer;
	anioFabric:rango;
	marca:string[50];
	modelo:string[50];
	end;

arbol =^nodo;
nodo= record
 dato: auto;
 HI: arbol;
 HD:arbol;
 end;
 
 lista=^nodo1;
 nodo1 = record
   dato:auto;
   sig:lista;
   end;
 

vector= array[rango] of lista;
vector1= array[rango] of lista;


//Procesos

procedure incializarVector(var v:vector);
var
i:rango;
begin
  for i:=2010 to 2018 do
     v[i]:=nil;
  
end;

procedure incializarVector(var ult:vector1);
var
i:rango;
begin
  for i:=2010 to 2018 do
     ult[i]:=nil;
  
end;

procedure leerAuto(var a:auto);
begin
with a do begin
writeln('Ingrese patente o -1 para finalizar');
readln(patente);
if (patente <>-1) then begin
writeln('Ingrese anio d efabricacion');
readln(anioFabric);
writeln('Ingrese marca');
readln(marca);
writeln('Ingrese modelo del auto');
readln(modelo);
end;
end;
end;


procedure insertarArbol(var a :arbol; unAuto:auto);
begin
if (a =nil) then begin
	new(a);
	a^.dato:= unAuto;
	a^.HD:= nil;
	a^.HI:= nil;
	end
else
begin
 
	if (a^.dato.patente < unAuto.patente) then
		insertarArbol(a^.HD,unAuto)
	else
		insertarArbol(a^.HI,unAuto);
end;
	
end;

procedure cargarArbol(var a:arbol);
var
unAuto:auto;
begin
leerAuto(unAuto);
while (unAuto.patente <>-1) do begin
	insertarArbol(a,unAuto);
	leerAuto(unAuto);
end;
end;

{Contenga un módulo que recibe el árbol generado en a) y una marca y devuelva la
cantidad de autos de dicha marca que posee la agencia. Mostrar el resultado.}


function stockPorMarca(a:arbol; unaMarca:string):integer;
begin
	if (a = nil) or (a^.dato.marca <> unaMarca) then
		stockPorMarca:= 0
    else 
           stockPorMarca:= 1;
    stockPorMarca:= (stockPorMarca(a,unaMarca) + stockPorMarca(a^.HI, unaMarca)+ stockPorMarca(a^.HD,unamarca));
    end;
            
    
    
{Contenga un módulo que reciba el árbol generado en a) y retorne una estructura con la
información de los autos agrupados por año de fabricación.}

procedure AgregarAtras(var l:lista; unAuto:auto; var ult:lista);
var
nue:lista;
begin
new(nue);
nue^.dato:=unAuto;
nue^.sig:=nil;
if (l=nil) then
  l:=nue
 else
  ult^.sig:=nue;
ult:=nue;

end;

procedure agruparxAnio(a:arbol;var v:vector;ultV:vector1);//
begin
 if(a<>nil) then begin
	AgregarAtras(v[a^.dato.anioFabric],a^.dato,ultV[a^.dato.anioFabric]);
	agruparxAnio(a^.HI,v,ultV);
	agruparxAnio(a^.HD,v,ultV);
end;
end;

{d. Contenga un módulo que reciba el árbol generado en a) y una patente y devuelva el
año de fabricación del auto con dicha patente. Mostrar el resultado.}

function devuelveAnio(a:arbol; p:integer):integer;
	begin
		if (a=nil) then
		   devuelveAnio:=0
		 else
		     
            if ( a^.dato.patente = p ) then
				devuelveAnio:=a^.dato.anioFabric
            else
               if ( a^.dato.patente > p ) then
                    devuelveAnio:= devuelveAnio(a^.HI, p)
               else
                    devuelveAnio:= devuelveAnio(a^.HD, p);
	
	end;

//Prog principal
var
a:arbol;
stock:integer;
unaMarca:string;
v:vector;
ultV:vector1;
unaPatente:integer;
begin
a:=nil;
cargarArbol(a);
writeln('Ingrese una marca para calcular cantidad de autos ');
readln(unaMarca);
writeln(stockPorMarca(a,unaMarca));
inicializarVector(v);
inicializarVector(ultV);
agruparxAnio(a,v,ultV);
writeln('Ingrese patente para buscar anio d efabricacion');
readln(unaPatente);
writeln(devuelveAnio(a,unaPatente));


end.
