# BycatchEstimatorStan User Guide

This library runs a Bayesian version of the model-based bycatch
estimation procudure in the library BycatchEstimator. See the
BycatchEstimator User’s Guide for how to set up the data at
<https://ebabcock.github.io/BycatchEstimator/>. The source code is at
<https://github.com/ebabcock/BycatchEstimator>

To install, use the following code:

``` r
# install.packages("devtools")
#devtools::install_github("ebabcock/BycatchEstimator")
#devtools::install_github("ebabcock/BycatchEstimatorStan")
evalOption<-FALSE
```

Open all the libraries

``` r
library(BycatchEstimator)
library(MuMIn)
library(BycatchEstimatorStan)
# library(gridExtra)
# library(rstan)
# library(cmdstanr)
# library(loo)
# library(shinystan)
# library(ggmcmc)
# library(readxl)
# library(bayesplot)
# library(ggsci)
# library(flextable)
theme_set(theme_bw())

#source("~/github/bycatchEstimatorStan/R/printStanCode.r")
#source("~/github/bycatchEstimatorStan/R/bycatchStan.r")
```

Run example code from BycatchEstimator

``` r
obsdat<-droplevels(LLSIM_BUM_Example_observer[LLSIM_BUM_Example_observer$Year>2014 &LLSIM_BUM_Example_observer$fleet==2,])
logdat<-droplevels(LLSIM_BUM_Example_logbook[LLSIM_BUM_Example_logbook$Year>2014 & LLSIM_BUM_Example_logbook$fleet==2,])
setupObjBUM<-bycatchSetup(
  obsdat = obsdat,
  logdat = logdat,
  yearVar = "Year",
  obsEffort = "hooks",
  logEffort = "hooks",
  factorVariables = c("Year","area"),  
  numericVariables = NA, 
  EstimateBycatch = TRUE,
  logNum = NA,
  sampleUnit = "trips",
  baseDir = getwd(),
  runName = "LLSIMBUMtripExample",
  runDescription = "LLSIm BUM by trip, with 5% observer coverage",
  common = "Blue marlin",
  sp = "Makaira nigricans",
  obsCatch ="BUM",
  catchUnit = "number",
  catchType = "catch",
  reportType = "html"  
)
```

Look at the output html file to see whether there are any problems with
your data setup.

Now run BycatchStan

``` r
plotStan(BUMRun$yearSum)
```

Here is the model selection table

``` r
BUMRun$waictab
```
