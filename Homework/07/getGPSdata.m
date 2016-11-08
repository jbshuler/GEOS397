function C=getGPSdata(filename)

nHeaderLine = 0;
fid = fopen( fullfile('H:\GEOS397\GEOS397\Homework\07\GPSdata\GPSdata', filename), 'r' );
line = fgetl( fid ); % get the first line
nHeaderLine = nHeaderLine + 1;
line = fgetl( fid ); % get the second line
while strcmp(line(1:2),'% ')
nHeaderLine = nHeaderLine + 1;
line = fgetl( fid ); % get the second line
end
nHeaderLine = nHeaderLine + 1;
fclose(fid)

fileID=fopen(filename)
C=textscan(fileID, '%.4f %.0f %.0f %.4f %.4f %.4f %.4f %.4f %.4f', 'HeaderLines', nHeaderLine)
fclose(fileID)

end