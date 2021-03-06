%{
Function finds minimum closest to the initial point given, estimating f''
--------------------------------------------------------------------------
INPUTS:

x_k: (float) initial guess for minimum
f: (function) function that we are analysing
tol: (float) acceptable size of final interval
max_iter (positive int) maximum number of iterations

OUTPUTS:

x_k: (float) new minimum
iter: (int) number of iterations to solve
%}

function [x_k1, iter] = secant_method(x_k0, x_k1, f, tol, max_iter)

    % evaluate values for function being analysed
    f_x0 = f(x_k0);
    f_x1 = f(x_k1);
    
    iter = 0;

    for n=1:max_iter
        
        x_temp = x_k1;
        % find better minimum
        x_k1 = double(x_k1 - (f_x1 * (x_k1 - x_k0)/(f_x1 - f_x0)));
        
        iter = iter + 1;
        
        f_x1 = f(x_k1);
        %check tolerence
        if abs(f_x1) < tol
            
            break;
        end
        
        x_k0 = x_temp;
        f_x0 = f(x_k0);         
    end
end