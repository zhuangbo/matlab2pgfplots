% The MIT License (MIT)
%
% Copyright (c) 2019 Bo Zhuang <sdzhuangbo@hotmail.com>
%
%  Permission is hereby granted, free of charge, to any person obtaining a
%  copy of this software and associated documentation files (the "Software"),
%  to deal in the Software without restriction, including without limitation
%  the rights to use, copy, modify, merge, publish, distribute, sublicense,
%  and/or sell copies of the Software, and to permit persons to whom the
%  Software is furnished to do so, subject to the following conditions:
%
%  The above copyright notice and this permission notice shall be included in
%  all copies or substantial portions of the Software.
%
%  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
%  OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
%  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
%  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
%  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
%  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
%  DEALINGS IN THE SOFTWARE.

x = linspace(0, 1, 101);
y = linspace(-1, 1, 201);
z = exp(-x'.^2 - y.^2);    % get z(x,y) as 101 x 201 matrix

% Plot 3D surface in Matlab
surf(x, y, z');

% Save PGFPlot figure with data
save4plot3d('data1.txt', x, y, z);
save4plot3d('data2.txt', x, y, z, 1:5:101, 1:5:201);
