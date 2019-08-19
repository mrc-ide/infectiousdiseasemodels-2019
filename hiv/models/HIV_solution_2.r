##Differential equations

deriv(X) <- g * B - beta * X * Y/N - mu * X
deriv(Y) <- beta * X * Y/N-mu * Y - nu * Y
deriv(Z) <- (1 - g) * B-mu * Z

##Initialising equations

initial(X) <- g * init_susc
initial(Y) <- 100
initial(Z) <- (1 - g) * init_susc
init_susc <- 100000-100

##Other equations

N <- X + Y + Z

beta <- kappa * c

B <- alpha * N 	#entry rate, exponentially growing population
#B <- mu * N+nu * Y	#entry rate, constant population size - useful for model checking

prevalence1 <- Y/N
incidence1 <- beta * X * Y/N
incidence_rate1 <- incidence1/(X + Z)

#Outputs
output(prevalence) <- prevalence1
output(incidence) <- incidence1
output(incidence_rate) <- incidence_rate1

##Parameter values

g <- user(0.4)		#proportion at-risk (in X class)
c <-user(11)		#partner change rate
kappa <- user(0.1)	#per partner HIV transmission probability
duration_infection<-user(12) #mean duration of infection before death from HIV/AIDS
nu <- 1/duration_infection #mortality rate due to HIV/AIDS		
non_aids_mortality <- user(15.2)#crude mortality rate due to causes other than AIDS, per 1000 people
mu <- non_aids_mortality/1000#crude mortality rate due to causes other than AIDS, scaled to rate per person
birth_rate<-user(37.4) #birth rate per 1000 people
alpha <-birth_rate/1000 #birth rate scaled to per person
