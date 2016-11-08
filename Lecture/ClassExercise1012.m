close all;
clear all;
clc;
[x, y, F] = peaks(40);
x1 = x( 1, : ); 
y1 = y( :, 1 ); 
figure;
surf(x,y,F); % surf(x-grid,y-grid, function(x,y))
hold on;
imagesc (x1,y1,F)
xlabel('x'); ylabel('y'); zlabel('F(x,y)');
colormap( jet ) 
colorbar

%% This is a combination of surf and imagesc which is pretty unattractive.
F2 = F + 10;
[x, y, F1] = peaks(40);
surf(x,y,F1); % surf(x-grid,y-grid, function(x,y))
xlabel('x'); ylabel('y'); zlabel('F(x,y)');
colormap( jet ) 
colorbar
