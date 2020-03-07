clc;        % clears command window
clear all;  % clears workspace
close all;  % closes all figure windows

fprintf('\n\n24-311 S20 Assignment 6');
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

%--------------------------------Problem#2---------------------------------
fprintf('\nProblem#2:\n');
disp("See Attached Plots");
fb = @(x,y) 2.*x.*y.^2 + 2.*x - x.^2 - 2.*y.^2;
fc = @(x,y) x.^3./3 + y.^2./2 - 2.*x.*y + 4.*x;

x = linspace(0,4,50);
y = linspace(-1,6,50);
[X,Y] = meshgrid(x,y);
Zb = fb(X,Y);
Zc = fc(X,Y);

figure(21);
contour(X,Y,Zb);
xlabel("x");
ylabel("y");
title(char("Contour Plot of "+char(fb)));

figure(22);
surf(X,Y,Zb);
xlabel("x");
ylabel("y");
title(char("Surface Plot of "+char(fb)));

figure(23);
contour(X,Y,Zc);
xlabel("x");
ylabel("y");
title(char("Contour Plot of "+char(fc)));

figure(24);
surf(X,Y,Zc);
xlabel("x");
ylabel("y");
title(char("Surface Plot of "+char(fc)));

%--------------------------------Problem#3---------------------------------
fprintf('\nProblem#3:\n');
% Given function table:
data = table();
data.f = {...
    @(x) -1.5*x^6 - 2*x^4 + 12*x; ...
    @(x) 2*x - 1.75*x^2 + 1.1*x^3 - 0.25*x^4; ...
    @(x) 2 + 5*x + 6*x^2 + 2*x^3 + 2*x^4; ...
    @(x) 2*sin(x) - x^2/2 ...
};
data.x0 = [0.1; 3; -1.4; 2];

for i = 1:numel(data.f)
    [data.newtonOptim(i), data.isMinimum(i)] = optimNewton(data.f{i}, data.x0(i), 1e-8, 100);
    data.isMaximum(i) = ~data.isMinimum(i);
end

disp(data);

%--------------------------------Problem#4---------------------------------
fprintf('\nProblem#4:\n');
f = @(x) 2 * sin(x) + 2 * exp(-x.^2/2 + 1);
[xmins, xmaxs, absxmin, absxmax] = findExtrema(f, -10, 10, 100);

disp("For f(x) = " + char(f));
disp("Global Minimum: f(" + absxmin + ") = " + f(absxmin));
disp("Global Maximum: f(" + absxmax + ") = " + f(absxmax));
disp("All Minima (including local):");
disp("x = " + mat2str(xmins));
disp("All Maxima (including local):");
disp("x = " + mat2str(xmaxs));

figure(41);
hold on
    fplot(f, [-10,10]);
    scatter(xmins, f(xmins), 'o');
    scatter(xmaxs, f(xmaxs), 'o');
    scatter(absxmin, f(absxmin), 'x');
    scatter(absxmax, f(absxmax), 'x');
hold off
xlabel('x', 'Interpreter','latex');
ylabel('$f(x)$', 'Interpreter','latex');
legend({'$f(x)$', 'Indentified Local Minima', 'Indentified Local Maxima', 'Indentified Global Minimum', 'Indentified Global Maximum'}, 'Interpreter','latex');

%-----------------------------------End.-----------------------------------
fprintf('\n< End of Submission. >\n');
