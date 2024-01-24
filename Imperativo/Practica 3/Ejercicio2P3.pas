program E02P3;
type
	s_dias = 1..31;
	s_meses = 1..12;
	
	fecha = record
		dia : s_dias;
		mes: s_meses;
		end;
	
	venta = record
		codigo: integer;
		fecha: fecha;
		cant: integer;
		end;
	
	arbol1 = ^nodo1;
	
	nodo1 = record
		dato: venta;
		hi: arbol1;
		hd: arbol1;
		end;
	
	producto = record
		codigo : integer;
		cant: integer;
		end;
	
	arbol2 = ^nodo2;
	
	nodo2 = record
		dato: producto;
		hi: arbol2;
		hd: arbol2;
		end;

procedure leerVenta(var v:venta);
begin
	with v do
		begin
			writeln('Ingrese el codigo del producto vendido');
			readln(codigo);
			if (codigo <> 0) then
				begin
					writeln('Ingrese el dia de la venta');
					readln(fecha.dia);
					writeln('Ingrese el mes de la venta');
					readln(fecha.mes);
					writeln('Ingrese la cantidad vendida');
					readln(cant);
				end;
		end;
end;

procedure agregarA1(var a1:arbol1; v:venta);
begin
	if (a1 = nil) then
		begin
			new(a1);
			a1^.dato := v;
			a1^.hi := nil;
			a1^.hd := nil;
		end
	else
		begin
			if (v.codigo <= a1^.dato.codigo) then
				agregarA1(a1^.hi, v)
			else
				agregarA1(a1^.hd, v);
		end;
end;

procedure agregarA2(var a2:arbol2; v: venta);
begin
	if (a2 = nil) then
		begin
			new(a2);
			a2^.dato.codigo := v.codigo;
			a2^.dato.cant := v.cant;
			a2^.hi := nil;
			a2^.hd := nil;
		end
	else
		begin
			if (v.codigo = a2^.dato.codigo) then
				a2^.dato.cant := a2^.dato.cant + v.cant
			else if (v.codigo <= a2^.dato.codigo) then
				agregarA2(a2^.hi, v)
			else
				agregarA2(a2^.hd, v);
		end;
end;

procedure cargarArbol(var a1: arbol1; var a2:arbol2);
var
	v:venta;
begin
	leerVenta(v);
	writeln;
	while (v.codigo <> 0) do
		begin
			agregarA1(a1, v);
			agregarA2(a2, v);
			leerVenta(v);
			writeln;
		end;
end;
//modificar el agregar para lograr la solucion

procedure imprimirArbol2(a2: arbol2);
begin
	if (a2 <> nil) then
		begin
			imprimirArbol2(a2^.hi);
			writeln(a2^.dato.codigo);
			writeln(a2^.dato.cant);
			imprimirArbol2(a2^.hd);
		end;
end;

procedure cantTotalA1(a1: arbol1; codigo:integer; var total: integer);
begin
	if (a1 <> nil) then
		begin
			if (a1^.dato.codigo = codigo) then
					total := total + a1^.dato.cant
			else if (codigo > a1^.dato.codigo) then
				cantTotalA1(a1^.hd , codigo, total)
			else
				cantTotalA1(a1^.hi , codigo, total);
		end;
end;

procedure cantTotalA2(a2: arbol2; codigo: integer);
begin
	if (a2 <> nil) then
		begin
			if (a2 = nil) then
				writeln('Codigo de producto no econtrado')
			else if (a2^.dato.codigo = codigo) then
				begin
					writeln('Cantidad total de productos con el codigo ', codigo);
					writeln(a2^.dato.cant);
				end
			else if (codigo < a2^.dato.codigo) then
				cantTotalA2(a2^.hd , codigo)
			else
				cantTotalA2(a2^.hi , codigo);
		end;
end;


var
	a1: arbol1;
	a2: arbol2;
	codigo, total: integer;
begin
	//punto A
	a1 := nil;
	a2 := nil;
	cargarArbol(a1, a2);
	//checkear
	imprimirArbol2(a2);
	//punto B
	writeln('Ingrese un codigo de producto para buscar en el arbol 1');
	readln(codigo);
	total := 0;
	cantTotalA1(a1, codigo, total);
	if (total <> 0) then
		begin
			writeln('Cantidad total de productos con el codigo ', codigo);
			writeln(total);
		end;
	//punto C
	writeln('Ingrese un codigo de producto para buscar en el arbol 2');
	readln(codigo);
	cantTotalA2(a2, codigo);
end.
