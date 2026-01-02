data{
 int N;
 int Ncoef;
 array[N] int Y;
 real interceptSD;
 real phiPar;
 vector[N] Effort;
}
parameters{
 real  b0;
 real<lower=0.00001,upper=100> phi;
}
transformed parameters{
  vector[N] logmu = b0 + log(Effort);
}
model{
  b0~normal(0,interceptSD);
  phi~normal(0,phiPar);
  Y~neg_binomial_2_log(logmu,phi);
}
generated quantities {
  array[N] real LL;
  for(i in 1:N) {
   LL[i] = neg_binomial_2_log_lpmf(Y[i]|logmu[i],phi);
  }
}




