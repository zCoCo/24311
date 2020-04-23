clc;        % clears command window
clear all;  % clears workspace
close all;  % closes all figure windows

fprintf('\n\n24-311 S20 Assignment 7');
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
fprintf('a. Complete in optim2d_steep.m\n');
fprintf('b. Complete in optim2d_newton.m\n');
fprintf('c.\n');
% Given function table:
data = table();
data.f = {...
    @(x,y) -8*x + x^2 + 12*y + 4*y^2 - 2*x*y;...
    @(x,y) x^2 * sin(x) * sin(y) - x*y*cos(x)...
};
data.x0 = [0;5];
data.y0 = [0;1.6];
es = 1e-5;

% Loop through all the functions and get roots with Modified Secant Method
for i = 1:numel(data.f)
    [data.steepest_xc(i), data.steepest_yc(i), data.steepest_fmin(i)] = optim2d_steep(data.f{i}, data.x0(i), data.y0(i), es, 1000);
    [data.newton_xc(i), data.newton_yc(i), data.newton_fmin(i)] = optim2d_newton(data.f{i}, data.x0(i), data.y0(i), es, 1000);
end

fprintf('\n RESULTS:\n');
% % Print results table with more human-friendly names:
% data.Properties.VariableNames = {'Function', 'x0', 'es', 'Root_from_Modified_Secant', 'MS_Iterations', 'Root_from_Newton_Raphson', 'NR_Iterations', 'Root_from_Modified_Newton_Raphson', 'MNR_Iterations', 'Root_from_fzero'};
disp(data);

%-----------------------------------End.-----------------------------------
fprintf('\n< End of Submission. >\n');
