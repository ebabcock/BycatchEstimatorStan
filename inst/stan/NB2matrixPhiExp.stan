data{
 int N;
 int Ncoef;
 array[N] int Y;
 real interceptSD;
 real coefficientSD;
 real phiPar;
 vector[N] Effort;
 matrix[N,Ncoef] xMatrix;
}
parameters{
 real  b0;
 vector[Ncoef] b;
 real<lower=0.00001,upper=100> phi;
}
transformed parameters{
  vector[N] logmu = b0 + xMatrix * b + log(Effort);
}
model{
  b0~normal(0,interceptSD);
  b~normal(0,coefficientSD);
  phi~exponential(phiPar);
  Y~neg_binomial_2_log(logmu,phi);
}
generated quantities {
  array[N] real LL;
  for(i in 1:N) {
   LL[i] = neg_binomial_2_log_lpmf(Y[i]|logmu[i],phi);
  }
}






