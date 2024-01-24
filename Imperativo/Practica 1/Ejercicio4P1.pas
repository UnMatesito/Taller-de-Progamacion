program E04P1;
const
	dimfR = 8;
	dimfP = 30;
type
	producto = record
		codigo : integer;
		precio : real;
		end;
	
	lista = ^nodo;
	
	nodo = record
		dato: producto;
		sig: lista;
		end;
	
	v_productos = array[1..dimfR] of lista;
	
	v_rubro3 = array[1..dimfP] of producto;
	
procedure leerProducto(var p: producto);
begin
	with p do
		begin
			writeln('Ingrese el codigo del producto');
			readln(codigo);
			writeln('Ingrese el precio del producto');
			readln(precio);
		end;
end;

procedure insertarOrdenado(var l:lista; p: producto);
var
	nuevo, act, ant:lista;
begin
	new(nuevo);
	nuevo^.dato := p;
	act := l;
	ant := l;
	while (act <> nil) and (act^.dato.codigo < nuevo^.dato.codigo) do
		begin
			ant := act;
			act := act^.sig;
		end;
	if (ant = act) then
		l := nuevo
	else
		begin
			ant^.sig := nuevo;
			nuevo^.sig := act;
		end;
end;

procedure cargarVector(var v:v_productos);
var
	l:lista; p: producto; i:integer;
begin
	l := nil;
	for i:= 1 to dimfR do
		begin
			writeln('Rubro: ', i);
			leerProducto(p);
			writeln;
			while (p.precio <> 0) do
				begin
					insertarOrdenado(l, p);
					v[i]:= l;
					leerProducto(p);
					writeln;
				end;
		end;
end;

procedure imprimirCod(v:v_productos);
var
	i:integer;
begin
	for i:=1 to dimfR do
		begin
			while (v[i] <> nil) do
				begin
					writeln('Rubro: ', i);
					writeln(v[i]^.dato.codigo);
					v[i] := v[i]^.sig;
				end;
		end;
end;





var
	v:v_productos;
	v2:v_rubro3;
begin
	cargarVector(v);
	imprimirCod(v);
	cargarVector2(v, v2);
end.
