// Carga un arbol EN FUNCION DE OTRO SIN REPETIR DATOS, SI YA EXISTE sólo se SUMAN/ACTUALIZAN LAS CANTIDADES DE SUS CAMPOS

	procedure cargarArbol_EnFuncionDeOtro(var a2: arbol_dos; a1: arbol_uno);	// El nuevo arbol recibe el nodo y lo añade ordenado
		var																		// Si ya exite, solo actualizo campos
			aux: arbol_dos;
		begin
			if (a2 = nil) then begin
				new(aux);
				aux^.dato.cod:=a1^.dato.cod;
				aux^.dato.cant:=a1^.dato.cant;
				aux^.HI:=nil;
				aux^.HD:=nil;
				a2:=aux;
				end
				else begin
					if (a1^.dato.cod < a2^.dato.cod) then
						cargarArbol_EnFuncionDeOtro(a2^.HI, a1)
						else begin
							if (a2^.dato.cod = a1^.dato.cod) then
								a2^.dato.cant:= a2^.dato.cant + a1^.dato.cant // Actualizo el DATO del campo
								else
									cargarArbol_EnFuncionDeOtro(a2^.HD, a1);
							end;
					end;
			end;
	procedure recorrerArbol(A1: arbol_uno; var A2: arbol_dos);	// Se recorre el primer arbol, original
		begin
			if (A1 <> nil) then begin
				recorrerArbol(A1^.HI, A2);
				cargarArbol_EnFuncionDeOtro(A2, A1);			// Paso el nodo al nuevo arbol
				recorrerArbol(A1^.HD, A2);
				end;
			end;
	begin
		a1:= nil;
		a2:= nil;
		// leerVentas(A1);	{ opcional }
		recorrerArbol(A1, A2);
		end;