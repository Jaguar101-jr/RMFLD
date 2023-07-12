%% Please cite this code as: Hussein Abduelhaleim Hussein Muhammed (2022), Least-
%% Squares ReverseTime Migration in Pseudodepth Domain and Its Application.
%% China University of Petroleum (East China), Master Thesis,
%% School of Geosciences, Dept. of Geophysics. Library press©.
%% This code generates a surface plot of the function 'f'
%% on a Riemannian manifold defined by 'Theta' and 'Phi'. The color of the surface is
%% determined by the values of the function,and the plot provides a visualization of the function's behavior on the manifold.

%% EXPLANATION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Manifold Definition:
% theta and phi are arrays defining the parameter ranges for the manifold.
% linspace is used to create evenly spaced points between 0 and 2π for theta, and between 0 and π for phi.
% meshgrid is used to create a grid of Theta and Phi matrices by combining the points from theta and phi.

% Riemannian Metric Tensor:
% g_theta_theta is a scalar representing the metric component g_{theta, theta}.
% g_phi_phi is a matrix representing the metric component g_{phi, phi}, calculated as the square of the sine of Theta.

% Function Definition:
% f is an anonymous function that takes theta and phi as inputs and returns the value of sin(phi) * cos(theta).

% Function Evaluation:
% Z is a matrix representing the values of the function f evaluated on the manifold.
% It is calculated by passing the Theta and Phi matrices through the function f.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Define the manifold
theta = linspace(0, 2*pi, 100);
phi = linspace(0, pi, 100);
[Theta, Phi] = meshgrid(theta, phi);

% Define the Riemannian metric tensor
g_theta_theta = 1;  % Metric component g_{theta, theta}
g_phi_phi = sin(Theta).^2;  % Metric component g_{phi, phi}

% Define the function on the manifold
f = @(theta, phi) sin(phi) .* cos(theta);

% Evaluate the function
Z = f(Theta, Phi);

% Plot the function on the Riemannian manifold
surf_x = (sin(Phi) .* cos(Theta)).';
surf_y = (sin(Phi) .* sin(Theta)).';
surf_z = (cos(Phi)).';

figure;
surf(surf_x, surf_y, surf_z, Z, 'FaceColor', 'interp', 'EdgeColor', 'none');
colormap('jet');
colorbar;
title('Riemannian Manifold (x,y,z)');
xlabel('x');
ylabel('y');
zlabel('z');
