program E03P5;
const
	dimf = 10;
type
	rango = 1..dimf;

	producto = record
		codigo: integer;
		rubro: rango;
		stock: integer;
		precio: real;
		end;
	
	productoA = record
		codigo: integer;
		stock: integer;
		precio: real;
		end;
	
	arbol = ^nodo;
	
	nodo = record
		dato: productoA;
		hi: arbol;
		hd: arbol;
		end;
	
	v_productos = array[rango] of arbol;

procedure inicializarVector(var v:v_productos);
var
	i: rango;
begin
	for i:=1 to dimf do
		v[i] := nil;
end;

procedure leerProducto(var p:producto);
begin
	with p do
		begin
			writeln('Ingrese el codigo del producto');
			readln(codigo);
			if (codigo <> -1) then
				begin
					writeln('Ingrese el numero de rubro del producto');
					readln(rubro);
					writeln('Ingrese el stock del producto');
					readln(stock);
					writeln('Ingrese el precio unitario del producto');
					readln(precio);
				end;
		end;
end;

procedure armarArbol(var a:arbol; p:producto);
begin
	if (a = nil) then
		begin
			new(a);
			a^.dato.codigo:= p.codigo;
			a^.dato.stock := p.stock;
			a^.dato.precio := p.precio;
			a^.hi := nil;
			a^.hd := nil;
		end
	else
		begin
			if (p.codigo <= a^.dato.codigo) then
				armarArbol(a^.hi, p)
			else
				armarArbol(a^.hd, p);
		end;
end;


procedure cargarVector(var v:v_productos; var a:arbol);
var
	p:producto;
begin
	leerProducto(p);
	writeln;
	while (p.codigo <> -1) do
		begin
			armarArbol(v[p.rubro], p);
			leerProducto(p);
			writeln;
		end;
end;

//Para Imprimir el vector de arboles
procedure enOrden(a:arbol);
begin
	if (a <> nil) then
		begin
			enOrden(a^.hi);
			writeln(a^.dato.codigo);
			writeln(a^.dato.stock);
			writeln(a^.dato.precio:0:2);
			writeln;
			enOrden(a^.hd);
		end;
end;

procedure imprimirVector(v:v_productos);
var
	i:rango;
begin
	for i:= 1 to dimf do
		begin
			writeln('Rubro ', i);
			enOrden(v[i]);
			writeln;
		end;
end;

function cumple(rubro:integer):boolean;
begin
	if (rubro >= 1) and (rubro <= 10) then
		cumple := true
	else
		cumple := false;
end;

function buscar(a:arbol; codigo:integer):boolean;
begin
	if (a <> nil) then
		begin
			if (codigo = a^.dato.codigo) then
				buscar := true
			else if (codigo < a^.dato.codigo) then
				buscar:= buscar(a^.hi, codigo)
			else
				buscar := buscar(a^.hd, codigo);
		end
	else
		buscar := false;
end;

procedure buscarmaximo(a:arbol);
begin
	if(a <> nil) then
		begin
			if (a^.hd = nil) then
				begin
					writeln('Codigo maximo');
					writeln(a^.dato.codigo);
					writeln('Stock del codigo maximo');
					writeln(a^.dato.stock);
				end;
			buscarmaximo(a^.hd);
		end;
end;

procedure imprimirMaxCod(v:v_productos);
var
	i: rango;
begin
	for i:=1 to dimf do
		begin
			writeln('Rubro ', i);
			buscarmaximo(v[i]);
			writeln;
		end;
end;

function buscarEntreCodigos(a:arbol; cod1:integer; cod2:integer):integer;
begin
	if (a <> nil) then
		begin
			if (a^.dato.codigo > cod1) and (a^.dato.codigo < cod2) then
				buscarEntreCodigos := 1 + buscarEntreCodigos(a^.hi, cod1, cod2) + buscarEntreCodigos(a^.hd, cod1, cod2);
		end
	else
		buscarEntreCodigos := 0;
end;

procedure cantEntreCodigos(v:v_productos; cod1, cod2: integer);
var
	i:rango;
begin
	for i:=1 to dimf do
		begin
			writeln('Rubro ', i);
			writeln('Cantidad de codigos de productos entre ', cod1, ' y ', cod2, ' : ', buscarEntreCodigos(v[i], cod1, cod2));
			writeln;
		end;
end;

var
	v: v_productos;
	a: arbol;
	rubro, codigo: integer;
	cod1, cod2 :integer;
begin
	writeln('Inciso A--------------------------------------------------------');
	inicializarVector(v);
	cargarVector(v,a);
	imprimirVector(v);
	
	writeln('Inciso B--------------------------------------------------------');
	writeln('Ingrese un rubro para buscar un codigo');
	readln(rubro);
	while (cumple(rubro) = false) do
		begin
			writeln('El rubro ingresado no existe, ingrese nuevamente');
			readln(rubro);
		end;
	if (cumple(rubro) = true) then
		begin
			writeln('Ingrese un codigo de producto');
			readln(codigo);
			if (buscar(v[rubro], codigo) = true) then
				writeln('El codigo ingresado se encuentra en el rubro ', rubro)
			else
				writeln('El codigo ingresado no se encuentra en el rubro ', rubro);
		end;
		
	writeln('Inciso C--------------------------------------------------------');
	imprimirMaxCod(v);
	
	writeln('Inciso D--------------------------------------------------------');
	writeln('Ingrese 2 codigos (El codigo 2 tiene que ser mayor que 1)');
	writeln('Codigo 1');
	readln(cod1);
	writeln('Codigo 2');
	readln(cod2);
	if (cod1 > cod2) then
		writeln('El codigo 1 es mayor al 2')
	else
		cantEntreCodigos(v, cod1, cod2);
end.
