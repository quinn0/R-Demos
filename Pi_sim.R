#### Simulations ####

#### for PI ####

N <- 1000000

pi_sim <- function(trials = N, print_prog = T) 
{
  ###print_prog will show the approximation after every 1000 attempts
  success <- 0
  attempt <- 0
  while(attempt <= trials)
  {
    x <- runif(1, min = -1, max = 1)
    y <- runif(1, min = -1, max = 1)
    
    if(x**2 + y**2 <= 1)
    {
      success <- success + 1
      
    }
    attempt <- attempt + 1
      if(attempt %% 1000 == 0 && print_prog)
      {
        print(paste0(4*success/attempt))
        
      }
  }
  

}


######### Area under the curve ###########


N <- 1000000

z_sim <- function(trials = N, shape = 1, print_prog = T, score = 1) 
{
  ### print_prog will show the approximation after every 1000 attempts
  ### shape naively designates the factor of the quadratic ie shape * x^2 <= 1

  success <- 0
  attempt <- 0

  while(attempt <= trials)
  {
    ### creating arbitrary rectangle limits
    x <- runif(1, min = -shape, max = score) #integrate from a to b
    y <- runif(1, min = 0, max = shape)
    
    
    if((shape * x**2) <= y)  

      ###Students could: 1) play with a simplification like quadratic to get to close to normal curve
      ################## 2) compare this to other distributions
      ################## 3) answer questions about the general form and see how it relates to the 'area' generated
    {
      success <- success + 1
      
    }
    
    attempt <- attempt + 1
    
    if((attempt %% 1000 == 0) && print_prog)
    {
      print(paste0(success/attempt))
      
    }
  
  }
  print(paste0(success/attempt))

}




