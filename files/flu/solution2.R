# initial conditions
initial(S) <- N - E_0
initial(E) <- E_0
initial(I) <- 0
initial(R) <- 0
initial(J) <- 0

# equations
deriv(S) <- -beta * S * I / N
deriv(E) <- beta * S * I / N - gamma * E
deriv(I) <- gamma * E - sigma * I
deriv(R) <- sigma * I
deriv(J) <- gamma * E

# parameter values
R_0 <- user()
R_0_closure <- user()
L <- user()
D <- user()
E_0 <- user(1) # default value
N <- user(370)

# convert parameters
gamma <- 1 / L
sigma <- 1 / D
beta <- if (t > 18 && t < 25) R_0_closure * sigma else R_0 * sigma


