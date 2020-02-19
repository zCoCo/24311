clc;        % clears command window
clear all;  % clears workspace
close all;  % closes all figure windows

fprintf('\n\n24-311 S20 Assignment 4');
fprintf('\nConnor W. Colombo');
fprintf('\ncwcolomb@andrew.cmu.edu\n');


%--------------------------IMPORTANT NOTES---------------------------------
% 1) In the command window just your results should be displayed. (Do NOT 
% forget to use semicolon (;)).
% 2) Use appropriate variable names for given questions.
% 3) Label all your graphs and do NOT forget to add units.
% 4) Your graph and question number should match. i.e. If you are plotting 
% question number 5, use figure(5). If there are multiple graphs for one
% problem, use the tens digit for the question umber and the ones digit
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
% Given function table:
data = table();
data.f = {...
    @(x) sin(x) - x.^3; ...
    @(x) x.^11 - 1; ...
    @(x) x.^5 - 2*x.^3 + x.^2 - 1; ...
    @(x) -14 - 20*x + 19*x.^2 - 3*x.^3; ...
    @(x) x.^2 .* abs(cos(sqrt(x))) - 5 ...
};
data.xl = [0.5; 0.2; 0; -1; 0];
data.xu = [1; 1.5; 1.6; 0; 5];
data.es = [2; 1; 0.1; 0.5; 0.2];

fprintf('\n a. \n');
% Loop through all the functions and get roots with ginput
for i = 1:numel(data.f)
    figure(11); % problem 1 part 1
    fplot(data.f{i}, [data.xl(i), data.xu(i)]);
    hold on
        plot(xlim, [0 0], 'k:'); % Make x-axis more visible
    hold off
    grid on
    title({char("Problem 1 Part " + i), 'CLICK THE ROOT.'}, 'Interpreter', 'latex');
    xlabel('$x$', 'Interpreter', 'latex');
    ylabel('$f(x)$', 'Interpreter', 'latex');
    [data.graphic(i), ~] = ginput(1);
    
    functext = char(data.f{i}); functext = functext(5:end);
    fprintf("\n\t For %s the root between x=%0.2g and x=%0.2g was identified as: \n\t\t" + mat2str(data.graphic(i), 4), functext, data.xl(i), data.xu(i));
end

fprintf('\n b. \n');
% Loop through all the functions and get roots with bisection method
for i = 1:numel(data.f)
    [data.bisect(i), ireq, ea] = bisectionRoots(data.f{i}, data.xl(i), data.xu(i), data.es(i), 100);
    
    functext = char(data.f{i}); functext = functext(5:end);
    fprintf("\n\t For %s the root between x=%0.2g and x=%0.2g was found after %d iterations to within ea=%0.4g%% to be: \n\t\t" + mat2str(data.bisect(i), 4), functext, data.xl(i), data.xu(i), ireq, ea);
end

fprintf('\n c. \n');
% Loop through all the functions and get roots with false position method
for i = 1:numel(data.f)
    [data.false(i), ireq, ea] = falsePosRoots(data.f{i}, data.xl(i), data.xu(i), data.es(i), 100);
    
    functext = char(data.f{i}); functext = functext(5:end);
    fprintf("\n\t For %s the root between x=%0.2g and x=%0.2g was found after %d iterations to within ea=%0.4g%% to be: \n\t\t" + mat2str(data.false(i), 4), functext, data.xl(i), data.xu(i), ireq, ea);
end

fprintf('\n RESULTS (ea & iteration counts can be found in above outputs): \n');
% Print results table with more human-friendly names:
data.Properties.VariableNames = {'Function', 'xl', 'xu', 'es', 'Root_from_ginput', 'Root_from_bisection', 'Root_from_false_position'};
disp(data);

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
data.x1 = [1; 0.7; 1.5; 0.4; 0.6];
data.es = [1e-11; 1e-7; 1e-12; 1e-2; 0.001];

fprintf('\n a. \n');
% Loop through all the functions and get roots with Newton-Raphson Method
for i = 1:numel(data.f)
    [data.nr(i), ireq] = newtonRaphson(data.f{i}, data.x0(i), data.es(i), 100);
    
    functext = char(data.f{i}); functext = functext(5:end);
    fprintf("\n\t For %s the root was found using x0=%0.4g after %d iterations to be: \n\t\t" + mat2str(data.nr(i), 4), functext, data.x0(i), ireq);
end

fprintf('\n b. \n');
% Loop through all the functions and get roots with Secant Method
for i = 1:numel(data.f)
    [data.secant(i), ireq] = secant(data.f{i}, data.x0(i), data.x1(i), data.es(i), 100);
    
    functext = char(data.f{i}); functext = functext(5:end);
    fprintf("\n\t For %s the root was found using x0=%0.4g x1=%0.4g after %d iterations to be: \n\t\t" + mat2str(data.secant(i), 4), functext, data.x0(i), data.x1(i), ireq);
end

fprintf('\n RESULTS (iteration counts can be found in above outputs): \n')
% Print results table with more human-friendly names:
data.Properties.VariableNames = {'Function', 'x0', 'x1', 'es', 'Root_with_Newton_Raphson', 'Root_with_Secant'};
disp(data);

%-----------------------------------End.-----------------------------------
fprintf('\n< End of Submission. >\n');
