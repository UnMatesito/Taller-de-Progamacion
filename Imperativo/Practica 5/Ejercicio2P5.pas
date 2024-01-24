program E02P5;
const
	max_anios = 2018;
type
	s_anios = 2010..max_anios;
	
	auto = record
		patente: string[6];
		anio: s_anios;
		marca: string;
		modelo: string;
		end;
	
	arbolP = ^nodoP;
	
	nodoP = record
		dato: auto;
		hi: arbolP;
		hd: arbolP;
		end;
	
	autoM = record
		modelo: string;
		anio: s_anios;
		patente: string[6];
		end;
	
	lista = ^nodoL;
	
	nodoL = record
		dato: autoM;
		sig: lista;
		end;
	
	arbolM = ^nodoM;
	
	nodoM = record
		marca: string;
		dato: lista;
		hi: arbolM;
		hd: arbolM;
		end;
		
	v_anios = array[s_anios] of arbolP;
		
procedure leerAuto(var a: auto);
begin
	with a do
		begin
			writeln('Ingrese la patente del auto');
			readln(patente);
			if (patente <> 'xxx') then
				begin
					writeln('Ingrese el anio de fabricacion del auto (2010-2018)');
					readln(anio);
					writeln('Ingrese la marca del auto');
					readln(marca);
					writeln('Ingrese el modelo del auto');
					readln(modelo);
				end;
		end;
end;

procedure agregarArbolPatentes(var ap: arbolP; a: auto);
begin
	if (ap = nil) then
		begin
			new(ap);
			ap^.dato := a;
			ap^.hi := nil;
			ap^.hd := nil;
		end
	else
		begin
			if (a.patente <= ap^.dato.patente) then
				agregarArbolPatentes(ap^.hi, a)
			else
				agregarArbolPatentes(ap^.hd, a);
		end;
end;

procedure agregarAdelante(var l:lista; a:auto);
var
	nuevo : lista;
begin
	new(nuevo);
	nuevo^.dato.modelo := a.modelo;
	nuevo^.dato.anio := a.anio;
	nuevo^.dato.patente := a.patente;
	nuevo^.sig := l;
	l := nuevo;
end;

procedure agregarArbolModelos(var am: arbolM; a:auto);
begin
	if (am = nil) then
		begin
			new(am);
			am^.marca := a.marca;
			am^.dato := nil;
			agregarAdelante(am^.dato, a);
			am^.hi := nil;
			am^.hd := nil;
		end
	else
		begin
			if (am^.marca = a.marca) then
				agregarAdelante(am^.dato, a)
			else if (am^.marca <= a.marca) then
				agregarArbolModelos(am^.hi,a)
			else
				agregarArbolModelos(am^.hd,a);
		end;
end;

//inciso a
procedure cargarArboles(var ap: arbolP; var am: arbolM);
var
	a:auto;
begin
	leerAuto(a);
	writeln;
	while (a.patente <> 'xxx') do
		begin
			agregarArbolPatentes(ap, a);
			agregarArbolModelos(am, a);
			leerAuto(a);
			writeln;
		end;
end;


//inciso b
procedure cantMarcaArP(ap: arbolP; marca:string; var cant:integer);
begin
	if (ap <> nil) then
		begin
			cantMarcaArP(ap^.hi, marca, cant);
			if (ap^.dato.marca = marca) then
				cant := cant + 1;
			cantMarcaArP(ap^.hd, marca, cant);
		end;
end;

//inciso c
function actCant(l:lista; marcaA,marca:string):integer;
begin
	if (l <> nil) and (marca = marcaA) then
		actCant := 1 + actCant(l^.sig, marcaA, marca);
end;

procedure cantMarcaArM(am: arbolM; marca:string; var cant:integer);
begin
	if (am <> nil) then
		begin
			cantMarcaArM(am^.hi, marca, cant);
			cant := actCant(am^.dato, am^.marca, marca);
			cantMarcaArM(am^.hd, marca, cant);
		end;
end;

//inciso d
procedure incializar(var v:v_anios);
var
	i:integer;
begin
	for i:= 2010 to max_anios do
		v[i] := nil;
end;

procedure cargarVector(var v:v_anios; ap:arbolP);
begin
	if (ap <> nil) then
		begin
			cargarVector(v, ap^.hi);
			agregarArbolPatentes(v[ap^.dato.anio], ap^.dato);
			cargarVector(v, ap^.hd);
		end;
end;

