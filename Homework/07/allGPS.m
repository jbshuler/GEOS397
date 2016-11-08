%% 2.5: Process all of the data
function allGPS
dir 'H:\Classes_Teaching_Fall 2016\Computation\GEOS397\Homework\07';
myFolderInfo= dir('*.neu');

for n=1:7;
    getGPSdata(myFolderInfo(n).name)
end

end