x = [-1/2; -1/2; 0]
G = [-2, 0, 0, -1, -x(1);
    0, -2, 0, -1, -x(2);
    0, 0, 2, 0, 0;
    1, 1, 0, 0, 0;
    x(1), x(2), 0 ,0, 0]
lambda = [-0.5; -0.5]
mult = vertcat(x, lambda)

G * mult
