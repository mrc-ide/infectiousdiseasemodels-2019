##Differential equations

deriv(X) <- B - beta * X * Y/N - mu * X
deriv(Y) <- beta * X * Y/N-mu * Y - nu * Y

##Initialising equations

initial(X) <- 995
initial(Y) <- 5

##Other equations
N <- X + Y

beta <- kappa * c

B <- alpha * N 	#entry rate, exponentially growing population
#B <- mu * N+nu * Y	#entry rate, constant population size - useful for model checking

prevalence1 <- Y/N
Preveq1 <- 1 - 1/R01 #prevalence at equilibrium

R01 <- beta/(mu + nu)

incidence1 <- (beta * X * Y/N)/X

#Output
output(incidence) <- incidence1
output(prevalence) <- prevalence1
output(Preveq) <- Preveq1
output(R0) <- R01

##Parameter values

c <-user(2.4)		#partner change rate
kappa <- user(0.1)	#per partner HIV transmission probability
duration_infection<-user(12) #mean duration of infection before death from HIV/AIDS
nu <- 1/duration_infection #mortality rate due to HIV/AIDS		
non_aids_mortality <- user(15.2)#crude mortality rate due to causes other than AIDS, per 1000 people
mu <- non_aids_mortality/1000#crude mortality rate due to causes other than AIDS, scaled to rate per person
birth_rate<-user(37.4) #birth rate per 1000 people
alpha <-birth_rate/1000 #birth rate scaled to per person
#sigma <- if(t<=5) 1 else 12 #changing a parameter at a certain time point
