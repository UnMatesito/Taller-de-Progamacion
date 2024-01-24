program E03P2;
type
	lista = ^nodo;
	
	nodo = record
		dato: integer;
		sig: lista;
		end;

procedure armarNodo(var l:lista; numR:integer);
var
	nuevo: lista;
begin
	new(nuevo);
	nuevo^.dato := numR;
	nuevo^.sig := l;
	l:= nuevo;
end;


	
procedure cargarLista(var l: lista);
var
	numR: integer;
begin
	numR := random(99);
	if (numR <> 0) then
		begin
			writeln('Numero: ', numR);
			armarNodo(l, numR);
			cargarLista(l^.sig);
		end;
end;

procedure actMinimo(l: lista; var min: integer);
begin
	if (l <> nil) then
		begin
			if (l^.dato < min) then
				min := l^.dato;
			actMinimo(l^.sig, min);
		end;
		
end;

procedure actMaximo(l: lista; var max: integer);
begin
	if (l <> nil) then
		begin
			if (l^.dato > max) then
				max := l^.dato;
			actMaximo(l^.sig, max);
		end;
end;

procedure buscarValor(l:lista; valor: integer; var encontre: boolean);
begin
	if (l <> nil) then
		begin
			if (l^.dato = valor) then
				encontre := true
			else
				encontre := false;
			buscarValor(l^.sig, valor, encontre);
		end;
end;


var
	l: lista;
	valor, min, max: integer;
	encontre : boolean;
begin
	Randomize;
	cargarLista(l);
	min:= 9999;
	actMinimo(l, min);
	writeln('Valor minimo: ', min);
	max:= -1;
	actMaximo(l, max);
	writeln('Valor maximo: ', max);
	writeln('Ingrese un numero a buscar');
	readln(valor);
	buscarValor(l, valor, encontre);
	if (encontre = true) then
		writeln('Valor encontrado')
	else
		writeln('Valor no encontrado');
end.


