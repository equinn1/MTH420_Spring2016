//model file for week2 parameter estimation exercise
data {
  int N;                        //sample size
  int n;                        //number of trials
  int<lower=0,upper=n> y[N];    //data values
}
parameters {
  real<lower=0,upper=1> theta;          //probability of success
}
model {
  theta ~ beta(1,1);            //uniform prior for alpha
  y ~ binomial(n,theta);        //process data
}
generated quantities{
  int<lower=0,upper=n> yp[10];
  for (i in 1:10){
    yp[i]<-binomial_rng(n,theta);
  }
  
}