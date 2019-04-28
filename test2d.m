% The MIT License (MIT)
%
% Copyright (c) 2019 Bo Zhuang <sdzhuangbo@hotmail.com>
%

x = linspace(0, 1, 101);
y = sin(10*x);

% Plot in Matlab
plot(x, y);

% Save PGFPlot figure with data
saveplot2d('fig1', x, y);
saveplot2d('fig2', x, y, 1:5:101);
