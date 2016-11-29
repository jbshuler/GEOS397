%% Import all data files
function importDatafiles
dir 'H:\Classes_Teaching_Fall 2016\Computation\GEOS397\Homework\Final Project';
myFolderInfo= dir('*.dat');

for n=1:7;
    importPitData(myFolderInfo(n).name)
end

end