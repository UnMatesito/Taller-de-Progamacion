{
El administrador de un edificio de oficinas, cuenta en papel, con la información del pago
de las expensas de dichas oficinas. Implementar un programa con:

	a) Un módulo que retorne un vector, sin orden, con a lo sumo las 300 oficinas que
	administra. Se debe leer, para cada oficina, el código de identificación, DNI del
	propietario y valor de la expensa. La lectura finaliza cuando llega el código de
	identificación -1.

	b) Un módulo que reciba el vector retornado en a) y retorne dicho vector ordenado por
	código de identificación de la oficina. Ordenar el vector aplicando uno de los métodos
	vistos en la cursada.

	c) Un módulo que realice una búsqueda dicotómica. Este módulo debe recibir el vector
	generado en b) y un código de identificación de oficina. En el caso de encontrarlo, debe
	retornar la posición del vector donde se encuentra y en caso contrario debe retornar 0.
	Luego el programa debe informar el DNI del propietario o un cartel indicando que no
	se encontró la oficina.

	d) Un módulo recursivo que retorne el monto total de las expensas.
}
program E01P5;
const
	dimf = 300;
type
	rango = 1..dimf;
	
	oficina = record
		codigo: integer;
		dni: integer;
		expensa: real;
		end;
	
	v_oficinas = array[rango] of oficina;

procedure leerOficina(var o: oficina);
begin
	with o do
		begin
			writeln('Ingrese el codigo de identificacion');
			readln(codigo);
			if (codigo <> -1) then
				begin
					writeln('Ingrese el DNI del propietario');
					readln(dni);
					writeln('Ingrese valor de la expensa');
					readln(expensa);
				end;
		end;
end;

procedure cargarVector(var v:v_oficinas; var diml:integer);
var
	o:oficina;
begin
	leerOficina(o);
	writeln;
	diml := 0;
	while (o.codigo <> -1) do
		begin
			diml := diml + 1;
			v[diml] := o;
			leerOficina(o);
			writeln;
		end;
end;

procedure seleccion(var v:v_oficinas; diml:integer);
var
	i,j,pos: integer; item: oficina;
begin
	for i:=1 to diml-1 do
		begin
			pos := i;
			for j:= 1 to diml do
				begin
					if (v[j].codigo < v[pos].codigo) then
						pos := j;
				end;
			item := v[pos];
			v[pos] := v[i];
			v[i] := item;
		end;
end;

procedure imprimir (v:v_oficinas; diml:integer);
var i:integer;
begin
	for i:=1 to diml do
		writeln(v[i].codigo);
end;


function busquedaDic(v:v_oficinas; diml:integer; codigo:integer):integer;
var
	pri, ult, medio: integer;
	pos: integer;
begin
	pos := 0;
	pri := 1;
	ult := diml;
	medio := (pri + ult) div 2;
	while (pri <= ult) and (codigo <> v[medio].codigo) do
		begin
			if (codigo < v[medio].codigo) then
				ult := medio - 1
			else
					pri := medio + 1;
			medio := (pri + ult) div 2;
		end;
	if (pri <= ult) and (codigo = v[medio].codigo) then
				pos := medio;
	busquedaDic := pos;
end;

procedure totalExpensas(v:v_oficinas; diml:integer; var total:real);
begin
	if (diml <> 0) then
		begin
			total := total + v[diml].expensa;
			totalExpensas(v, diml-1, total);
		end;
end;

var
	v: v_oficinas;
	diml, codigo: integer;
	total: real;
begin
	//Punto A
	cargarVector(v, diml);
	//Punto B
	seleccion(v, diml);
	//chequeo
	imprimir(v, diml);
	//Punto C
	writeln('Ingrese un codigo a buscar');
	readln(codigo);
	if (busquedaDic(v,diml,codigo) <> 0) then
		begin
			writeln('DNI del codigo encontrado');
			writeln(v[busquedaDic(v,diml,codigo)].dni);
		end
	else
		writeln('| No se encontro la oficina |');
	//Punto E
	total := 0;
	totalExpensas(v, diml, total);
	writeln('El total de expensas es: ', total:0:2);
end.
