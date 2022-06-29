


%Adicionalmente, se realiza una calibraci�n de la c�mara para eliminar
%distorsion provocado por el lente, para mayor referencia : https://www.mathworks.com/help/vision/ug/camera-calibration.html
%Para ser capaces de manejar los datos de la webcam es necesario importar
%la biblioteca de webcam. Se descarga desde el gestor de bibliotecas.
%Home/Add-Ons y buscar webcam.
%
    
%----------Paso1: Abrir en APPS Camera Calibrator-------------------
% Camera Calibrator se encuentra en la pesta�a APPS->Image Proccessing
% Es necesario lograr una cantidad de ejemplos �tiles para que
% la aplicaci�n determine los par�metros correspondientes. 

%Si se tiene c�mara web usb, y no se han tomado las im�genes requeridas:

% 1.a: Seleccionar en Calibration/AddImages/FromCamera
% 1.b: Seleccionar en CAMERA/Camera/ HD Pro Webcam C920
% 1.c: Cambiar la resoluci�n a la m�s alta en Camera Properties, y dejar lo
% dem�s en auto
% 1.d: Para iniciar la captura ajustar los valores de Capture Interval y el
% n�mero de im�genes a capturar. Finalmente dar clic en Capture.
%Nota: Se debe tratar que el patr�n de calibraci�n est� en posiciones
%diferentes y en orientaciones diferentes sobre el plano de trabajo,
%adicionalmente agregar un par de ejemplos un poco inclinados para que
%permita calibrar correctamente. Guardar en la carpeta del programa

% Si ya obtuvo, mediante el c�digo CalibracionCamaraP1.m las im�genes requeridas:

% Seleccionar Calibration/AddImages y seleccione el conjunto capturado
% Si no aparecen las im�genes tomadas debe abrir el explorador de archivos
% y cambiar su nombre con la extensi�n .png
% El lado de cada cuadrado de calibraci�n es de 40 mm
% Una vez se logra un set de im�genes �tiles para la calibraci�n, se
% deben eliminar los ejemplos que fueron rechazados.
% Seleccionar el set de im�genes y Renombrar los archivos como Image,
% deber�n aparecer los archivos como Image(1).png, Image(2).png...
% El n�mero de imagen se pone entre par�ntesis para diferenciar las
% im�genes aceptadas, de todas las que fueron tomadas.
% Cambiar numImages a la cantidad de im�genes �tiles para calibraci�n.

%ANTES DE CORRER ESTE C�DIGO:

%SI TIENE HABILITADA LA OPCI�N, DESDE LA APLICACI�N DE CAMERA
%CALIBRATOR, DE PULSAR EL BOT�N "Calibrate", h�galo y espere, al finalizar la
%operaci�n, exportar par�metros llam�ndolos params. Al hacer esto, se deben
%obtener los mismos resultados que al correr este c�digo.
%Si realiza la calibraci�n con el Bot�n Calibrate, solamente debe ejecutar
%las l�neas 64 hasta 68, ya que contienen variables que se utilizar�n m�s
%adelante en Vision_Validacion.m

cont=1;
numImages = 7; %Cantidad de imagenes aceptadas para calibraci�n
CantidadEjemplosCaptura=1;%Variable para modificar la cantidad de ejemplos que se almacenan en los resultados
squareSize = 40; % Tama�o del lado del cuadro en el patr�n de calibraci�n, en mm
tamanoCuadroMedicion=15; %aun no se encuentra por qu� 15
%--------Proceso de Calibraci�n-----------------------
%Se importan las imagenes de calibraci�n que fueron previamente almacenadas
%Se debe modificar la extensi�n de b�squeda con la direcci�n de la carpeta
%donde est�n las im�genes.

%Aqu� se cambia la direcci�n de las im�genes seg�n la computadora con la
%que se trabaje.

%Direcci�n Kevin
extensionImCalibracion='C:\Users\Dell\Desktop\ARCHIVOS\Proyectos\PROE\PROE\Herramientas\C�mara\';

%Direcci�n Cindy
%extensionImCalibracion='C:\Users\ccalderon\OneDrive - TEC\GitHub\PROE\Herramientas\C�mara\';
%cell genera una matriz de celdas, en este caso, de 1xnumImages
files = cell(1, numImages);
%fullfile retorna un vector con el directorio de un archivo
%strcat concatena cadenas horizontalmente
for i = 1:numImages
    files{i} = fullfile(strcat(extensionImCalibracion,'Image(',num2str(i),').png'));
end
magnification = 25; %no veo donde se usa aun.
%Se determina I como toda la fila de extensiones de las im�genes para
%calibraci�n
I = imread(files{1});
[imagePoints, boardSize] = detectCheckerboardPoints(files);
worldPoints = generateCheckerboardPoints(boardSize, squareSize);
params = estimateCameraParameters(imagePoints, worldPoints);
