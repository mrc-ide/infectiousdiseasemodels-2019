deriv(W) <- ((deltaH0 + deltaHinfinity * CHi * mbeta * L) / (1 + CHi * mbeta * L)) * mbeta * L - (rhoW * W) 
deriv(L) <- beta * theta0 - (rhoL * L)

theta0 <- (deltaV0 / c) * ( 1 - (1 + W/(2*kv))^(-kv) + (1 + W * (2 - exp(-c * aV * zi)) / (2 * kv) )^(-kv) - (1 + W * (1 - exp(- c * aV * zi)) / (2*kv) ) ^(-kv) )
zi <- epsilon / rhoM
rhoW <- sigmaW + muH

initial(W) <- 10
initial(L) <- 0

deltaHinfinity <- 0.00299
CHi <- 0.00586
deltaH0 <- aH*sH
aH <- 0.8
sH <- 0.089
muH <- 0.02
sigmaW <- 0.1
deltaV0 <- 0.0166
CV0 <- 0.0205
alphaV0 <- 0.5968
beta <- 31.3
aV <- 0.448
c <- 0.026
epsilon <- 0.667
rhoM <- 0.82
rhoL <- 161.2

kv <- user(0.25)
mbeta <- 174750