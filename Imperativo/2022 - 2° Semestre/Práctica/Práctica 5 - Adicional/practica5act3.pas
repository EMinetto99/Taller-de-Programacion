program practica5act3;
const
	rubros = 10;
type
	rangoRubro = 1..rubros;
	producto = record
		codigo: integer;
		rubro: rangoRubro;
		stock: integer;
		precio: real;
		end;

	arbol = ^nodoA;
	nodoA = record
		dato: producto;
		HI: arbol;
		HD: arbol;
		end;
	vec_rubros = array[1..rubros] of arbol;
	
	regMayores = record
		codigo: integer;
		stock: integer;
		end;
	vec_mayores = array[1..rubros] of regMayores;
	vec_entre_num = array[1..rubros] of integer;
procedure inicializarVector(var v: vec_rubros);
	var
		i: integer;
	begin
		for i := 1 to rubros do
			v[i] := nil;
		end;
procedure leerProducto(var p: producto);
	begin
		write('Codigo de producto (-1 para terminar): ');
		readln(p.codigo);
		if (p.codigo <> -1) then begin
			write('Rubro: ');
			readln(p.rubro);
			p.stock := random(100)+1;
			writeln('Stock: ',p.stock);
			p.precio := random(10000)+1;
			writeln('Precio unitario: ',p.precio:6:2);
			end;
		writeln;
		end;
procedure almacenar(var v: vec_rubros; p: producto);
	procedure agregarArbol(var a: arbol; p: producto);
		begin
			if (a = nil) then begin
				new(a);
				a^.dato := p;
				a^.HI := nil;
				a^.HD := nil;
				end
				else
					if (p.codigo < a^.dato.codigo) then
						agregarArbol(a^.HI, p)
						else
							agregarArbol(a^.HD, p);
			end;
	var
		index: integer;
	begin
		index := p.rubro;
		agregarArbol(v[index], p);
		end;
function buscarProducto(v: vec_rubros; r, cod: integer): boolean;
	function buscar(a: arbol; cod: integer): boolean;
		begin
			if (a = nil) then
				buscar := false
				else
					if (a^.dato.codigo = cod) then
						buscar := true
						else
							if (cod < a^.dato.codigo) then
								buscar := buscar(a^.HI, cod)
								else
									buscar := buscar(a^.HD, cod);
		end;
	begin
		buscarProducto := buscar(v[r], cod);
		end;
procedure mayoresCodigos(vr: vec_rubros; var vm: vec_mayores);
	function buscarMayor(a: arbol): producto;
		begin
			if (a^.HD = nil) then
				buscarMayor := a^.dato
				else
					buscarMayor := buscarMayor(a^.HD);
			end;
	var
		i: integer;
		mayor: producto;
	begin
		for i := 1 to rubros do begin
			if (vr[i] <> nil) then begin
				mayor := buscarMayor(vr[i]);
				vm[i].codigo := mayor.codigo;
				vm[i].stock := mayor.stock;
				end
				else begin
					vm[i].codigo := 0;
					vm[i].stock := 0;
					end;
			end;
		end;
procedure busquedaProductosEntreNumeros(vr: vec_rubros; var ve: vec_entre_num; num1, num2: integer);
	procedure buscarEntreNumeros(a: arbol; valorINF, valorSUP: integer; var cant: integer);
		begin
			if (a <> nil) then
				if(a^.dato.codigo > valorINF) and (a^.dato.codigo < valorSUP) then begin
					buscarEntreNumeros(a^.HI, valorINF, valorSUP, cant);
					cant := cant + 1;
					buscarEntreNumeros(a^.HD, valorINF, valorSUP, cant);
					end
					else begin
						if (a^.dato.codigo > valorINF) then
							buscarEntreNumeros(a^.HI, valorINF, valorSUP, cant)
							else
								if(a^.dato.codigo < valorSUP) then
									buscarEntreNumeros(a^.HD, valorINF, valorSUP, cant);
						end;
			end;
	var
		i, cant: integer;
	begin
		for i := 1 to rubros do begin
			cant := 0;
			buscarEntreNumeros(vr[i], num1, num2, cant);
			ve[i] := cant;
			end;
		end;
var
	p: producto;
	vr: vec_rubros;
	vm: vec_mayores;
	ve: vec_entre_num;
	existe: boolean;
	i, num1, num2: integer;
	rubro, codigo: integer;
begin
	Randomize;
	inicializarVector(vr);
	leerProducto(p);
	while (p.codigo <> -1) do begin
		almacenar(vr, p);
		leerProducto(p);
		end;
	writeln('==== BUSQUEDA DE PRODUCTO ====');
	write('Ingrese un rubro a buscar en la estructura (1 a ',rubros,'): ');
	readln(rubro);
	write('Ingrese un codigo: ');
	readln(codigo);
	existe := buscarProducto(vr, rubro, codigo);
	if (existe) then
		writeln('El producto codigo "',codigo,'" existe!!')
		else
			writeln('El producto "',codigo,'"" no existe en la estructura.');
	writeln;
	mayoresCodigos(vr, vm);
	for i := 1 to rubros do begin
		writeln('======= RUBRO ',i,' =======');
		writeln('Codigo: ',vm[i].codigo);
		writeln('Stock: ',vm[i].stock);
		writeln;
		end;
	writeln;
	writeln('==== BUSQUEDA ENTRE DOS CODIGOS ====');
	write('Ingrese el PRIMER numero a buscar entre codigos: ');
	readln(num1);
	write('Ingrese el SEGUNDO numero a buscar entre codigos: ');
	readln(num2);
	writeln;
	busquedaProductosEntreNumeros(vr, ve, num1, num2);
	for i := 1 to rubros do begin
		writeln('======= RUBRO ',i,' =======');
		writeln('Cantidad de productos entre dos codigos: ',ve[i]);
		writeln;
		end;
	readln;
end.