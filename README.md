# Save for Plot

> Save Matlab data for PGFPlots

## Save data `(x,y)` for PGFPlot 2D

Suppose you have data `y(x)` in matlab. Now, you want to plot it in LaTeX. First, you need save data to a text file with the right format. This function will
help you.

### Usage

1. `save4plot2d ( datafilename, x, y)`
    Save all data from `y(x)` to datafilename,
    and create a .tex file in the same name.

2. `save4plot2d ( datafilename, x, y, sx )`
    Save selected data from `y(x)` to `datafilename`,
    and create a .tex file in the same name.
    Select `x` using `sx`.

### Example in Matlab

~~~~matlab
x = linspace(0, 1, 101);
y = sin(10*x);

save4plot2d('data1.txt', x, y);
save4plot2d('data2.txt', x, y, 1:5:101);
~~~~

### Example in LaTeX

~~~~latex
\documentclass{article}
\usepackage{pgfplots}
\begin{document}

\begin{tikzpicture}
  \begin{axis}[
    xlabel={$x$},
    ylabel={$y$},
  ]
    \addplot[] table {data1.txt};
  \end{axis}
\end{tikzpicture}

\end{document}
~~~~

## Save data `(x,y,z)` for PGFPlot 3D

Suppose you have data `z(x,y)` in matlab. Now, you want to plot it in LaTeX. First, you need save data to a text file with the right format. This function will help you.

### Usage

1. `save4plot3d ( datafilename, x, y, z )`
    Save all data from `z(x,y)` to `datafilename`,
    and create a .tex file in the same name.
    
2. `save4plot3d ( datafilename, x, y, z, sx, sy )`
    Save selected data from `z(x,y)` to `datafilename`,
    and create a .tex file in the same name.
    Select `x` and `y` using `sx` and `sy` respectively.

### Example in Matlab

~~~~matlab
x = linspace(0, 1, 101);
y = linspace(-1, 1, 201);
z = exp(-x'.^2 - y.^2);    % get z size 101 x 201

save4plot3d('data1.txt', x, y, z);
save4plot3d('data2.txt', x, y, z, 1:5:101, 1:5:201);
~~~~

### Example in LaTeX

~~~~latex
\documentclass{article}
\usepackage{pgfplots}
\begin{document}

\begin{tikzpicture}
  \begin{axis}[
    xlabel={$x$},
    ylabel={$y$},
    zlabel={$z$},
    view={60}{30},
  ]
    \addplot3[surf, mesh/rows=101] table {data1.txt};
  \end{axis}
\end{tikzpicture}

\end{document}
~~~~
