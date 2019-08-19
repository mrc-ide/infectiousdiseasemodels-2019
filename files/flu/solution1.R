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
R_0 <- user(1.5)
L <- user(1)
D <- user(1)
E_0 <- user(1) # default value
N <- user(370)

# convert parameters
gamma <- 1 / L
sigma <- 1 / D
beta <- R_0 * sigma

#Output
output(onset) <- gamma*E