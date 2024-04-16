function [L, U, P] = MyLUP(A)
    n = size(A, 1);
    L = eye(n); % Initialize L as identity matrix
    U = A;      % Copy A into U to preserve A
    P = eye(n); % Initialize P as identity matrix

    for k = 1:n-1
        % Partial pivoting
        [~, maxIndex] = max(abs(U(k:n, k)));
        maxIndex = maxIndex + k - 1;
        % Swap rows in U and P
        U([k, maxIndex], :) = U([maxIndex, k], :);
        P([k, maxIndex], :) = P([maxIndex, k], :);
        if k > 1
            L([k, maxIndex], 1:k-1) = L([maxIndex, k], 1:k-1);
        end
        % Gaussian elimination
        for j = k+1:n
            L(j, k) = U(j, k) / U(k, k);
            U(j, :) = U(j, :) - L(j, k) * U(k, :);
        end
    end
end
