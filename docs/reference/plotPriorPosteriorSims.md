# plotPriorPosteriorSims A function to plot Prior and Posterior predictive checks

plotPriorPosteriorSims A function to plot Prior and Posterior predictive
checks

## Usage

``` r
plotPriorPosteriorSims(
  stanSum,
  modelNum,
  stanObj,
  setupObj,
  modeledEffort = FALSE,
  effortSD = NULL,
  useCode
)
```

## Arguments

- stanSum:

  Object output by `bycatchStanSim`

- modelNum:

  Which model number to look at (matches waictab rows)

- stanObj:

  The rstan or cmdstanr fit object

- setupObj:

  The BycatchEstimator setup object

- modeledEffort:

  TRE if effort is drawn from a normal

- effortSD:

  Effort SD column in obsdat if drawing from noraml

- useCode:

  "cmdstanr" or "rstan"
