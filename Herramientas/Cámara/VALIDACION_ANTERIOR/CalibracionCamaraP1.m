%En el presente script se realiza el proceso de calibraci�n de la c�mara,
%con el fin de eliminar distorsiones y obtener los par�metros que
%relacionan las im�genes capturadas con las dimensiones reales.
%Esto se requiere para su posterior uso en la medici�n de distancias
%y �ngulos para el an�lisis de trayectorias de un enjambre de robots del
%proyecto PROE

%-------------------------- Notas relevantes-------------------------------

%El objetivo es realizar la toma de im�genes para calibrar la c�mara
%utilizada.

%Es necesario capturar una cantidad de ejemplos �tiles para que la aplicaci�n
%determine los par�metros correspondientes. 

%Si se usa DroidCam, debe iniciarse el cliente de windows y conectarse al dispositivo m�vil.
%Ambos dispositivos deben estar conectados a la misma red Wi-fi

%Links de descarga:

%Para establecer una conexi�n
%Cliente Windows: https://www.dev47apps.com/droidcam/windows/
%Droidcam Play Store: https://play.google.com/store/apps/details?id=com.dev47apps.droidcam
%Droidcam App Store: https://apps.apple.com/us/app/droidcam-wireless-webcam/id1510258102

%Se requiere imprimir en escala real el patr�n de calibraci�n llamado
%"Visi�n Patr�n". Este patr�n debe aparecer en las im�genes capturadas.

%La versi�n de Matlab debe ser al menos 2015.

%Debe estar instalado el Matlab Support Package for USB Webcams, que se
%obtiene desde la pesta�a de Home->Add-Ons.
%Tambi�n se puede obtener con el enlace:
% https://la.mathworks.com/matlabcentral/fileexchange/45182-matlab-support-package-for-usb-webcams

%-------------------------- Inicio del programa ---------------------------
%A continuaci�n se toman 10 im�genes, con un intervalo de 5 segundos entre
%cada una, para dar tiempo a un acomodo variado de �ngulos, inclinaciones
%(bajas) y desplazamientos (cortos), realizados por la persona, dentro del �rea de
%trabajo y captura de la c�mara.

%elimina las sesiones webcam anteriores y variables anteriores
clear all 
%limpia el command window
clc 
camList=webcamlist %Despliega la lista de c�maras disponibles
cam=webcam(2) %Se selecciona la webcam DroidCam (c�mara web inal�mbrica remota con android)
cam.Resolution = '1920x1080' %Ajusta la resoluci�n de la webcam USB
cam.Brightness = 150 %Ajusta el brillo de la webcam
preview(cam); %Se muestra un recuadro con la imagen en tiempo real
pause('on') %Activa la funcionalidad de pausa, que permite detener x segundos la ejecuci�n
for i = 1:10
        %Se captura una imagen
        img=snapshot(cam); 
        %Se define el nombre de la imagen, seg�n el contador
        filename = ['Image' num2str(i) '.png']; 
        imwrite(img,filename); %Se quit� ,'png'   despu�s de filename.
        disp('Imagen # '); %Se muestra en pantalla el # de imagen capturada
        disp(i);
        disp(' capturada');
        imshow(filename); %Se muestra la imagen capturada
        if i==10
            disp('Fin de captura de im�genes');
        end
        pause(5); %Espera 5 segundos para volver a tomar otra foto
end
%Si se desea finalizar la ejecuci�n del c�digo de forma anticipada
%presionar Ctrl + C
