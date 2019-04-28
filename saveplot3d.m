% The MIT License (MIT)
%
% Copyright (c) 2019 Bo Zhuang <sdzhuangbo@hotmail.com>
%

%% ========================================================
%% Save PGFPlot 3D figuer using data z(x,y)
%% --------------------------------------------------------
%
% Suppose you have data z(x,y) in matlab.
% Now, you want to plot it in LaTeX.
% First, you need save data to a text file
% with the right format. This function will
% help you.
% 
%% Usage:
% 
% (1) saveplot3d ( filename, x, y, z )
% 
%    Save all data from z(x,y) to filename.txt,
%    and LaTeX code to filename.tex.
%    
% (2) saveplot3d ( filename, x, y, z, sx, sy )
% 
%    Save selected data from z(x,y) to filename.txt,
%    and LaTeX code to filename.tex.
%    Select x and y using sx and sy respectively.
% 
%% Example in Matlab:
% 
%   x = linspace(0, 1, 101);
%   y = linspace(-1, 1, 201);
%   z = exp(-x'.^2 - y.^2);    % get z(x,y) as 101 x 201 matrix
%   % Plot 3D surface in Matlab
%   surf(x, y, z');
%   % Save PGFPlot figure with data
%   saveplot3d('fig3', x, y, z);
%   saveplot3d('fig4', x, y, z, 1:5:101, 1:5:201);
% 
%% Example in LaTeX:
% 
%  \documentclass{article}
%  \usepackage{pgfplots}
%  \begin{document}
% 
%  \begin{tikzpicture}
% 	 \begin{axis}[
% 	   xlabel={$x$},
% 	   ylabel={$y$},
% 	   zlabel={$z$},
% 	   view={60}{30},
% 	 ]
% 	    \addplot3[surf, mesh/rows=101] table {fig3.txt};
% 	    % \addplot3[surf, mesh/rows=21] table {fig4.txt};
% 	 \end{axis}
%  \end{tikzpicture}
% 
%  \end{document}
%
%% --------------------------------------------------------
function [] = saveplot3d (filename, x, y, z, sx, sy)
  if nargin < 4
    error('Need more arguments: saveplot3d(filename, x, y, z, sx, sy)');
  end
  
  if ~exist('sx', 'var')
    sx = 1:length(x);
  end
  if ~exist('sy', 'var')
    sy = 1:length(y);
  end
  
  % Select x and y
  xs = x(sx);
  ys = y(sy);
  
  % Create mesh X and Y
  X = repmat(xs(:)', length(ys), 1);
  Y = repmat(ys(:), 1, length(xs));
  
  % Create mesh Z
  Z = z(sx, sy)';
  
  % Convert data to column vectors
  M = [X(:) Y(:) Z(:)];
  
  % Set filename
  [path, name] = fileparts(filename);
  texfile = fullfile(path, [name '.tex']);
  datfile = fullfile(path, [name '.txt']);
  
  % Save to text file
  save(datfile, 'M', '-ascii');
  
  % Save LaTeX document template
  f = fopen(texfile, 'w');
  fprintf(f, '\\documentclass{standalone}\n');
  fprintf(f, '\\usepackage{pgfplots}\n');
  fprintf(f, '\\begin{document}\n');
  fprintf(f, '\n');
  fprintf(f, '\\begin{tikzpicture}\n');
  fprintf(f, '  \\begin{axis}[\n');
  fprintf(f, '    xlabel={$x$},\n');
  fprintf(f, '    ylabel={$y$},\n');
  fprintf(f, '    zlabel={$z$},\n');
  fprintf(f, '    xmin=%g, xmax=%g,\n', xs(1), xs(end));
  fprintf(f, '    ymin=%g, ymax=%g,\n', ys(1), ys(end));
  fprintf(f, '    view={60}{30},\n');
  fprintf(f, '  ]\n');
  fprintf(f, '    \\addplot3[surf, mesh/rows=%d] table {%s};\n', length(xs), datfile);
  fprintf(f, '  \\end{axis}\n');
  fprintf(f, '\\end{tikzpicture}\n');
  fprintf(f, '\n');
  fprintf(f, '\\end{document}\n');
  fclose(f);
  
  fprintf('LaTeX figure saved in "%s" and "%s".\n', texfile, datfile);
end
