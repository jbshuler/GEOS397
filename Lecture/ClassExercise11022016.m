% Class Exercise 11/2/2016


x = linspace(-10,10,101);
y = 20*x - 5;
noise = 10*randn( 1, numel(y) );
yDirty = y + noise; 

% least-squares linear fit of noisy curve
order = 1; % linear!
p = polyfit( x, yDirty, order );
rSquareSHORT = corrcoef( x, yDirty)
yEst = polyval( p, x );
R2 = corrcoef( x, yEst);

%% Part 2
yDiff = yDirty - yEst;
plot(x, yDiff);
yDiffave = mean(yDiff);
yDiffstd = std (yDiff);

%% Part 1
rSquaredLONG = rCalc(x,yDirty);