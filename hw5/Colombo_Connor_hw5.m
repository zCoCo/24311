clc;        % clears command window
clear all;  % clears workspace
close all;  % closes all figure windows

fprintf('\n\n24-311 S20 Assignment 5');
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
load hw5_24311; % load given discrete function, disc_f
ys = disc_f;
xs = 1:numel(disc_f); % x values are just the indices

[root, ireq] = disc_secant(xs,ys, 50, 45, 0.01, 100);
root = round(root); % Make root an integer so it corresponds to the input space of f.

fprintf('\n Using the secant method with linear interpolation on the given discrete function, the root was estimated to be x = %d after %d iterations.\n', root, ireq);


%--------------------------------Problem#2---------------------------------
fprintf('\nProblem#2:\n');
% Given function table:
data = table();
data.f = {...
    @(x) sin(x) - x^3; ...
    @(x) x^11 - 1; ...
    @(x) x^5 - 2*x^3 + x^2 - 1; ...
    @(x) 7 * sin(x^2) * exp(-x) - 1; ...
    @(x) x^5 - 16.05*x^4 + 88.75*x^3 - 192.0375*x^2 + 116.35*x + 31.6875 ...
};
data.x0 = [0.9; 1.1; 1.6; 0.3; 0.5825];
data.es = [1e-11; 1e-7; 1e-12; 0.01; 0.001];

fprintf('\n a. \n');
% Loop through all the functions and get roots with Modified Secant Method
for i = 1:numel(data.f)
    [data.modsecant(i), data.ms_ireq(i)] = mod_secant(data.f{i}, data.x0(i), 0.02, data.es(i), 100);
    
    functext = char(data.f{i}); functext = functext(5:end);
    fprintf("\n\t Using Modified Secant on f(x)=%s the root was found using x0=%0.4g after %d iterations to be: \n\t\t" + mat2str(data.modsecant(i), 4), functext, data.x0(i), data.ms_ireq(i));
end

fprintf('\n b. \n');
f = @(x) x^3 - 2*x^2 - 4*x + 8;
[root, ireq] = mod_newtonRaphson(data.f{i}, data.x0(i), data.es(i), 100);
fprintf('\n Testing Modified Newton Raphson method on f(x)=%s with x0=1.2 and es=1e-8 gives root = %0.5g after %d iterations', char(f), root, ireq);

% Loop through all the functions and get roots with Modified Newton-Raphson
% Method:
for i = 1:numel(data.f)
    [data.nr(i), data.nr_ireq(i)] = newtonRaphson(data.f{i}, data.x0(i), data.es(i), 100);
    [data.modnr(i), data.mnr_ireq(i)] = mod_newtonRaphson(data.f{i}, data.x0(i), data.es(i), 100);
    
    functext = char(data.f{i}); functext = functext(5:end);
    fprintf("\n\t Using Newton-Raphson on f(x)=%s the root was found using x0=%0.4g after %d iterations to be: \n\t\t" + mat2str(data.nr(i), 4), functext, data.x0(i), data.nr_ireq(i));
    fprintf("\n\t Using Modified Newton-Raphson on f(x)=%s the root was found using x0=%0.4g after %d iterations to be: \n\t\t" + mat2str(data.modnr(i), 4), functext, data.x0(i), data.mnr_ireq(i));
end

fprintf('\n Comparison table with Standard Newton-Raphson:\n');
% Print results table with more human-friendly names:
data.Properties.VariableNames = {'Function', 'x0', 'es', 'Root_from_Modified_Secant', 'MS_Iterations', 'Root_from_Newton_Raphson', 'NR_Iterations', 'Root_from_Modified_Newton_Raphson', 'MNR_Iterations'};
disp(data);
fprintf('\n Insights: As indicated in the above table, the modified Newton-Raphson method produces the same results to those of the standard Newton-Raphson method (apart from the tricky final function \n wherein each method indentifies a different one of its 5 roots) in the same or significantly fewer iterations, except for the second to last function for which MNR takes 1 more iteration.\n');

fprintf('\n c. \n');
% Make the table variables concise again:
data.Properties.VariableNames = {'f', 'x0', 'es', 'Root_from_Modified_Secant', 'MS_Iterations', 'Root_from_Newton_Raphson', 'NR_Iterations', 'Root_from_Modified_Newton_Raphson', 'MNR_Iterations'};
% Loop through all the functions and get roots with fzero
% Method:
for i = 1:numel(data.f)
    data.fzero(i) = fzero(data.f{i}, data.x0(i));
    
    functext = char(data.f{i}); functext = functext(5:end);
    fprintf("\n\t Using fzero on f(x)=%s the root was found using x0=%0.4g to be: \n\t\t" + mat2str(data.fzero(i), 4), functext, data.x0(i));
end

fprintf('\n RESULTS:\n');
% Print results table with more human-friendly names:
data.Properties.VariableNames = {'Function', 'x0', 'es', 'Root_from_Modified_Secant', 'MS_Iterations', 'Root_from_Newton_Raphson', 'NR_Iterations', 'Root_from_Modified_Newton_Raphson', 'MNR_Iterations', 'Root_from_fzero'};
disp(data);


%--------------------------------Problem#3---------------------------------
fprintf('\nProblem#3:\n');
% Pick an arbitrary 4th order function:
f = @(x) 3*x^4 - 20*x^3 + 42*x^2 - 36*x + 20;

fprintf('\n a. \n');
figure(31);
hold on
    fplot(f, [-1 5]);
    newtonRaphson(f, 0.5, 0.01, 4, true);
hold off
title({char("Convergence path for f="+char(f)),char(" with x0=0.5 with Newton-Raphson")});
xlabel('x');
ylabel('f(x)');
fprintf('NR does converge for %s', char(f));

%-----------------------------------End.-----------------------------------
fprintf('\n< End of Submission. >\n');
