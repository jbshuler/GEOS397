%% Import a single data file
function  [] = importPitData(filename)
    %fid = fopen( fullfile('H:\Classes_Teaching_Fall 2016\Computation\GEOS397\Homework\Final Project', filename), 'r' );
    %fclose(fid);

fileID=fopen(filename);
C = textscan(fileID, '%f%f%f%f%f%f%f%f%f');
fclose(fileID);

end
