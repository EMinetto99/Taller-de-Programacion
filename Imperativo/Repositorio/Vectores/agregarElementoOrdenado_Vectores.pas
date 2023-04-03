// Insertar un elemento en un vector ordenado de menor a mayor

procedure insertarOrdenado(var v:vector; var dimL: integer; dato: tipo_de_Dato);    // var exito: boolean (boolean de confirmacion)

    procedure insertar(var v:vector; var dimL:integer; pos: integer; elem: integer);
        var
            i: indice;
        begin
            for i:= dimL downto pos do 
                v[i + 1] := v[i];
            v[pos] := elem; 
            dimL := dimL + 1;
        end;
    function buscarPosicion(dato: integer; v: vector; dimL: integer): integer;
        var
            pos: integer;
        begin
            pos := 1; 
            while (pos <= dimL) and (dato > v[pos]) do
                pos := pos + 1;
            buscarPosicion := pos;
        end;

    var
        pos: integer;
    begin
        // exito := false;
        if (dimL < dimF) then begin
            pos := buscarPosicion(dato, v, dimL);
            insertar(v, dimL, pos, dato);
        //  exito := true;
            end;
        end;