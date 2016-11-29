%% Import a single data file
function  [] = importPitData(filename)
  
    fileID=fopen(filename);
    C = textscan(fileID, '%f%f%f%f%f%f%f%f%f');
    fclose(fileID);

end
