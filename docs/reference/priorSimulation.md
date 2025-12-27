# priorSimulation Prior simulation from specified priors

priorSimulation Prior simulation from specified priors

## Usage

``` r
priorSimulation(
  stanObj,
  coefs,
  nsim = 1000,
  priors = list(interceptSD = 10, coefficientSD = 1, phiType = c("exponential",
    "normal")[1], phiPar = 1)
)
```

## Arguments

- stanObj:

  Fitted cmdstanr or rstan object

- coefs:

  Names of coefficients to simulate

- nsim:

  Number of simulations

- priors:

  List of priors
