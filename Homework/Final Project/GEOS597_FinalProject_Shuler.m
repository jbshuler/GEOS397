% John Shuler
% GEOS597: Term Project
% Due: 12/9/2016

close all;
clear all;
clc;
%% Import raw .dat files
importDatafiles

%% 

fileID = fopen('./CR6Series_SoilPit1_2016_07_09.dat','r');
C = textscan(fileID, '%s%s%d%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f', 'HeaderLines', 4,'TreatAsEmpty','NaN');
fclose(fileID);

TIMESTAMP = C{1};
% For temp. influence on signal- Fitting Toolbox, 'nonlinfit'
% Maybe low pass filter
plot(C{4})
