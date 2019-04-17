% The MIT License (MIT)
%
% Copyright (c) 2019 Bo Zhuang <sdzhuangbo@hotmail.com>
%

x = linspace(0, 1, 101);
y = sin(10*x);

% Plot in Matlab
plot(x, y);

% Save PGFPlot figure with data
save4plot2d('data1.txt', x, y);
save4plot2d('data2.txt', x, y, 1:5:101);
