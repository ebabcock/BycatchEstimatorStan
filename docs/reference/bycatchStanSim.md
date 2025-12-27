# bycatchStanSim Function to run a set of negative binomial stan models to estimate bycatch taking a bycatchEstimator setup object as an input, and using simulation for effort if needed

bycatchStanSim Function to run a set of negative binomial stan models to
estimate bycatch taking a bycatchEstimator setup object as an input, and
using simulation for effort if needed

## Usage

``` r
bycatchStanSim(
  setupObj,
  modelsToRun = NULL,
  spNum = 1,
  stanModel = "nbinom2",
  priors = list(interceptSD = 10, coefficientSD = 1, phiType = c("exponential",
    "normal")[1], phiPar = 1),
  modeledEffort = FALSE,
  effortSD = NULL,
  predictionInterval = TRUE,
  StanOutDir = NULL,
  useCode = "cmdstanr"
)
```

## Arguments

- setupObj:

  List output from a rund of BycatchEstimator::bycatchSetup

- modelsToRun:

  Character vector of models to run, e.g. c("y~Year","y~1")

- spNum:

  Number of the species in the original bycatchSetup run,

- stanModel:

  Type of likelihood to use, currently only negative binomial 2

- priors:

  List of priors.

- modeledEffort:

  TRUE/FALSE for whether effort is normally distributed with a mean and
  SD

- effortSD:

  Name of effortSD variable in logdat if used.

- predictionInterval:

  TRUE to esimate prediction interval rather than confidence interval

- StanOutDir:

  Directory for output. NULL defaults to same directory as
  BycatchEstimator outputs

- useCode:

  "stanr" or "cmdstanr"

## Value

Returns lists of all the inputs, as well as a model summary table with
LOOIC and WAIC values and a vector with paths of the .rds files
containing the individual model stan files, and a dataframe of annual
bycatch estimates suitable for plotting
