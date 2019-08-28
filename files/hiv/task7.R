##Differential equations

deriv(X) <- g*B-beta*X*Y/N-mu*X
deriv(Y) <- beta*X*Y/N-mu*Y-nu*Y
deriv(Z) <- (1-g)*B-mu*Z

##Initial conditions

initial(X) <- g*init_susc
initial(Y) <- 5
initial(Z) <- (1-g)*init_susc
init_susc <- 995

##Other equations

N <- X+Y+Z

beta <- kappa*c

B <- alpha*N 	#entry rate, exponentially growing population
#B <- mu*N+nu*Y	#entry rate, constant population size - useful for model checking

##Parameter values

g <- user(0.4)		#proportion at-risk (in X class)
c <-user(11)		#partner change rate
kappa <- user(0.1)  	#per partner HIV transmission probability
nu <- user(0.0833)            #mortality rate per person per year due to HIV/AIDS (1/mean duration in years)		
mu <- user(0.0152)      #crude mortality rate due to causes other than AIDS, scaled to rate per person
alpha <-user(0.0374)    #birth rate scaled to per person

##Additional output

output(prevalence) <- Y/N
output(incidence) = beta*X*Y/N
output(incidence_rate) <- (beta*X*Y/N)/(X+Z)