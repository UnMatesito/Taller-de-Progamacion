program dfgh;
type
	producto = record
		codigo: integer;
		cant: integer;
		precio: real;
	end;
	
	arbol = ^nodo;
	
	nodo = record
		dato: producto;
		hi: arbol;
		hd: arbol;
	end;

procedure leerProducto(var p:producto);
begin
	with p do
	begin
	writeln('Ingrese el codigo del producto');
	readln(codigo);
	if (codigo <> -1) then
		begin
			writeln('Ingrese la cantidad del producto');
			readln(cant);
			writeln('Ingrese el precio del producto');
			readln(precio);
		end;
	end;
end;

procedure armarArbol(var a:arbol; p:producto);
begin
	if (a = nil) then
		begin
			new(a);
			a^.dato := p;
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

procedure cargarArbol(var a:arbol);
var
	p:producto;
begin
	leerProducto(p);
	while (p.codigo <> -1) do
		begin
			armarArbol(a, p);
			leerProducto(p);
		end;
end;

procedure cantNum(a:arbol; num:integer; var cant:integer);
begin
	if (a <> nil) then
		begin
			cantNum(a^.hi, num, cant);
			if (num = a^.dato.cant) then
				cant := cant + 1;
			cantNum(a^.hd, num, cant);
		end;
end;

function buscarCant(a:arbol; l:lista; cantidad:integer):integer;
begin
	if (a <> nil) then
		begin
			if (l <> nil) do
			begin
				if (cantidad = l^.dato.cant) then
					buscarCant := l^.dato.codigo
				else if (cantidad < l^.dato.codigo) then
					buscarCant := buscarCant(a^.hi, l, cantidad)
				else
					buscarCant := buscarCant(a^.hd, l, cantidad);
			end;
		end
	else
		buscarCant := 0;
end;

var
	a:arbol;
	num, cant:integer;
	cantidad: integer;
begin
	a := nil;
	cargarArbol(a);
	writeln('Numero buscar');
	readln(num);
	cant := 0;
	cantNum(a, num, cant);
	writeln('Cantidad: ', cant);
	writeln('cantidad a buscar');
	readln(cantidad);
	writeln('Codigo del producto: ', buscarCant(a, a^.dato, cantidad));
end.
