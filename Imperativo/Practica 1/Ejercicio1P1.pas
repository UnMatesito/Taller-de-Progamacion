program E01P1;
const
	dimf = 50;
type
	s_dias = 0..31;
	
	s_codigos = 1..15;
	
	s_cantidad = 1..99;
	
	venta = record
		dia : s_dias;
		codigo : s_codigos;
		cant : s_cantidad;
		end;
	
	v_ventas = array[1..dimf] of venta;
	
	
procedure leerventa(var v:venta);
var
	codigoR : s_codigos;
begin
	with v do 
		begin
			writeln('Ingrese el dia de la venta');
			readln(dia);
			if (v.dia <> 0) then
				begin
					Randomize;
					codigoR := random(16)+ 1;
					writeln('Codigo del producto comprado');
					writeln(codigoR);
					codigo := codigoR;
					writeln('Ingrese la cantidad de productos comprados');
					readln(cant);
				end;
		end;
end;

procedure cargarVector (var v:v_ventas; var diml: integer);
var
	 ven: venta;
begin
	diml := 0;
	leerventa(ven);
	while (diml < dimf) and (ven.dia <> 0) do
		begin
			diml := diml + 1;
			v[diml] := ven;
			leerventa(ven);
		end;
end;

procedure mostrarContenido(v:v_ventas; diml:integer);
var
	i: integer;
begin
	for i:= 1 to diml do
		begin
			writeln('Dia');
			writeln(v[i].dia);
			writeln('Codigo del producto');
			writeln(v[i].codigo);
			writeln('Cantidad');
			writeln(v[i].cant);
		end;
end;

procedure ordenarVector(var v:v_ventas; diml: integer);
var
	i, j, pos: s_codigos; item : integer;
begin
	for i:= 1 to (diml-1) do
		begin
			pos := i;
			for j:= i+1 to diml do
				if (v[j].codigo < v[pos].codigo) then
					pos := j;
			item := v[pos].codigo;
			v[pos].codigo := v[i].codigo;
			v[i].codigo := item;
		end;
end;

procedure eliminarCodigo(var v:v_ventas; var diml,codigoEliminar:integer);
var
	contador, pos, i: integer;
begin
	pos := 1;
	while (pos <= diml) and (v[pos].codigo < codigoEliminar) do
		pos := pos + 1;
	contador := 0;
	while(pos <= diml) and (v[pos].codigo = codigoEliminar) do
		begin
			pos := pos + 1;
			contador := contador + 1;
		end;
	for i:= pos to diml do
		v[i - contador] := v[i];
	diml := diml - contador;
end;

procedure cantotalProductosPar (v:v_ventas; diml:integer);
var
	codigoActual, cantotal, i: integer;
begin
	for i:= 1 to diml do
		begin
			if (v[i].codigo mod 2 = 0) then
				begin
					codigoActual := v[i].codigo;
					cantotal := 0;
					if (v[i].codigo mod 2 = 0) and (codigoActual = v[i].codigo) then
						cantotal := cantotal + v[i].cant;
				end;
		end;
end;


var
	v:v_ventas;
	diml,codigoEliminar: integer;
begin
	//punto A
	cargarVector(v, diml);
	//punto B
	writeln('-------------------------------------------------------------------------');
	writeln('Vector desordenado');
	mostrarContenido(v, diml);
	//punto C
	ordenarVector(v, diml);
	//punto D
	writeln('-------------------------------------------------------------------------');
	writeln('Vector Ordenado');
	mostrarContenido(v, diml);
	//punto E
	writeln('Ingrese un codigo de producto a eliminar');
	read(codigoEliminar);
	eliminarCodigo(v, diml, codigoEliminar);
	//punto F
	writeln('-------------------------------------------------------------------------');
	writeln('Vector despues de haber eliminado el codigo ', codigoEliminar);
	mostrarContenido(v, diml);
	//punto G
	writeln('-------------------------------------------------------------------------');
	cantotalProductosPar(v, diml);
	//punto H
	writeln('Vector ordenado con codigo par');
end.
