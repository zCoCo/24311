clc;        % clears command window
clear all;  % clears workspace
close all;  % closes all figure windows

fprintf('\n\n24-311 S20 Assignment 10');
fprintf('\nConnor W. Colombo');
fprintf('\ncwcolomb@andrew.cmu.edu\n');


%--------------------------IMPORTANT NOTES---------------------------------
% 1) In the command window just your results should be displayed. (Do NOT 
% forget to use semicolon (;)).
% 2) Use appropriate variable names for given questions.
% 3) Label all your graphs and do NOT forget to add units.
% 4) Your graph and question number should match. i.e. If you are plotting 
% question number 5, use figure(5). If there are multiple graphs for one
% problem, use the tens digit for the question number and the ones digit
% for the graph number within the problem (i.e. 51 and 52 if there are two
% graphs required for problem 5).
% 5) Make your code as clear and clean as possible to be graded better and
% easier, do NOT hesitate to comment inside a code.
% 6) Failing one/more of above given conditions may cause you to lose 
% points!
% 7) Graders may comment on your work inside the code section as well and 
% slightly change not working codes to make them work.

%--------------------------------Problem#1---------------------------------
fprintf('\nProblem#1:\n');

fprintf('\n Part a. \n\n');
% Load Data:
load hw10

% Use polyfit to get polynomial coefficients:
P1 = polyfit(x,y,1); % 1st order
P2 = polyfit(x,y,2); % 2nd order
P3 = polyfit(x,y,3); % 3th order
P4 = polyfit(x,y,4); % 4th order

% Display Results:
figure(11);
hold on
    scatter(x,y); % Plot points
    % Plot polynomials (NOTE: the assignment requests varied line styles so they were used instead of varied colors):
    x_smooth = linspace(min(x),max(x),500); % high resolution x points for plotting the polynomials
    plot(x_smooth, polyval(P1,x_smooth), 'r-'); % 1st order
    plot(x_smooth, polyval(P2,x_smooth), 'r:'); % 2nd order
    plot(x_smooth, polyval(P3,x_smooth), 'r-.'); % 3rd order
    plot(x_smooth, polyval(P4,x_smooth), 'r--'); % 4th order
hold off
xlabel('$x$', 'Interpreter','latex');
ylabel('$y$', 'Interpreter','latex');
title(char("1.a. Fit of polynomials to data points using MATLAB's \textit{polyfit}"), 'Interpreter','latex');
legend({'Given Data', 'First Order Polynomial', 'Second Order Polynomial', 'Third Order Polynomial', 'Fourth Order Polynomial'}, 'Interpreter','latex');
fprintf('\t See Figure 11.\n');


fprintf('\n Part b. \n\n');
% Load Data:
load hw10 % unnecessary to reload but done for completeness' sake

% Use spline to fit a cubic spline:
x_spline = linspace(min(x),max(x),500); % high resolution x points for plotting the spline
y_spline = spline(x,y,x_spline);

% Display Results:
figure(12);
hold on
    scatter(x,y); % Plot points
    plot(x_spline, y_spline, 'r-'); % Plot spline
hold off
xlabel('$x$', 'Interpreter','latex');
ylabel('$y$', 'Interpreter','latex');
title(char("1.b. Fit of cubic spline to data points using MATLAB's \textit{spline}"), 'Interpreter','latex');
legend({'Given Data', 'Cubic Spline'}, 'Interpreter','latex');
fprintf('\t See Figure 12.\n');


fprintf('\n Part c. \n\n');
% Load Data:
load hw10 % unnecessary to reload but done for completeness' sake

% Use interp1 to set up interpolated functions:
x_func = linspace(min(x),max(x),500); % high resolution x points for plotting the functions
y_linear = interp1(x,y,x_func, 'linear');
y_spline = interp1(x,y,x_func, 'spline');
y_cubic = interp1(x,y,x_func, 'cubic'); % interp1's 'cubic' is going to be deprecated by MATLAB but is requested specifically by the assignment

% Display Results:
figure(13);
hold on
    scatter(x,y); % Plot points
    % Plot functions (NOTE: the assignment requests varied line styles so they were used instead of varied colors):
    plot(x_func, y_linear, 'r-');
    plot(x_func, y_spline, 'r:');
    plot(x_func, y_cubic, 'r-.');
hold off
xlabel('$x$', 'Interpreter','latex');
ylabel('$y$', 'Interpreter','latex');
title({char("1.c. Fit of various interpolated piecewise functions"), char("to data points using MATLAB's \textit{interp1}")}, 'Interpreter','latex');
legend({'Given Data', char("`\textit{linear}' Method"), char("`\textit{spline}' Method"), char("`\textit{cubic}' Method")}, 'Interpreter','latex');
fprintf('\t See Figure 13.\n');

%--------------------------------Problem#2---------------------------------
fprintf('\nProblem#2:\n');
fprintf('\t See attached cwcolomb_hw10_2.pdf.\n');

%-----------------------------------End.-----------------------------------
fprintf('\n< End of Submission. >\n');
