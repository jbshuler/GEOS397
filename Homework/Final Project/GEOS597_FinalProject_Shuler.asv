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

July9moisture = zeros(4248,5);
for i = 4:8;
    July9moisture (:,i-3) = July9{i}(5471:9718);
end

July22datetime (:,1) = July22{1}(22:end);
July22datetime (:,2) = July22{2}(22:end);

July22moisture = zeros(1244,5);
for i = 4:8;
    July22moisture (:,i-3) = July22{i}(22:end);
end

Aug6datetime (:,1) = Aug6{1}(9:end);
Aug6datetime (:,2) = Aug6{2}(9:end);

Aug6moisture = zeros(1440,5);
for i = 4:8;
    Aug6moisture (:,i-3) = Aug6{i}(9:end);
end

Aug23datetime (:,1) = Aug23{1}(5:end);
Aug23datetime (:,2) = Aug23{2}(5:end);

Aug23moisture = zeros(1614,5);
for i = 4:8;
    Aug23moisture (:,i-3) = Aug23{i}(5:end);
end

Sep9datetime (:,1) = Sep9{1}(10:end);
Sep9datetime (:,2) = Sep9{2}(10:end);

Sep9moisture = zeros(1653,5);
for i = 4:8;
    Sep9moisture (:,i-3) = Sep9{i}(10:end);
end

Sep30datetime (:,1) = Sep30{1}(62:end);
Sep30datetime (:,2) = Sep30{2}(62:end);

Sep30moisture = zeros(2009,5);
for i = 4:8;
    Sep30moisture (:,i-3) = Sep30{i}(62:end);
end

pit1Moisture = [July9moisture; July22moisture; Aug6moisture; Aug23moisture; Sep9moisture; Sep30moisture];

pit1Moisture(5492,:) = [];                  % find and delete duplicate moisture values
pit1Moisture(8546,:) = [];
pit1Moisture(10197,:) = [];

%% Create date vector, convert to string, delete duplicate dates

datetimestamp = [July9datetime; July22datetime; Aug6datetime; Aug23datetime; Sep9datetime; Sep30datetime];

A = char(datetimestamp(:,1));
B = char(datetimestamp(:,2));
dayTime = strcat(A, {' '}, B);
formatIn = 'mm/dd/yyyy HH:MM';
dateVec = datenum(dayTime,formatIn);

dateVec(5492) = [];                         % Remove duplicate dates
dateVec(8546) = [];
dateVec(10197) = [];

%% Plot soil moisture with new date vector with gaps

figure;
for i = 1:5;
    plot (dateVec, pit1Moisture(:,i));
    hold on;
end

legend('5 cm','20 cm','45 cm','70 cm','100 cm')
datetick('x','mmm','keeplimits')
title('Raw Soil Moisture Data')

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

pit1Tension(5492,:) = [];               % Remove tension values associated with duplicate dates
pit1Tension(8546,:) = [];
pit1Tension(10197,:) = [];

pit1Tension(pit1Tension<-7998) = NaN;

% for i=1:4;
% pit1Tension (:,i) = despike(pit1Tension1(:,i), -7999);
% end
% 
% figure;
% plot(pit1Tension(:,4),'--');
% hold on;
% plot (pit1Tension1(:,4));
% ylim([-7999 0]);

figure;
for i = 1:4;
    plot (dateVec, pit1Tension(:,i));
    hold on;
end

legend('5 cm','20 cm','45 cm','70 cm')
datetick('x','mmm','keeplimits')
set(gca,'Ydir','reverse')
title('Raw Soil Tension Data')

%% Parse temperature data; delete superfluous

July9temp (:,1) = July9{9}(5471:9718);
July9temp (:,2) = July9{10}(5471:9718);
July9temp (:,3) = July9{11}(5471:9718);
July9temp (:,4) = July9{12}(5471:9718);
July9temp (:,5) = July9{13}(5471:9718);

July22temp (:,1) = July22{9}(22:end);
July22temp (:,2) = July22{10}(22:end);
July22temp (:,3) = July22{11}(22:end);
July22temp (:,4) = July22{12}(22:end);
July22temp (:,5) = July22{13}(22:end);

Aug6temp (:,1) = Aug6{9}(9:end);
Aug6temp (:,2) = Aug6{10}(9:end);
Aug6temp (:,3) = Aug6{11}(9:end);
Aug6temp (:,4) = Aug6{12}(9:end);
Aug6temp (:,5) = Aug6{13}(9:end);

Aug23temp (:,1) = Aug23{9}(5:end);
Aug23temp (:,2) = Aug23{10}(5:end);
Aug23temp (:,3) = Aug23{11}(5:end);
Aug23temp (:,4) = Aug23{12}(5:end);
Aug23temp (:,5) = Aug23{13}(5:end);

Sep9temp (:,1) = Sep9{9}(10:end);
Sep9temp (:,2) = Sep9{10}(10:end);
Sep9temp (:,3) = Sep9{11}(10:end);
Sep9temp (:,4) = Sep9{12}(10:end);
Sep9temp (:,5) = Sep9{13}(10:end);

Sep30temp (:,1) = Sep30{9}(62:end);
Sep30temp (:,2) = Sep30{10}(62:end);
Sep30temp (:,3) = Sep30{11}(62:end);
Sep30temp (:,4) = Sep30{12}(62:end);
Sep30temp (:,5) = Sep30{13}(62:end);

pit1Temp = [July9temp; July22temp; Aug6temp; Aug23temp; Sep9temp; Sep30temp];

