%% Import a single data file
function  C = importPitData(filename)
  
    fileID = fopen(filename,'r');
    C = textscan(fileID, '%s%s%d%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f', 'HeaderLines', 4,'TreatAsEmpty','NaN');
    fclose(fileID);

end
