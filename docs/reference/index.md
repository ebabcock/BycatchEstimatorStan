# Package index

## All functions

- [`bycatchStanSim()`](https://ebabcock.github.io/BycatchEstimatorStan/reference/bycatchStanSim.md)
  : bycatchStanSim Function to run a set of negative binomial stan
  models to estimate bycatch taking a bycatchEstimator setup object as
  an input, and using simulation for effort if needed
- [`getBycatchDraws()`](https://ebabcock.github.io/BycatchEstimatorStan/reference/getBycatchDraws.md)
  : getBycatchDraws.
- [`getBycatchSim()`](https://ebabcock.github.io/BycatchEstimatorStan/reference/getBycatchSim.md)
  : getBycatchSim Function to calculate total bycatch from one stan
  model object simulating the catches in R not stan, with prediction
  interval generated with GetMeanNbinom
- [`getConvergence()`](https://ebabcock.github.io/BycatchEstimatorStan/reference/getConvergence.md)
  : Get convergence diagnostics
- [`getIC()`](https://ebabcock.github.io/BycatchEstimatorStan/reference/getIC.md)
  : getIC Function to extract WAIC and LOOIC from fitted stan model
  object
- [`getMeanNbinom()`](https://ebabcock.github.io/BycatchEstimatorStan/reference/getMeanNbinom.md)
  : getMeanNbinom Function for a random draw of size SampleUnits, summed
  to get the stratum estimate of bycatch.
- [`getMortPred()`](https://ebabcock.github.io/BycatchEstimatorStan/reference/getMortPred.md)
  : GetMorPred
- [`getResiduals()`](https://ebabcock.github.io/BycatchEstimatorStan/reference/getResiduals.md)
  : getResiduals Function to plot quantile residuals from a cmdstanr or
  rstan fit, using DHARMa
- [`getSummary()`](https://ebabcock.github.io/BycatchEstimatorStan/reference/getSummary.md)
  : getSummary Function to extract parameter summary table for
  coefficients and scale parameter
- [`mortalityStan()`](https://ebabcock.github.io/BycatchEstimatorStan/reference/mortalityStan.md)
  : mortalityStan Function to run binomial stan models to estimate
  probability of survival
- [`plotMortalityFunc()`](https://ebabcock.github.io/BycatchEstimatorStan/reference/plotMortalityFunc.md)
  : plotMortalityFunc Function to plot both bycatch and bycatch
  mortality
- [`plotPriorPosterior()`](https://ebabcock.github.io/BycatchEstimatorStan/reference/plotPriorPosterior.md)
  : plotPriorPosterior
- [`plotPriorPosteriorSims()`](https://ebabcock.github.io/BycatchEstimatorStan/reference/plotPriorPosteriorSims.md)
  : plotPriorPosteriorSims A function to plot Prior and Posterior
  predictive checks
- [`plotStan()`](https://ebabcock.github.io/BycatchEstimatorStan/reference/plotStan.md)
  : plotStan Function to plot annual total bycatch from the annual
  summary table
- [`priorSimulation()`](https://ebabcock.github.io/BycatchEstimatorStan/reference/priorSimulation.md)
  : priorSimulation Prior simulation from specified priors
- [`standardizeToObsdat()`](https://ebabcock.github.io/BycatchEstimatorStan/reference/standardizeToObsdat.md)
  : standardizeToObsdat Function to standardize numeric variables to
  means and variances from obsdat Apply this to logdat so that
  predictions will be correct if using numerical variables
