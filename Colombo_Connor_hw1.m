clc;        % clears command window
clear all;  % clears workspace
close all;  % closes all figure windows

fprintf('\n\n24-311 S20 Assignment 1');
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
fprintf('\nProblem#1 - 2.2:\n');
v = linspace(-2,1.5,8);
v_colon = -2:(1.5--2)/(8-1):1.5;
fprintf('\n a. \n');
fprintf("linspace(-2,1.5,8) = " + mat2str(v) + "\n which is identical to \n(-2:(1.5--2)/(8-1):1.5) = (-2:0.5:1.5) = " + mat2str(v_colon) + '\n');

r = linspace(8,4.5,8);
r_colon = 8:-(8-4.5)/(8-1):4.5;
fprintf('\n b. \n');
fprintf("linspace(8,4.5,8) = " + mat2str(r) + "\n which is identical to \n(8:-(8-4.5)/(8-1):4.5) = (8:-0.5:4.5) = " + mat2str(r_colon) + '\n');


fprintf('\nProblem#1 - 2.7:\n');
f = @(z) exp(-z.^2/2) / sqrt(2*pi);
figure(1207);
fplot(f,[-5 5]);
xlabel('$z$', 'Interpreter', 'latex');
ylabel('frequency', 'Interpreter', 'latex');
disp("Plotted in Figure 1207 (Problem 1: Chapter 2 Problem 07).");


fprintf('\nProblem#1 - 2.8:\n');
% Given data:
F = [14 18 8 9 13];
x = [0.013 0.020 0.009 0.010 0.012];
% Compute k then U:
k = F ./ x;
U = k .* x.^2 / 2;
fprintf("Potential Energies in [J] are: U = " + mat2str(U) + '\n');
Umax = max(U);
fprintf("Maximum Potential Energy: U_max = " + Umax + '\n');


fprintf('\nProblem#1 - 2.9:\n');
Tf = 32:3.6:93.2; % Temperature in Fahrenheit
Tc = (Tf - 32) * 5/9; % Temperature in Celsius
dens = 5.5289e-8 * Tc.^3 - 8.5016e-6 * Tc.^2 + 6.5622e-5 * Tc + 0.99987; % Water density [g/cc]
figure(1209);
plot(Tc,dens);
xlabel('Temperature in Celsius, $T_c$', 'Interpreter','latex');
ylabel('Freshwater Density in $\frac{g}{cm^3}$, $\rho$', 'Interpreter','latex');
disp("Plotted in Figure 1209 (Problem 1: Chapter 2 Problem 09).");


fprintf('\nProblem#1 - 2.10:\n');
% Given data in parameter matrix:
D = [...
 ...%  n         S        B         H
    0.0350    0.0001   10.0000    2.0000;...
    0.0200    0.0002    8.0000    1.0000;...
    0.0150    0.0010   20.0000    1.5000;...
    0.0300    0.0007   24.0000    3.0000;...
    0.0220    0.0003   15.0000    2.5000
];
U = sqrt(D(:,2))./D(:,1) .* ( D(:,3).*D(:,4) ./ (D(:,3) + 2*D(:,4)) ) .^ (2/3);
fprintf("\nStream Velocities, U, in Each Channel in m/s: " + mat2str(round(U,5, 'significant')) + '\n');


fprintf('\nProblem#1 - 2.12:\n');
% Given Data:
t = [10, 20, 30, 40, 50, 60];
c = [3.4, 2.6, 1.6, 1.3, 1.0, 0.5];
% Equation solution:
t_func = 0:0.1:70;
c_func = 4.84 * exp(-0.034*t_func);
% Display:
figure(1212);
semilogy(t,c, 'dr', 'MarkerFaceColor', 'r');
hold on
    semilogy(t_func,c_func, '--g');
hold off
xlabel('Time for Photodegradation [min]', 'Interpreter','latex');
ylabel('Concentration [ppm]', 'Interpreter','latex');
disp("Plotted in Figure 1212 (Problem 1: Chapter 2 Problem 12).");
fprintf("Explanation of results: Since the function is an exponential, \n"+...
"taking the log of it (the y value only) results in a linear function \n"+...
"as seen because y_log = log(4.84 * exp(-0.034*t)) = log(4.84) - 0.034*t\n");

fprintf('\nProblem#1 - 2.17:\n');
% Generate Data:
t = 0 : pi/64 : 6*pi;
x = t .* cos(6*t);
y = t .* sin(6*t);
z = t;
% Plot Results:
subplot(211);
    plot(x,y, 'r');
    xlabel('$x = t\cos{(6t)}$', 'Interpreter','latex');
    ylabel('$y = t\sin{(6t)}$', 'Interpreter','latex');
subplot(212);
    plot3(x,y,z, 'c');
    xlabel('$x = t\cos{(6t)}$', 'Interpreter','latex');
    ylabel('$y = t\sin{(6t)}$', 'Interpreter','latex');
    zlabel('$z = t$', 'Interpreter','latex');
disp("Plotted in Figure 1217 (Problem 1: Chapter 2 Problem 17).");

%-----------------------------------End.-----------------------------------
fprintf('\n< End of Submission. >\n');
