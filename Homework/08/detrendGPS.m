%% *Part 1: Automated GPS Data Processing*
% 1.1: Download the data and import into MATLAB
function  [] = detrendGPS(filename)

nHeaderLine = 0;
fid = fopen( fullfile('H:\Classes_Teaching_Fall 2016\Computation\GEOS397\Homework\08', 'ana1CleanUnf.neu'), 'r' );
line = fgetl( fid ); % get the first line
nHeaderLine = nHeaderLine + 1;
line = fgetl( fid ); % get the second line
while strcmp(line(1:2),'% ')
nHeaderLine = nHeaderLine + 1;
line = fgetl( fid ); % get the second line
end
nHeaderLine = nHeaderLine + 1;
fclose(fid);

fileID=fopen('ana1CleanUnf.neu');
C = textscan(fileID, '%f%d%d%f%f%f%f%f%f', 'HeaderLines', nHeaderLine);
fclose(fileID);

%% 1.2: Strip out the relevant data

tDecyear     = C{1}; % Time [decimal year]
tDaynum      = C{3}; % Time [integer day number]
Nposition    = C{4}.*100; % North Position [cm]
Eposition    = C{5}.*100; % East Position [cm]
vertPosition = C{6}.*100; % Vertical Position [cm]

% 1.3: Process the GPS data

%stationName = filename(1:4);        % pulls first four characters = station name
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

h = figure;
%str=sprintf('North, East and Vertical Displacement Residuals at Station %s \n', stationName);
subplot (3,1,1)
plot(tDecyear, residualN, 'ob-','MarkerSize',3);
%title(str)
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
%% 1.5 Process the residuals

X = [-0.015:0.001:0.015];           % histogram bins [cm]
nh = hist(residualN, X);
%bar( X, nh, 'Facecolor', [0.7 0.7 0.7], 'FaceAlpha', 0.5 )

end