function dividedDifferences = MyNewton(S)
    x = S(:,1); % Extract x values
    y = S(:,2); % Extract y values
    n = length(x);
    dividedDifferences = zeros(n, n);
    dividedDifferences(:,1) = y; % First column is y

    % Compute divided differences
    for j = 2:n
        for i = 1:n-j+1
            dividedDifferences(i,j) = (dividedDifferences(i+1,j-1) - dividedDifferences(i,j-1)) / (x(i+j-1) - x(i));
        end
    end
    
    % Plotting
    xPlot = -pi:0.01:pi;
    yPlot = cos(xPlot); % True function
    polyPlot = zeros(size(xPlot));
    for i = 1:length(xPlot)
        polyPlot(i) = dividedDifferences(1,1);
        for j = 2:n
            term = dividedDifferences(1,j);
            for k = 1:j-1
                term = term * (xPlot(i) - x(k));
            end
            polyPlot(i) = polyPlot(i) + term;
        end
    end

    plot(xPlot, yPlot, 'r-', xPlot, polyPlot, 'b--');
    legend('cos(x)', 'Newton Polynomial', 'Location', 'Best');
    title('Newton Polynomial vs. cos(x)');
    xlabel('x');
    ylabel('f(x)');
end
