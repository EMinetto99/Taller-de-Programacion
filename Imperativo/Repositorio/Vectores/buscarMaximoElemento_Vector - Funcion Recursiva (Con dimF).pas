function buscarMaximoVector(v: vector): integer;
	function buscarMaximo_VR(v: vector; i, max: integer): integer;
		begin
			if (i < dimF) then begin
				if (v[i]>max) then
					max:=v[i];
				i:=i+1;
				buscarMaximo_VR:=buscarMaximo_VR(v, i, max);
				end
				else
					buscarMaximo_VR:=max;
			end;
	var
		iterador, max: integer;
	begin
		iterador:=0;
		max:=-9999;
		buscarMaximoVector:=buscarMaximo_VR(v, iterador, max);
		end;

// PROGRAMA PRINCIPAL
var mayor: integer;
begin
	mayor:= buscarMaximoVector(v); // Funcion para buscar el mayor elemento
end.