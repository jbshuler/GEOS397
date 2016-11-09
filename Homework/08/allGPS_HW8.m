%% 2.6: Process all of the data
function allGPS_HW8
dir 'H:\Classes_Teaching_Fall 2016\Computation\GEOS397\Homework\08';
myFolderInfo= dir('*.neu');

for n=1:7;
    detrendGPS(myFolderInfo(n).name)
end

end