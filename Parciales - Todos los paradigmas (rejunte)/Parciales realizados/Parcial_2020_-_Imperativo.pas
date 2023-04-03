program parcial2020Imperativo;
const
	sucursales = 5;
	ventas = 200;
type
	info_ventas = record
		codigo: integer;
		cantVendida: integer;
		montoTotal: real;
		end;

	vec_sucursales = array [1..sucursales] of regVentas;
	vector = array [1..ventas] of info_ventas;

	regVentas = record
		dimL: integer;
		vec_ventas: vector;
		end;
procedure inicializarDimension(var v: vec_sucursales);
	begin
		for i := 1 to sucursales do
			v[i].dimL := 0;
		end;
procedure leerInformacion(var i: info_ventas);
	begin
		write('Codigo de producto: ');
		readln(i.codigo);
		if (i.codigo <> -1) then begin
			write('Cantidad vendida: ');
			readln(i.cantVendida);
			write('Monto de la venta: ');
			readln(i.montoTotal);
			end;
		end;
procedure almacenar(var v: vec_sucursales; index: integer; info: info_ventas);
	var
		i, j, p, item: integer;
	begin
		for i := 1 to v[index].dimL-1 do begin		{Recorre buscando el mínimo elemento en cada pasada con respecto al puntero "p" para el posterior intercambio}
			p := i;
			for j := i+1 to v[index].dimL do		{Busca el mínimo elemento}
				if v[index].vec_ventas[ j ] < v[index].vec_ventas[ p ] then				{Ordena de mayor a menor}
					p := j;
			{ intercambia v[i] y v[p] }
			item := v[index].vec_ventas[ p ];
			v[index].vec_ventas[ p ] := v[index].vec_ventas[ i ];
			v[index].vec_ventas[ i ] := item;
			end;
		end;
var
	vs: vec_sucursales;
	info: info_ventas;
begin
	inicializarDimension(vs);
	for i := 1 to sucursales do begin
		leerInformacion(info);
		if (info.codigo <> -1) and (vs[i].dimL < ventas) then begin
			almacenar(vs, i, info);
			if (vs[i].dimL < ventas) then
				leerInformacion(info);
			end;
		end;
	readln;
end.