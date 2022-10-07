function buscarMaximoVector(v: vector, dimL): integer;
	function buscarMaximo_VR(v: vector; dimL, i, max: integer): integer;
		begin
			if (i < dimL) then begin
				if (v[i]>max) then
					max:=v[i];
				i:=i+1;
				buscarMaximo_VR:=buscarMaximo_VR(v, dimL, i, max);
				end
				else
					buscarMaximo_VR:=max;
			end;
	var
		iterador, max: integer;
	begin
		iterador:=0;
		max:=-9999;
		buscarMaximoVector:=buscarMaximo_VR(v, dimL, iterador, max);
		end;

// PROGRAMA PRINCIPAL
var mayor: integer;
begin
	mayor:= buscarMaximoVector(v, dimL); // Funcion para buscar el mayor elemento
end.