%Calibraci�n de la c�mara

%----------------Captura de im�genes de calibraci�n-------------------

%El objetivo es realizar la toma de im�genes para realizar la calibraci�n
%de la c�mara. Es necesario lograr una cantidad de ejemplos �tiles para que
%la aplicaci�n determine los par�metros correspondientes. 
%A continuaci�n se toman 10 im�genes, con un intervalo de 5 segundos entre
%cada una, para dar tiempo a un acomodo variado de �ngulos, inclinaciones
%(bajas) y desplazamientos (cortos), realizados por la persona, dentro del �rea de
%trabajo.

%elimina las sesiones webcam anteriores y variables anteriores
clear all 
%limpia el command window
clc 
camList=webcamlist %Despliega la lista de c�maras disponibles
cam=webcam(2) %Se selecciona la webcam DroidCam (c�mara web inal�mbrica remota con android)
preview(cam); %Se muestra un recuadro con la imagen en tiempo real
pause('on') %Activa la funcionalidad de pausa por x segundos
for i = 1:10
        %Se captura una imagen
        img=snapshot(cam); 
        %Se define el nombre de la imagen, seg�n el contador
        filename = ['Image' num2str(i)]; 
        imwrite(img,filename,'png');
        disp('Imagen # ');
        disp(i);
        disp(' capturada');
        imshow(filename);
        if i==10
            disp('Fin de captura de im�genes');
        end
        pause(3);
end
%Si se desea finalizar la ejecuci�n del c�digo de forma anticipada
%presionar Ctrl + C
