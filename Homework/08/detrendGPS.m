%% *Part 1: Automated GPS Data Processing*
% 1.1: Download the data and import into MATLAB
function  [] = detrendGPS(filename)

nHeaderLine = 0;
fid = fopen( fullfile('H:\Classes_Teaching_Fall 2016\Computation\GEOS397\Homework\08', filename), 'r' );
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
C = textscan(fileID, '%f%d%d%f%f%f%f%f%f', 'HeaderLines', nHeaderLine);
fclose(fileID);

%% 1.2: Strip out the relevant data

tDecyear     = C{1}; % Time [decimal year]
tDaynum      = C{3}; % Time [integer day number]
Nposition    = C{4}*100; % North Position [cm]
Eposition    = C{5}*100; % East Position [cm]
vertPosition = C{6}*100; % Vertical Position [cm]

% 1.3: Process the GPS data

stationName = filename(1:4);        % pulls first four characters = station name
order = 1;                          % polynomial order                 
pN = polyfit(tDecyear, Nposition, order);   % generate trendline for N position
trendN = polyval( pN, tDecyear );

pE = polyfit(tDecyear, Eposition, order);   % generate trendline for E position
trendE = polyval( pE, tDecyear );

pVert = polyfit(tDecyear, vertPosition, order);   % generate trendline for vert position
trendVert = polyval( pVert, tDecyear );

residualN    = Nposition - trendN;          % residuals remaining after subtracting trendline values
residualE    = Eposition - trendE;
residualVert = vertPosition - trendVert;

stationName       = filename(1:4);              % pulls first four characters = station name
totalTime         = tDecyear(end)-tDecyear(1);  % time elapsed in decimal years
numDays           = length(tDaynum);            % number of days elapsed
totEdisplacement  = (Eposition(end) - Eposition(1)); % East displacement [cm]
totNdisplacement  = (Nposition(end) - Nposition(1)); % North displacement [cm]
totVdisplacement  = (vertPosition(end) - vertPosition(1)); % Vert displacement [cm]
meanEvelocity     = totEdisplacement/totalTime;   % East velocity [cm/yr]
meanNvelocity     = totNdisplacement/totalTime;   % North velocity [cm/yr]
meanVertvelocity  = totVdisplacement/totalTime;   % Vertical velocity [cm/yr]

fprintf ('Site Name: %s\n',stationName)
fprintf ('Time span: %2.2f [yrs]\n', totalTime)
fprintf ('Number of days with data: %d\n', numDays)
fprintf ('Total north displacement:     %.2f [cm]\n', totNdisplacement)
fprintf ('Total east displacement:      %.2f [cm]\n', totEdisplacement)
fprintf ('Total vertical displacement:  %.2f [cm]\n', totVdisplacement)
fprintf ('Avg north velocity:     %.3f [cm/yr]\n', meanNvelocity)
fprintf ('Avg east velocity:      %.3f [cm/yr]\n', meanEvelocity)
fprintf ('Avg vertical velocity:  %.3f [cm/yr]\n', meanVertvelocity)
fprintf ('Avg north velocity using best-fit polynomial:     %.3f [cm/yr]\n', pN(1))
fprintf ('Avg east velocity using best-fit polynomial:      %.3f [cm/yr]\n', pE(1))
fprintf ('Avg vertical velocity best-fit polynomial:  %.3f [cm/yr]\n\n', pVert(1))

h = figure;
str=sprintf('North, East and Vertical Displacement Residuals at Station %s \n', stationName);
subplot (3,1,1)
plot(tDecyear, residualN, 'ob-','MarkerSize',3);
title(str)
xlabel('Time [yr]')
ylabel('N Residuals [cm]','FontSize',7.5)
hold on;
subplot (3,1,2)
plot (tDecyear, residualE,'-or','MarkerSize',3);
xlabel('Time [yr]')
ylabel('E Residuals[cm]','FontSize',7.5)
hold on;
subplot (3,1,3)
plot (tDecyear, residualVert, '-og','MarkerSize',3);
xlabel('Time [yr]')
ylabel('Vert. Residuals[cm]','FontSize',7.5)

%% 1.4 Compare the best-fit polynomial

% *SEE MAIN SCRIPT*
%% 1.5 Process the residuals

X = [-0.015:0.001:0.015]*100;           % histogram bins [cm]
nh = hist(residualN, X);
ne = hist(residualE, X);
nv = hist(residualVert, X);
h = figure; 
bar( X, [nh; ne; nv]','stacked');
legend('N residuals','E residuals','Vertical residuals');
title(sprintf('North, East and Vertical Displacement Residuals at Station %s \n', stationName));

end