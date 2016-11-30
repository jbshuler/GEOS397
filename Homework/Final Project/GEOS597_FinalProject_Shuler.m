% John Shuler
% GEOS597: Term Project
% Due: 12/9/2016

close all;
clear all;
clc;

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

fileID = fopen('./CR6Series_SoilPit1_2016_09_30.dat','r');
Sep30 = textscan(fileID, '%s%s%d%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f', 'HeaderLines', 4,'TreatAsEmpty','NaN');
fclose(fileID);

%% Parse Moisture Data, Delete Superfluous

July9datetime (:,1) = July9{1}(5471:9718);
July9datetime (:,2) = July9{2}(5471:9718);

for i = 4:8;
    July9moisture (:,i-3) = July9{i}(5471:9718);
end

July22datetime (:,1) = July22{1}(22:end);
July22datetime (:,2) = July22{2}(22:end);

for i = 4:8;
    July22moisture (:,i-3) = July22{i}(22:end);
end

Aug06datetime (:,1) = Aug6{1}(9:end);
Aug06datetime (:,2) = Aug6{2}(9:end);

for i = 4:8;
    Aug06moisture (:,i-3) = Aug6{i}(9:end);
end

Aug23datetime (:,1) = Aug23{1}(5:end);
Aug23datetime (:,2) = Aug23{2}(5:end);

for i = 4:8;
    Aug23moisture (:,i-3) = Aug23{i}(5:end);
end

Sep9datetime (:,1) = Sep9{1}(10:end);
Sep9datetime (:,2) = Sep9{2}(10:end);

for i = 4:8;
    Sep9moisture (:,i-3) = Sep9{i}(10:end);
end

Sep30datetime (:,1) = Sep30{1}(62:end);
Sep30datetime (:,2) = Sep30{2}(62:end);

for i = 4:8;
    Sep30moisture (:,i-3) = Sep30{i}(62:end);
end

datetime = [July9datetime; July22datetime; Aug06datetime; Aug23datetime; Sep9datetime; Sep30datetime];
pit1Moisture = [July9moisture; July22moisture; Aug06moisture; Aug23moisture; Sep9moisture; Sep30moisture];

plot (pit1Moisture(:,1))

