clc;        % clears command window
clear all;  % clears workspace
close all;  % closes all figure windows

fprintf('\n\n24-311 S20 Assignment 9');
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
fprintf('See attached cwcolomb_hw9_1.pdf.\n');

%--------------------------------Problem#2---------------------------------
fprintf('\nProblem#2:\n');

fprintf('\n Part a. \n\n');
fprintf('See attached lsq_linear.m.\n');

fprintf('\n Part b. \n\n');
% Setup:
results = table();
results.dataset = "hw91_24311";

% Load data and perform regression:
load(results.dataset);
[a, results.r2] = lsq_linear(d,v);

results.a0 = a(1);
results.a1 = a(2);
disp(results);

figure(2);
f = sum([ones(length(d),1) d] .* a',2); % Compute line of regression for each datapoint
hold on
    scatter(d,v);
    plot(d,f, 'r', 'LineWidth', 3);
hold off
xlabel('Distance, $d$', 'Interpreter','latex');
ylabel('Votage, $v$', 'Interpreter','latex');
title({'2.b. Regression on Laser Sensor Dataset', char("[$a_0$;$a_1$] = " + mat2str(round(a,4)) + ", $r^2$ = " + round(results.r2,4))}, 'Interpreter','latex');
legend({'Dataset', 'Linear Regression: $f(x) = a_1x^2 + a_0$'}, 'Interpreter','latex', 'Location', 'Northwest');

%--------------------------------Problem#3---------------------------------
fprintf('\nProblem#3:\n');

fprintf('\n Part a. \n\n');
fprintf('See attached interp_newton.m.\n');

fprintf('\n Part b. \n\n');
% Setup:
results = table();
results.dataset = "hw92_24311";

% Load data and perform regression:
load(results.dataset);
f15 = interp_newton(x(1:15), y(1:15), 15-1);
f20 = interp_newton(x, y, length(x)-1);

figure(3);
hold on
    scatter(x,y);
    fplot(f15, [x(1) x(15)]);
    fplot(f20, [x(1) x(20)]);
hold off
xlabel('$x$', 'Interpreter','latex');
ylabel('$y$', 'Interpreter','latex');
title({char("3.b. Newton's Interpolating Polynomial of Given Dataset")}, 'Interpreter','latex');
legend({'Dataset', 'Interpolation on First 15 Points', 'Interpolation on All 20 Points'}, 'Interpreter','latex', 'Location', 'Northwest');

%-----------------------------------End.-----------------------------------
fprintf('\n< End of Submission. >\n');
