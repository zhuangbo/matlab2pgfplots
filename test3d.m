% The MIT License (MIT)
%
% Copyright (c) 2019 Bo Zhuang <sdzhuangbo@hotmail.com>
%

x = linspace(0, 1, 101);
y = linspace(-1, 1, 201);
z = exp(-x'.^2 - y.^2);    % get z(x,y) as 101 x 201 matrix

% Plot 3D surface in Matlab
surf(x, y, z');

% Save PGFPlot figure with data
save4plot3d('data1.txt', x, y, z);
save4plot3d('data2.txt', x, y, z, 1:5:101, 1:5:201);
