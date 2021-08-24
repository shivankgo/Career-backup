info = dicominfo('MRI_Data\I0000444_anon.dcm');
Y = dicomread(info);
figure
imshow(Y,[]);