procedure enOrden(ap:arbolP);
begin
	if (ap <> nil) then
		begin
			enOrden(ap^.hi);
			writeln('Patente');
			writeln(ap^.dato.patente);
			writeln('Anio');
			writeln(ap^.dato.anio);
			writeln('Marca');
			writeln(ap^.dato.marca);
			writeln('Modelo');
			writeln(ap^.dato.modelo);
			enOrden(ap^.hd);
		end;
end;

procedure imprimirVector(v:v_anios);
var
	i:integer;
begin
	for i := 2010 to max_anios do
		begin
			writeln('Anio ', i);
			enOrden(v[i]);
			writeln;
		end;
end;

//inciso e
function buscarPatentei(ap:arbolP; patente:string):string;
begin
	if (ap <> nil) then
		begin
			if (patente = ap^.dato.patente) then
				buscarPatentei := ap^.dato.modelo
			else if (patente < ap^.dato.patente) then
				buscarPatentei := buscarPatentei(ap^.hi, patente)
			else
				buscarPatentei := buscarPatentei(ap^.hd, patente);
		end
	else
		buscarPatentei := 'ZZZZZZ';
end;

//inciso f
function busqueda(l:lista; patente:string):string;
begin
	if (l <> nil) then
		begin
			if (patente = l^.dato.patente) then
				busqueda := l^.dato.modelo
			else
				busqueda := busqueda(l^.sig, patente);
		end
	else
		busqueda := '555555'
end;

function buscarPatenteii(am:arbolM; patente:string):string;
begin
	if (am <> nil) then
		begin
			if (patente = busqueda(am^.dato, patente)) then
				buscarPatenteii := busqueda(am^.dato, patente)
			else if (patente < busqueda(am^.dato, patente)) then
				buscarPatenteii := buscarPatenteii(am^.hi, patente)
			else
				buscarPatenteii := buscarPatenteii(am^.hd, patente);
		end
	else
		buscarPatenteii := 'ZZZZZZ';
end;

//Para Imprimir
procedure imprimirLista(l:lista);
begin
	if (l <> nil) then
		begin
			writeln('Modelo');
			writeln(l^.dato.modelo);
			writeln('anio');
			writeln(l^.dato.anio);
			writeln('patente');
			writeln(l^.dato.patente);
			writeln;
			imprimirLista(l^.sig);
		end;
end;

procedure imprimirArbol (am:arbolM);
begin
	if (am <> nil) then
		begin
			imprimirArbol(am^.hi);
			writeln('Marca');
			writeln(am^.marca);
			writeln;
			imprimirLista(am^.dato);
			writeln;
			imprimirArbol(am^.hd);
		end;
end;

var
	ap: arbolP;
	am: arbolM;
	v: v_anios;
	marca, patente: string;
	cant : integer;
begin
	writeln('--Inciso A-------------------------------------------');
	ap := nil;
	am := nil;
	writeln('Ingreso de Datos');
	writeln;
	cargarArboles(ap, am);
	imprimirArbol(am);
	writeln;
	writeln('--Inciso B-------------------------------------------');
	writeln('Ingrese una marca');
	readln(marca);
	cant := 0;
	cantMarcaArP(ap, marca, cant);
	writeln('Cantidad de autos de la marca ', marca, ' : ', cant);
	writeln;
	writeln('--Inciso C-------------------------------------------');
	writeln('Ingrese una marca');
	readln(marca);
	cant := 0;
	cantMarcaArM(am, marca, cant);
	writeln('Cantidad de autos de la marca ', marca, ' : ', cant);
	writeln;
	writeln('--Inciso D-------------------------------------------');
	incializar(v);
	cargarVector(v, ap);
	imprimirVector(v);
	writeln;
	writeln('--Inciso E-------------------------------------------');
	writeln('Ingrese una patente a buscar en el arbol de patentes');
	readln(patente);
	if (buscarPatentei(ap, patente) <> 'ZZZZZZ') then
		writeln('Patente econtrada, modelo del auto con esa patente: ', buscarPatentei(ap, patente))
	else
		writeln('Patente no encontrada');
	writeln;
	writeln('--Inciso F-------------------------------------------');
	writeln('Ingrese una patente a buscar en el arbol de marcas');
	readln(patente);
	if (buscarPatenteii(am, patente) <> 'ZZZZZZ') then
		writeln('Patente econtrada, modelo del auto con esa patente: ', buscarPatenteii(am, patente))
	else
		writeln('Patente no encontrada');
end.
