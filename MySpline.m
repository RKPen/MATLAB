function [z, M] = MySpline(t, y)
    n = length(t) - 1;
    h = diff(t);
    delta = diff(y) ./ h;
    
    % Initialize A as a square matrix and B as a column vector
    A = zeros(n+1, n+1);
    B = zeros(n+1, 1);
    
    % Set up the A matrix for the tridiagonal system
    A(1,1) = 1; % Boundary condition
    A(end,end) = 1; % Boundary condition
    for i = 2:n
        A(i, i-1) = h(i-1);
        A(i, i) = 2*(h(i-1) + h(i));
        A(i, i+1) = h(i);
        B(i) = 6*(delta(i) - delta(i-1));
    end
    
    % Solve for z using the tridiagonal system
    z = A\B;
    
    % Compute M
    M = zeros(n, 4); % Each row will store coefficients for a polynomial
    for i = 1:n
        M(i,1) = (z(i+1) - z(i))/(6*h(i));
        M(i,2) = z(i)/2;
        M(i,3) = delta(i) - (2*z(i) + z(i+1))*(h(i)/6);
        M(i,4) = y(i) - (z(i)*h(i)^2)/6;
    end
end
