deriv(W)<-((deltaH0 + deltaHinfinity * CH * ABR * L)/(1 + CH * ABR * L)) * ABR * L - (sigmaW +  muH) * W

deriv(M)<-((1/2) * phi * F) * W - (sigmaM + muH) * M

deriv(L)<-(deltaV0/(1 + CV0 * M)) * beta * M - (sigmaL + muV + alphaV0 * M + (aH/g)) * L

initial(W) <- 10
initial(M) <- 0
initial(L) <- 0

deltaHinfinity <- 0.00299

CH <- 0.00586

deltaH0 <- aH*sH
aH <- user(0.8)
sH <- user(0.089)
muH <- 0.02
sigmaW <- 0.1
sigmaM <- 0.8
sigmaL <- 104
phi <- 1
F <- 0.6674
deltaV0 <- 0.0166
CV0 <- 0.0205
alphaV0 <- 0.5968
ABR <- user(15000)
beta <- h/g
h <- user(0.5)
g <- 0.0096
muV <- 52

