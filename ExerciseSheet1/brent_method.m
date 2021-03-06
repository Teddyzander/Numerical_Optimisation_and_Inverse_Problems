%{
Function finds minimum by
using 3 points on f(x) to estimate a parabola P(x), finding its minimum y,
then ditching point 1, and using f(y) to create 3 new points to estimate
a new parabola.

However, sometimes it is impossible to find a parabola (eg when two of the
points are equal). In this scenario, use golden search instead
--------------------------------------------------------------------------
INPUTS:

a: lower bound for interval of minimum
b: upper bound for interval of minimum
f: (function) function we are evaluating
tol: (float) tolerance 
max_iter (positive int) maximum number of iterations

OUTPUTS:

x_k: (float) new minimum
iter: (int) number of iterations to solve
%}

function [x_min, iter] = brent_method(a, b, f, tol, max_iter)

    % initialise our variables
    
    x = a + ((3 - sqrt(5))/2) * (b-a); % should be smallest value of f
    w = x; % should be second smallest value of f
    v = w; % should be previous value of w
    
    for n=1:max_iter
        
       % check to see if we might convergence criteria
       x_mid = (a + b)/2;
       if (b-a) < tol
           break
       end
       
       % check if parabolic search would behave properly
       p = double((w - x)^2 * (f(x) - f(v)) + (v - x)^2 * (f(w) - f(x)));
       q = double((w - x) * (f(x) - f(v)) + (v - x) * (f(w) - f(x)));
       u = 0.5 * p/q;
       
       % poor SPI behaviour, so use golden search
       %if q == 0 || u < a || u > b
           
           if x >= x_mid
               u = ((sqrt(5) - 1)/2) * x + ((3 - sqrt(5))/2) * a;
               
           else
               u = ((sqrt(5) - 1)/2) * x + ((3 - sqrt(5))/2) * b;
               
           end
           
           % evaluate the function at these points to find new values
           f_u = f(u);
           
           if f_u < f(x)
               v = w;
               w = x;
               x = u;
               
           else
               v = w;
               w = u;
               b = w;
               
           end
           
       %end
    end

end