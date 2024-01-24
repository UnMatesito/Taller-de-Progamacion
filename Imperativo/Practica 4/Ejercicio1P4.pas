program E01P4;
type
	venta = record
		codVenta: integer;
		codProducto: integer;
		cant: integer;
		precio: real;
		end;
		
	lista = ^nodoVentas;
	
	nodoVentas = record
		dato: venta;
		sig: lista;
		end;
		
	producto = record
		codigo: integer;
		cantTotal: integer;
		monto: real;
		end;
	
	arbol = ^nodoA;
	
	nodoA = record
		dato: producto;
		hi: arbol;
		hd: arbol;
		end;
	
procedure leerVenta(var v:venta);
begin
	with v do
		begin
			writeln('Ingrese el codigo de la venta');
			readln(codVenta);
			if (codVenta <> -1) then
				begin
					writeln('Ingrese el codigo del producto');
					readln(codProducto);
					writeln('Ingrese la cantidad vendida');
					readln(cant);
					writeln('Ingrese el precio unitario del producto');
					readln(precio);
				end;
		end;
end;

procedure agregar(var a: arbol; v:venta);
begin
	if (a = nil) then
		begin
			new(a);
			a^.dato.codigo := v.codProducto;
			a^.dato.cantTotal := v.cant;
			a^.dato.monto := v.precio * v.cant;
		end
	else
		begin
			if (a^.dato.codigo = v.codProducto) then
				begin
					a^.dato.cantTotal := a^.dato.cantTotal + v.cant;
					a^.dato.monto := a^.dato.monto + (v.precio * v.cant);
				end
			else if (a^.dato.codigo <= v.codProducto) then
				agregar(a^.hi, v)
			else
				agregar(a^.hd, v);
		end;
end;

procedure cargarArbol(var a:arbol);
var
	v:venta;
begin
	leerVenta(v);
	writeln;
	while (v.codVenta <> -1) do
		begin
			agregar(a, v);
			leerVenta(v);
			writeln;
		end;
end;

procedure imprimirEnOrden(a:arbol);
begin
	if (a <> nil) then
		begin
			imprimirEnOrden(a^.hi);
			writeln('Codigo de Producto');
			writeln(a^.dato.codigo);
			writeln('Cantidad total de prodcutos');
			writeln(a^.dato.cantTotal);
			writeln('Monto total Vendido');
			writeln(a^.dato.monto:0:2);
			writeln;
			imprimirEnOrden(a^.hd);
		end;
end;


procedure codMaxUnidades(a:arbol; var codMax, max:integer);
begin
	if (a <> nil) then
		begin
			if (a^.dato.cantTotal > max) then
				begin
					max := a^.dato.cantTotal;
					codMax := a^.dato.codigo;
				end;
			codMaxUnidades(a^.hi, codMax, max);
			codMaxUnidades(a^.hd, codMax, max);
		end;
end;

function buscarCodigos(a: arbol; cod:integer):integer;
begin
	if (a <> nil) then
		begin
			if (a^.dato.codigo < cod) then
				buscarCodigos := 1 + buscarCodigos(a^.hi, cod) + buscarCodigos(a^.hd, cod)
			else
				buscarCodigos := 0;
		end
	else
		buscarCodigos := 0;
end;

function buscarEntreCodigos(a: arbol; cod1, cod2: integer):real;
begin
	if (a <> nil) then
		begin
			if (a^.dato.codigo > cod1) and (a^.dato.codigo < cod2) then
				buscarEntreCodigos := a^.dato.monto + buscarEntreCodigos(a^.hi, cod1, cod2) + buscarEntreCodigos(a^.hd, cod1, cod2);
		end
	else
		buscarEntreCodigos := 0;
end;



var
	a: arbol;
	codMax, max, cod, cod1, cod2: integer;
begin
	//Punto A
	a := nil;
	cargarArbol(a);
	//Punto B
	writeln('Punto B --------------------------------------------');
	imprimirEnOrden(a);
	//Punto C
	writeln('Punto C --------------------------------------------');
	max := -1;
	codMaxUnidades(a, codMax, max);
	writeln('El codigo de Producto que mas unidades vendio es: ', codmax);
	//Punto D
	writeln('Punto D --------------------------------------------');
	writeln('Ingrese un codigo de producto');
	readln(cod);
	buscarCodigos(a, cod);
	writeln('Cantidad de codigos de producto menores a ', cod, ' : ', buscarCodigos(a, cod));
	//Punto E
	writeln('Punto E --------------------------------------------');
	writeln('Ingrese 2 codigos de producto (el codigo 2 tiene que ser mayor al 1)');
	writeln('Codigo 1');
	readln(cod1);
	writeln('Codigo 2');
	readln(cod2);
	if (cod1 > cod2) then
		begin
		writeln('Ingrese nuevamente');
		writeln('Codigo 1');
		readln(cod1);
		writeln('Codigo 2');
		readln(cod2);
		end
	else
		writeln('El monto total entre los 2 codigos es: ', buscarEntreCodigos(a, cod1, cod2):0:2);
end.
