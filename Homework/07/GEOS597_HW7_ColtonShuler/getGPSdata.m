%% Part 2: Automated GPS Data Processing
% 2. 1: Download the data and import into MATLAB
function  [] = getGPSdata(filename)

nHeaderLine = 0;
fid = fopen( fullfile('H:\Classes_Teaching_Fall 2016\Computation\GEOS397\Homework\07', filename), 'r' ); % Use directory with GPS data, will change with user
line = fgetl( fid ); % get the first line
nHeaderLine = nHeaderLine + 1;
line = fgetl( fid ); % get the second line
while strcmp(line(1:2),'% ')
nHeaderLine = nHeaderLine + 1;
line = fgetl( fid ); % get the second line
end
nHeaderLine = nHeaderLine + 1;
fclose(fid);

fileID=fopen(filename);
C=textscan(fileID, '%.4f %.0f %.0f %.4f %.4f %.4f %.4f %.4f %.4f', 'HeaderLines', nHeaderLine);
fclose(fileID);

%% 2.2: Strip out the relevant data

tDecyear     = C{1}; % Time [decimal year]
tIntyear     = C{2}; % Time [integer year]
tDaynum      = C{3}; % Time [integer day number]
Nposition    = C{4}; % North Position [m]
Eposition    = C{5}; % East Position [m]
vertPosition = C{6}; % Vertical Position [m]

% 2.3: Process the GPS data
stationName       = filename(1:4);              % pulls first four characters = station name
totalTime         = tDecyear(end)-tDecyear(1);  % time elapsed in decimal years
numDays           = length(tDaynum);            % number of days elapsed
totEdisplacement  = (Eposition(end) - Eposition(1))*100; % East displacement [cm]
totNdisplacement  = (Nposition(end) - Nposition(1))*100; % North displacement [cm]
totVdisplacement  = (vertPosition(end) - vertPosition(1))*100; % Vert displacement [cm]
meanEvelocity     = totEdisplacement/totalTime;   % East velocity [cm/yr]
meanNvelocity     = totNdisplacement/totalTime;   % North velocity [cm/yr]
meanVertvelocity  = totVdisplacement/totalTime;   % Vertical velocity [cm/yr]

fprintf ('Site Name: %s\n',stationName)
fprintf ('Time span: %2.2f [yrs]\n', totalTime)
fprintf ('Number of days with data: %d\n', numDays)
fprintf ('Total north displacement:     %.2f [cm]\n', totNdisplacement)
fprintf ('Total east displacement:      %.2f [cm]\n', totEdisplacement)
fprintf ('Total vertical displacement:  %.2f [cm]\n', totVdisplacement)
fprintf ('Avg north velocity:     %.2f [cm/yr]\n', meanNvelocity)
fprintf ('Avg east velocity:      %.2f [cm/yr]\n', meanEvelocity)
fprintf ('Avg vertical velocity:  %.2f [cm/yr]\n\n', meanVertvelocity)

%% 2.4: Plot the GPS data
h = figure;
str=sprintf('North, East and Vertical Displacement at Station %s \n', stationName);
subplot (3,1,1)
plot(tDecyear, Nposition, 'ob-','MarkerSize',3);
title(str)
xlabel('Time [yr]')
ylabel('North Displacement [cm]','FontSize',7.5)
hold on;
subplot (3,1,2)
plot (tDecyear, Eposition,'-or','MarkerSize',3);
xlabel('Time [yr]')
ylabel('East Displacement [cm]','FontSize',7.5)
hold on;
subplot (3,1,3)
plot (tDecyear, vertPosition, '-og','MarkerSize',3);
xlabel('Time [yr]')
ylabel('Vertical Displacement [cm]','FontSize',7.5)
end