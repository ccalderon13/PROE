%Con este script se puede poner a prueba la detecci�n de los c�rculos en 
%una imagen. El rango de radios es en p�xels, y depende de la altura a la
%que se ubique la c�mara.

%Para obtener una primera aproximaci�n del tama�o en p�xeles de estos
%radios, se utilizar� la variable mmPorPixel, ya sea cargando el Workspace
%m�s reciente, o realizando el proceso de calibraci�n.

%El radio del c�rculo peque�o impreso (PDF llamado "Vision_Guia"), es de
%15mm. El radio del c�rculo grande es de 25mm. Por lo tanto, con los
%c�lculos siguientes se desea aproximar a cu�ntos p�xeles equivalen estos
%radios.

RadioPequeno=15; %15mm es el radio del c�rculo peque�o
RadioGrande=25; %25mm es el radio del c�rculo grande

%El rango de radios peque�os se establece como el radio calculado en
%p�xeles � un porcentaje (debe ajustarce de ser necesario). Se utiliza la funci�n round para redondear el
%resultado al entero m�s cercano, ya que no pueden existir fracciones de
%p�xeles.
RminPequeno=round((RadioPequeno/mmPorPixel)*0.9)
RmaxPequeno=round((RadioPequeno/mmPorPixel)*1.5)

%Ahora se hace el mismo procedimiento para el c�rculo grande.
RminGrande=round((RadioGrande/mmPorPixel)*1)
RmaxGrande=round((RadioGrande/mmPorPixel)*1.5)

%Prueba de b�squeda c�rculo peque�o
%Dark se refiere a que el c�rculo es oscuro sobre un fondo claro.

%Prueba 02 febrero 2020 INICIO (requiere su workspace)
%Mejor combinaci�n hasta ahora de multiplicadores: 1 y 2, pero detecta los
%grandes.
RminPequeno=round((RadioPequeno/mmPorPixel)*0.84)
RmaxPequeno=round((RadioPequeno/mmPorPixel)*1.7)
A = ImSuperpuesta; imshow(A)
[centersDarkp, radiiDarkp] = imfindcircles(A,[RminPequeno RmaxPequeno],'ObjectPolarity','dark');
viscircles(centersDarkp, radiiDarkp,'EdgeColor','b');

%Prueba de b�squeda c�rculo grande
[centersDarkg, radiiDarkg] = imfindcircles(A,[RminGrande RmaxGrande],'ObjectPolarity','dark');
viscircles(centersDarkg, radiiDarkg,'EdgeColor','r');
%FIN

A = imread('ejemplo1(1).jpg'); imshow(A)
[centersDarkp, radiiDarkp] = imfindcircles(A,[RminPequeno RmaxPequeno],'ObjectPolarity','dark');
viscircles(centersDarkp, radiiDarkp,'EdgeColor','b');

%Prueba de b�squeda c�rculo grande

B = imread('ejemplo1(1).jpg'); imshow(B)
[centersDarkg, radiiDarkg] = imfindcircles(B,[RminGrande RmaxGrande],'ObjectPolarity','dark');
viscircles(centersDarkg, radiiDarkg,'EdgeColor','r');

%Prueba con el nuevo identificador de c�rculos inscritos de mayor tama�o
%El radio del c�rculo peque�o impreso (Imagen llamada "Identificador Modificado"), 
%es de 30mm. El radio del c�rculo grande es de 50mm. Por lo tanto, con los
%c�lculos siguientes se desea aproximar a cu�ntos p�xeles equivalen estos
%radios.
%Ahora son el doble de grandes en comparaci�n al primer identificador
%Otra diferencia es que el c�rculo grande est� sobre fondo oscuro,
%mientras que el c�rculo peque�o est� sobre fondo claro. La l�nea 
%que se puede trazar entre sus centros marcar� la orientaci�n del robot.
RadioPequeno=30; %15mm es el radio del c�rculo peque�o
RadioGrande=50; %25mm es el radio del c�rculo grande

%El rango de radios peque�os se establece como el radio calculado en
%p�xeles � un porcentaje (debe ajustarce de ser necesario). Se utiliza la funci�n round para redondear el
%resultado al entero m�s cercano, ya que no pueden existir fracciones de
%p�xeles.
RminPequeno=round((RadioPequeno/mmPorPixel)*0.6)%resultado cercano a 6 p�xeles
RmaxPequeno=round((RadioPequeno/mmPorPixel)*1.4)%resultado cercano a 15 p�xeles

%Ahora se hace el mismo procedimiento para el c�rculo grande.
RminGrande=round((RadioGrande/mmPorPixel)*0.85)
RmaxGrande=round((RadioGrande/mmPorPixel)*1.65)

%Prueba de b�squeda c�rculo peque�o
A = imread('ejemplo1(1)Mod.jpg'); imshow(A)
%Ojo: debe buscar c�rculos oscuros
[centersDarkp, radiiDarkp] = imfindcircles(A,[RminPequeno RmaxPequeno],'ObjectPolarity','dark');
viscircles(centersDarkp, radiiDarkp,'EdgeColor','b');%lo marca en color azul

%Prueba de b�squeda c�rculo grande
%Ojo: debe buscar c�rculo claros
B = imread('ejemplo1(1)Mod.jpg'); imshow(B)
[centersDarkg, radiiDarkg] = imfindcircles(B,[RminGrande RmaxGrande],'ObjectPolarity','bright');
viscircles(centersDarkg, radiiDarkg,'EdgeColor','r');%lo marca en color rojo

%Ahora se prueba con la imagen ejemplo1(2)Mod para comprobar que sirve la
%detecci�n de los c�rculos al tener otra orientaci�n y posici�n.
%Se observa que ya no hay problema con las manchas del piso.
%Prueba de b�squeda c�rculo peque�o
C = imread('ejemplo1(2)Mod.jpg'); imshow(C)
%Ojo: debe buscar c�rculos oscuros
[centersDarkp, radiiDarkp] = imfindcircles(C,[RminPequeno RmaxPequeno],'ObjectPolarity','dark');
viscircles(centersDarkp, radiiDarkp,'EdgeColor','b');%lo marca en color azul

%Prueba de b�squeda c�rculo grande
%Ojo: debe buscar c�rculo claros
D = imread('ejemplo1(2)Mod.jpg'); imshow(D)
[centersDarkg, radiiDarkg] = imfindcircles(D,[RminGrande RmaxGrande],'ObjectPolarity','bright');
viscircles(centersDarkg, radiiDarkg,'EdgeColor','r');%lo marca en color rojo