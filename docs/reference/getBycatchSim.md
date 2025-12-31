# getBycatchSim Function to calculate total bycatch from one stan model object simulating the catches in R not stan, with prediction interval generated with GetMeanNbinom

getBycatchSim Function to calculate total bycatch from one stan model
object simulating the catches in R not stan, with prediction interval
generated with GetMeanNbinom

## Usage

``` r
getBycatchSim(
  mod1,
  logdat,
  matrixAll,
  modeledEffort = FALSE,
  effortSD = NULL,
  predictionInterval = predictionInterval,
  nsim = 1000,
  usePrior = FALSE,
  priors = list(interceptSD = 4, coefficientSD = 1, phiType = c("exponential",
    "normal")[1], phiPar = 1, raneffPar = 1),
  returnDraws = FALSE,
  useCode = "cmdstanr"
)
```

## Arguments

- mod1:

  stan fit object from cmdstanr or rstan

- logdat:

  Total effort data for expanding over

- matrixAll:

  Model matrix from total effort data

- modeledEffort:

  TRUE for effort being drawn from a normal with mean and SD, false for
  effort input by sample unit

- effortSD:

  Optional SD for effort if drawing froma noraml

- predictionInterval:

  TRUE for prediction interval, false for confidence interval

- nsim:

  Number of draws for calculation

- usePrior:

  TRUE to simulate from priors instead of using fit

- priors:

  Priors used in the model fit

- returnDraws:

  TRUE to return random draws

- useCode:

  "cmdstanr" or "rstan"

## Value

Returns lists of inputs and outputs
