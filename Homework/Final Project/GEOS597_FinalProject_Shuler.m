% John Shuler
% GEOS597: Term Project
% Due: 12/9/2016

close all;
clear all;
clc;

%TIMESTAMP = C{1};
% For temp. influence on signal- Fitting Toolbox, 'nonlinfit'
% Maybe low pass filter

%% Load in Data

fileID = fopen('./CR6Series_SoilPit1_2016_07_09.dat','r');
July9 = textscan(fileID, '%s%s%d%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f', 'HeaderLines', 4,'TreatAsEmpty','NaN');
fclose(fileID);

fileID = fopen('./CR6Series_SoilPit1_2016_07_22.dat','r');
July22 = textscan(fileID, '%s%s%d%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f', 'HeaderLines', 4,'TreatAsEmpty','NaN');
fclose(fileID);

fileID = fopen('./CR6Series_SoilPit1_2016_08_06.dat','r');
Aug6 = textscan(fileID, '%s%s%d%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f', 'HeaderLines', 4,'TreatAsEmpty','NaN');
fclose(fileID);

fileID = fopen('./CR6Series_SoilPit1_2016_08_23.dat','r');
Aug23 = textscan(fileID, '%s%s%d%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f', 'HeaderLines', 4,'TreatAsEmpty','NaN');
fclose(fileID);

fileID = fopen('./CR6Series_SoilPit1_2016_09_09.dat','r');
Sep9 = textscan(fileID, '%s%s%d%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f', 'HeaderLines', 4,'TreatAsEmpty','NaN');
fclose(fileID);

%% Parse Data, Delete Superfluous

July9_date = July9{1}(5471:9718);
July9_time = July9{2}(5471:9718);
July9_5moisture = July9{4}(5471:9718);
July9_20moisture = July9{4}(5471:9718);
July9_45moisture = July9{4}(5471:9718);
July9_70moisture = July9{4}(5471:9718);
July9_100moisture = July9{4}(5471:9718);




