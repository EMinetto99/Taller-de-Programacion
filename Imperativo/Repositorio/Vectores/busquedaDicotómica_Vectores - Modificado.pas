procedure busquedaDicotomica(v: vector; dimL: integer; dato: tipoDeDato; var pos: integer);
	procedure busquedaDicotomica_P2(v: vector; ini, fin, dato: integer; var pos: integer);
		var
			medio: integer;
		begin
			if (ini>fin) then
				pos:=-1
				else begin
					medio:= (ini+fin) div 2;
					if (dato = v[medio]) then
						pos:=medio
						else begin
							if (dato < v[medio]) then
								busquedaDicotomica_P2(v, ini, (medio-1), dato, pos)
								else
									busquedaDicotomica_P2(v, (medio+1), fin, dato, pos);
							end;
					end;
			end;
	var
		ini: integer;
	begin
		ini:=1;
		busquedaDicotomica_P2(v, ini, dimL, dato, pos);
		end;