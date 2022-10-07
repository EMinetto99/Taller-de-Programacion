program Sucursales4;
const
	cantSuc=4;
type
	dias=1..31;
	meses=1..12;
	anios=1900..2021;
	rango_suc=0..cantSuc;
	datosFecha=record
		dia: dias;
		mes: meses;
		anio: anios;
		end;
	venta=record
		fecha: datosFecha;
		cod_prod: integer;
		cod_sucursal: rango_suc;
		cantVendidos: integer;
		end;
	lista=^nodo;
	nodo=record
		dato: venta;
		sig: lista;
		end;
	vec_ventas=array[1..cantSuc] of lista;
procedure inicializarVector(var v: vec_ventas);
	var
		i: integer;
	begin
		for i:=1 to cantSuc do
			v[i]:=nil;
	end;
procedure leerVenta(var vd: venta);
	begin
		write('Codigo de sucursal: ');
		readln(vd.cod_sucursal);
		if (vd.cod_sucursal<>0) then begin
			write('Codigo de producto: ');
			readln(vd.cod_prod);
			write('Cantidad vendida: ');
			readln(vd.cantVendidos);
{			writeln('==========================');
			writeln('      Fecha de venta      ');
			write('Dia: ');
			readln(vd.fecha.dia);
			write('Mes: ');
			readln(vd.fecha.mes);
			write('Año: ');
			readln(vd.fecha.anio);
			writeln('==========================');
}			end;
		writeln();
	end;
procedure almacenarOrdenado(var vs: lista; v: venta);
	var
		aux, act, ant: lista;
	begin
		new(aux);
		aux^.dato:=v;
		aux^.sig:=nil;
		act:=vs;
		ant:=vs;
		while (act<>nil) and (act^.dato.cod_prod<v.cod_prod) do begin
			ant:=act;
			act:=act^.sig;
			end;
		if (act=ant) then
			vs:=aux
			else
				ant^.sig:=aux;
		aux^.sig:=act;
	end;
procedure imprimirVentas(v: vec_ventas);
	var
		i: integer;
	begin
		for i:=1 to cantSuc do begin
			write('Pos (',i,') L');
			while (v[i]<>nil) do begin
				write('---> |',v[i]^.dato.cod_prod,'|');
				v[i]:=v[i]^.sig;
				end;
			write('---> [nil]');
			writeln;
			end;
		end;
procedure minimo(var v: vec_ventas; var min: venta);
	var
		i, minAct: integer;
	begin
		min.cod_prod:=9999;
		minAct:=-1;
		for i:=1 to cantSuc do begin
			if (v[i]<>nil) and (v[i]^.dato.cod_prod<=min.cod_prod) then begin
					min:=v[i]^.dato;
					minAct:=i;
					end;
			end;
		if (minAct<>-1) then
			v[minAct]:=v[minAct]^.sig;
	end;
procedure agregarAtras(var l, ult: lista; m: venta);
	var
		aux: lista;
	begin
		new(aux);
		aux^.dato:=m;
		aux^.sig:=nil;
		if (l=nil) then
			l:=aux
			else
				ult^.sig:=aux;
		ult:=aux;
		end;
procedure imprimirLista(L: lista);
	begin
		if (L<>nil) then begin
			write(' L');
			while (L<>nil) do begin
				write('---> |cod: ',L^.dato.cod_prod,'|cantSold: ',L^.dato.cantVendidos,'|');
				L:=L^.sig;
				end;
			writeln;
			end
			else begin
				write('L: nil');
				writeln();
				end;
		end;
procedure mergeListas(var L: lista; v: vec_ventas);
	var
		min, act: venta;
		ult: lista;
	begin
		ult:=nil;
		minimo(v,min);
		while (min.cod<>9999) do begin
			act.cod:=min.cod;
			act.cantVendidos:=0;
			while (min.cod<>9999) and (act.cod=min.cod) do begin
				act.cantVendidos:=act.cantVendidos+min.cantVendidos;
				minimo(v,min);
				end;
			agregarAtras(L,ult,act);
			end;
		end;
var
	vs: vec_ventas;
	vDates: venta;
	PriL: lista;
begin
	PriL:=nil;
	inicializarVector(vs);
	leerVenta(vDates);
	while (vDates.cod_sucursal<>0) do begin
		almacenarOrdenado(vs[vDates.cod_sucursal],vDates);
		leerVenta(vDates);
		end;
	imprimirVentas(vs);
	mergeListas(PriL,vs);
	imprimirLista(PriL);
	readln();
end.