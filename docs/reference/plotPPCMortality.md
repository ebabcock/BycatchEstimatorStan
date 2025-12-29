# plotPPCMortality A function to plot Prior and Posterior predictive checks of a binomial model

plotPPCMortality A function to plot Prior and Posterior predictive
checks of a binomial model

## Usage

``` r
plotPPCMortality(y, modelNum, mortalityStanList, useCode)
```

## Arguments

- y:

  Mortality data column from original data

- modelNum:

  Which model number to use

- mortalityStanList:

  The list of rstan or cmdstanr fit objects

- useCode:

  "cmdstanr" or "rstan"
