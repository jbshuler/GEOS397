%% Import all data files
function importDatafiles
dir 'H:\Classes_Teaching_Fall 2016\Computation\GEOS397\Homework\Final Project';
myFolderInfo = dir('*.dat');

% for n=1:7;
%     importPitData(myFolderInfo(n).name)
% end

end
%%
dir 'H:\Classes_Teaching_Fall 2016\Computation\GEOS397\Homework\Final Project';
myFolderInfo = dir('*.dat');

for n=1:7;
    fileID = fopen(myFolderInfo(n).name,'r');
    C.n(n) = textscan(fileID, '%s%s%d%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f', 'HeaderLines', 4,'TreatAsEmpty','NaN');
    fclose(fileID); 
end