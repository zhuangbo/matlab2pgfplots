% The MIT License (MIT)
%
% Copyright (c) 2019 Bo Zhuang <sdzhuangbo@hotmail.com>
%


%% ========================================================
%% Save PGFPlot 2D figure using data y(x)
%% --------------------------------------------------------
%
% Suppose you have data y(x) in matlab.
% Now, you want to plot it in LaTeX.
% First, you need save data to a text file
% with the right format. This function will
% help you.
% 
%% Usage:
% 
% (1) save4plot2d ( datafilename, x, y)
% 
%    Save all data from y(x) to datafilename,
%    and create a .tex file in the same name.
%    
% (2) save4plot2d ( datafilename, x, y, sx )
% 
%    Save selected data from y(x) to datafilename,
%    and create a .tex file in the same name.
%    Select x using sx.
% 
%% Example in Matlab:
% 
%   x = linspace(0, 1, 101);
%   y = sin(10*x);
%   % Plot in Matlab
%   plot(x, y);
%   % Save PGFPlot figure with data
%   save4plot2d('data1.txt', x, y);
%   save4plot2d('data2.txt', x, y, 1:5:101);
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
% 	 ]
% 	    \addplot[] table {data1.txt};
% 	    % \addplot[] table {data2.txt};
% 	 \end{axis}
%  \end{tikzpicture}
% 
%  \end{document}
%
%% --------------------------------------------------------
function [s] = save4plot2d (filename, x, y, sx)
  if nargin < 3
    error('Need more arguments: save4plot2d(filename, x, y, sx)');
  end
  
  if ~exist('sx', 'var')
    sx = 1:length(x);
  end
  
  % Select x
  xs = x(sx);
  ys = y(sx);
  
  % Convert data to column vectors
  M = [xs(:) ys(:)];
  
  % Save to text file
  save(filename, 'M', '-ascii');

  % Save LaTeX document template
  [path, name] = fileparts(filename);
  if strcmp(path, '')
    texfile = [name '.tex'];
  else
    texfile = [path filesep name '.tex'];
  end
  f = fopen(texfile, 'w');
  fprintf(f, '\\documentclass{article}\n');
  fprintf(f, '\\usepackage{pgfplots}\n');
  fprintf(f, '\\begin{document}\n');
  fprintf(f, '\n');
  fprintf(f, '\\begin{tikzpicture}\n');
 	fprintf(f, '  \\begin{axis}[\n');
 	fprintf(f, '    xlabel={$x$},\n');
 	fprintf(f, '    ylabel={$y$},\n');
 	fprintf(f, '    xmin=%g, xmax=%g,\n', xs(1), xs(end));
 	fprintf(f, '  ]\n');
  fprintf(f, '    \\addplot[] table {%s};\n', filename);
 	fprintf(f, '  \\end{axis}\n');
  fprintf(f, '\\end{tikzpicture}\n');
  fprintf(f, '\n');
  fprintf(f, '\\end{document}\n');
  fclose(f);
end