pit1Temp(5492,:) = [];          % Remove temp values associated with duplicate dates
pit1Temp(8546,:) = [];
pit1Temp(10197,:) = [];

pit1Temp(2134,:) = NaN;       % Replace zero values in this row with NaN       

figure;
for i = 1:4;
    plot (dateVec, pit1Temp(:,i));
    hold on;
end

legend('5 cm','20 cm','45 cm','70 cm','100 cm')
datetick('x','mmm','keeplimits')
title('Raw Temperature Data')

%% Create new date vector; Interpolate missing moisture/tension/temperature values
t0 = dateVec(1);
dt = dateVec(2)-dateVec(1);
dateVecNew = (t0:dt:dateVec(end))'; % new date vector with no gaps

moistureInt = zeros(length(dateVecNew),5);
for i = 1:5;
    moistureInt(:,i) = interp1(dateVec, pit1Moisture(:,i), dateVecNew, 'pchip');
end

figure;
for i = 1:5;
    plot (dateVecNew, moistureInt(:,i));
    hold on;
end

tensionInt = zeros(length(dateVecNew),4);
for i = 1:4;
    tensionInt(:,i) = interp1(dateVec, pit1Tension(:,i), dateVecNew, 'pchip');
end

figure;
for i = 1:4;
    plot (dateVecNew, tensionInt(:,i));
    hold on;
end

tempInt = zeros(length(dateVecNew),5);
for i = 1:5;
    tempInt(:,i) = interp1(dateVec, pit1Temp(:,i), dateVecNew, 'pchip');
end

figure;
for i = 1:5;
    plot (dateVecNew, tempInt(:,i));
    hold on;
end

legend('5 cm','20 cm','45 cm','70 cm','100 cm')
datetick('x','mmm','keeplimits')
title('Temperature')
%% Temperature corrected moisture data

maxOmega = zeros(1,140);
for i = 2:140;
     maxOmega(1) = max(moistureInt(93:188));
     A = 93+(96*(i-1));
     B = (188+96*(i-1));
     maxOmega(i) = max(moistureInt (A:B));
end
for i = 2:140;
     minOmega(1) = min(moistureInt(93:188));
     A = 93+(96*(i-1));
     B = (188+96*(i-1));
     minOmega(i) = min(moistureInt (A:B));
end

Aomega = maxOmega - minOmega;
Aomega(23:34)= [];

maxTemp = zeros(1,140);
for i = 2:140;
     maxTemp(1) = max(tempInt(93:188));
     A = 93+(96*(i-1));
     B = (188+96*(i-1));
     maxTemp(i) = max(tempInt (A:B));
end
for i = 2:140;
     minTemp(1) = min(tempInt(93:188));
     A = 93+(96*(i-1));
     B = (188+96*(i-1));
     minTemp(i) = min(tempInt (A:B));
end

Atemp = maxTemp - minTemp;
Atemp(23:34) = [];

figure;
plot(Atemp, Aomega,'o')

for i = 2:140;
     meanOmega(1) = mean(moistureInt(93:188));
     A = 93+(96*(i-1));
     B = (188+96*(i-1));
     meanOmega(i) = mean(moistureInt (A:B));
end

meanOmega(23:34) = [];

pN = polyfit(Atemp, meanOmega, 1);   % generate trendline to determine alpha
trend = polyval( pN, Atemp );
R = corrcoef(Atemp,meanOmega);

figure;
plot(Atemp, meanOmega,'o');
rSquared2 = (R(2))^2;
hold on;
plot(Atemp, trend);

pN2 = polyfit(Atemp, Aomega, 1);   % generate trendline to determine alpha
trend2 = polyval( pN2, Atemp );
R2 = corrcoef(Atemp,Aomega);
rSquared = (R2(2))^2;
%%
alpha = -0.0026;
correctedOmega = moistureInt.*(1-(alpha*(tempInt-20)));

figure;
plot(correctedOmega);
%% Create characteristic curves
figure;
plot(moistureInt(:,1),tensionInt(:,1));
set(gca,'Ydir','reverse')
title('Characteristic Curve, 5 cm')

figure;
plot(moistureInt(:,2),tensionInt(:,2));
set(gca,'Ydir','reverse')
title('Characteristic Curve, 20 cm')

figure;
plot(moistureInt(:,3),tensionInt(:,3));
set(gca,'Ydir','reverse')
title('Characteristic Curve, 45 cm')

figure; 
plot(moistureInt(:,4),tensionInt(:,4));
set(gca,'Ydir','reverse')
title('Characteristic Curve, 70 cm')

%% Plot top and bottom moisture sensor against each other

figure;
plot(moistureInt(:,5),moistureInt(:,1));

%% Periodogram of moisture, tension, temperature raw data

fs = 1/(15*60);               % sampling frequency in Hz
N = length(moistureInt)-1;
nfft = 2^nextpow2(N);

for i = 1:5;
    [Pxx,f] = periodogram(moistureInt(:,i),[],nfft,fs);
    subplot(1,5,i)
    plot(f,Pxx); 
    grid on;
    xlabel('Frequency [Hz]');
    ylim([0 1000]);
end
title('Periodogram: Moisture') 

figure;
for i = 1:4;
    [Pxx,f] = periodogram(tensionInt(:,i),[],nfft,fs);
    subplot(1,4,i)
    title('Periodogram: Tension')
    plot(f,Pxx); 
    grid on;
    xlabel('Frequency [Hz]');
    ylim([0 1000]);
end


