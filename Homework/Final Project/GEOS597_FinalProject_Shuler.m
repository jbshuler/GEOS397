% John Shuler
% GEOS597: Term Project
% Due: 12/9/2016

close all;
clear all;
clc;

% For temp. influence on signal- Fitting Toolbox, 'nonlinfit'
% Maybe low pass filter  
% x = interp1(to, xo, t1, 'pchip'
% 

%% Load in Data

fileID = fopen('./CR6Series_SoilPit1_2016_07_09.dat','r');
July9 = textscan(fileID, '%s%s%d%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f', 'HeaderLines', 4);
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

Aug6datetime (:,1) = Aug6{1}(9:end);
Aug6datetime (:,2) = Aug6{2}(9:end);

for i = 4:8;
    Aug6moisture (:,i-3) = Aug6{i}(9:end);
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

datetimestamp = [July9datetime; July22datetime; Aug6datetime; Aug23datetime; Sep9datetime; Sep30datetime];
pit1Moisture = [July9moisture; July22moisture; Aug6moisture; Aug23moisture; Sep9moisture; Sep30moisture];

%% New datetime vector

A = char(datetimestamp(:,1));
B = char(datetimestamp(:,2));
dayTime = strcat(A, {' '}, B);
formatIn = 'mm/dd/yyyy HH:MM';
dateVec = datenum(dayTime,formatIn);

figure;
for i = 1:5;
    plot (dateVec, pit1Moisture(:,i));
    hold on;
end

legend('5 cm','20 cm','45 cm','70 cm','100 cm')
datetick('x','mmm','keeplimits')
%% Parse Tension Data, Delete Superfluous

July9tension (:,1) = July9{14}(5471:9718);
July9tension (:,2) = July9{16}(5471:9718);
July9tension (:,3) = July9{18}(5471:9718);
July9tension (:,4) = July9{20}(5471:9718);

July22tension (:,1) = July22{14}(22:end);
July22tension (:,2) = July22{16}(22:end);
July22tension (:,3) = July22{18}(22:end);
July22tension (:,4) = July22{20}(22:end);

Aug6tension (:,1) = Aug6{14}(9:end);
Aug6tension (:,2) = Aug6{16}(9:end);
Aug6tension (:,3) = Aug6{18}(9:end);
Aug6tension (:,4) = Aug6{20}(9:end);

Aug23tension (:,1) = Aug23{14}(5:end);
Aug23tension (:,2) = Aug23{16}(5:end);
Aug23tension (:,3) = Aug23{18}(5:end);
Aug23tension (:,4) = Aug23{20}(5:end);

Sep9tension (:,1) = Sep9{14}(10:end);
Sep9tension (:,2) = Sep9{16}(10:end);
Sep9tension (:,3) = Sep9{18}(10:end);
Sep9tension (:,4) = Sep9{20}(10:end);

Sep30tension (:,1) = Sep30{14}(62:end);
Sep30tension (:,2) = Sep30{16}(62:end);
Sep30tension (:,3) = Sep30{18}(62:end);
Sep30tension (:,4) = Sep30{20}(62:end);

pit1Tension = [July9tension; July22tension; Aug6tension; Aug23tension; Sep9tension; Sep30tension];

figure;
for i = 1:4;
    plot (dateVec, pit1Tension(:,i));
    hold on;
end

legend('5 cm','20 cm','45 cm','70 cm')
datetick('x','mmm','keeplimits')

%% Create new date vector; Interpolate missing values
t0 = dateVec(1);
dt = dateVec(2)-dateVec(1);
%dateVecNew = (linspace(t0,dateVec(end),13585))';
dateVecNew = t0:dt:dateVec(end);
y = interp1(dateVec, pit1Moisture, dateVecNew, 'pchip');
%x = interp1(to, xo, t1, 'pchip'
% figure;
% plot(dateVecNew, y);

