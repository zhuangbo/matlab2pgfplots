# Save to Plot

> Save Matlab data to PGFPlots

Suppose you have data `(x,y)` or `(x,y,z)` in Matlab. Now, you want to plot it in LaTeX using PGFPlots. These functions will help you.

## Install

1. Download ZIP.
2. Extract it.
3. Copy files `saveplot2d.m` and `saveplot3d.m` to your code path.
4. Call functions `saveplot2d` or `saveplot3d` after your plot code.

## Save PGFPlots 2D figure using data `(x,y)`

### Usage

1. `saveplot2d ( filename, x, y)`  
    Save all data from `y(x)` to `filename.txt`,
    and LaTeX code to `filename.tex`.

2. `saveplot2d ( filename, x, y, sx )`  
    Save selected data from `y(x)` to `filename.txt`,
    and LaTeX code to `filename.tex`.
    Select `x` using `sx`.

### Example in Matlab

~~~~matlab
x = linspace(0, 1, 101);
y = sin(10*x);

% Plot in Matlab
plot(x, y);

% Save PGFPlot figure with data
saveplot2d('fig1', x, y);
saveplot2d('fig2', x, y, 1:5:101);
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
    \addplot[] table {fig1.txt};
  \end{axis}
\end{tikzpicture}

\end{document}
~~~~

## Save PGFPlots 3D figure using data `(x,y,z)`

### Usage

1. `saveplot3d ( filename, x, y, z )`  
    Save all data from `z(x,y)` to `filename.txt`,
    and LaTeX code to `filename.tex`.
    
2. `saveplot3d ( filename, x, y, z, sx, sy )`  
    Save selected data from `z(x,y)` to `filename.txt`,
    and LaTeX code to `filename.tex`.
    Select `x` and `y` using `sx` and `sy` respectively.

### Example in Matlab

~~~~matlab
x = linspace(0, 1, 101);
y = linspace(-1, 1, 201);
z = exp(-x'.^2 - y.^2);    % get z(x,y) as 101 x 201 matrix

% Plot 3D surface in Matlab
surf(x, y, z');

% Save PGFPlot figure with data
saveplot3d('fig3', x, y, z);
saveplot3d('fig4', x, y, z, 1:5:101, 1:5:201);
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
    \addplot3[surf, mesh/rows=101] table {fig3.txt};
  \end{axis}
\end{tikzpicture}

\end{document}
~~~~

## License

This project is licensed under the MIT License.
