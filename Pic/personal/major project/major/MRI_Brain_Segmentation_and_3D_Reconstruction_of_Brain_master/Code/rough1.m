clear all;
clc
close all;

fileFolder = fullfile(pwd,'MRI_Data');
dirOutput = dir(fullfile(fileFolder,'*.dcm'));
fileNames = {dirOutput.name};

if isempty(fileNames)
    message = sprintf('THERE IS NO *.dcm FILES IN THE FOLDER:\n%s',fileFolder);
    uiwait(warndlg(message));
    return;
end
%
%
%% DICOM images investigation.
fullfileName = fullfile(fileFolder,fileNames{1});
if exist(fullfileName,'file')
    successMessage = sprintf('FILE DOES NOT EXIST:\n%s',fullfileName);
    uiwait(helpdlg(successMessage));
    information = dicominfo(fullfileName);
else
    warningMessage = sprintf('file does not exist:\n%s',fullfileName);
    uiwait(warndlg(warningMessage));
end
voxel_size = [information.PixelSpacing; information.SliceThickness];
hWaitBar = waitbar(0,'DICOM Images loading. Please, be patient...........');
length(fileNames)
for i=length(fileNames):-1:1
   Image_file_name = fullfile(fileFolder,fileNames{i});
   DataImage(:,:,i) =uint16(dicomread(Image_file_name));
   waitbar((length(fileNames)-i)/length(fileNames))
end
delete(hWaitBar)
