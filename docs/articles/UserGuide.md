# BycatchEstimatorStan User Guide

This library runs a Bayesian version of the model-based bycatch
estimation procudure in the library BycatchEstimator. See the
BycatchEstimator User’s Guide for how to set up the data at
<https://ebabcock.github.io/BycatchEstimator/>. The source code is at
<https://github.com/ebabcock/BycatchEstimatorStan> and the User’s Guide
for the Bayesian version is at
<https://ebabcock.github.io/BycatchEstimatorStan/>.

The code requires either cmdstanr (Gabry et al. (2025)) or rstan (Stan
Development Team (2025)) to run the MCMC algorithm, preferably cmdstanr.
You must install cmdstanr before you install BycatchEstimatorStan,
following the instructions here <https://mc-stan.org/cmdstanr/>.

To install BycatchEstimatorStan, use the following code:

``` r
# install.packages("devtools")
devtools::install_github("ebabcock/BycatchEstimator")
devtools::install_github("ebabcock/BycatchEstimatorStan")
```

Open all the libraries

``` r
library(BycatchEstimator)
library(MuMIn)
library(BycatchEstimatorStan)
```

Run example code from BycatchEstimator

``` r
obsdat<-droplevels(LLSIM_BUM_Example_observer[LLSIM_BUM_Example_observer$Year>2014 &LLSIM_BUM_Example_observer$fleet==2,])
logdat<-droplevels(LLSIM_BUM_Example_logbook[LLSIM_BUM_Example_logbook$Year>2014 & LLSIM_BUM_Example_logbook$fleet==2,])
setupObjBUM<-bycatchSetup(
  obsdat = obsdat,
  logdat = logdat,
  yearVar = "Year",
  obsEffort = "sets",
  logEffort = "sets",
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
modelsToRun<-c("y~Year","y~1")
useCode="cmdstanr"
BUMRun<-bycatchStanSim(setupObjBUM,
                        modelsToRun=modelsToRun,
                        spNum=1,  #which species to run in input is multispecies
                        modeledEffort=FALSE,
                        priors =  list(interceptSD=10,
                                      coefficientSD=1,
                                      phiType=c("exponential","normal")[1],
                                      phiPar=1),
                        StanOutDir=NULL,  #Null to use base directory from SetupObj
                        useCode=useCode)
```

The bycatchStanSim function prints its output to an rds file, so you can
read it back in later to make plots and look at diagnostics.

``` r
#Specify directory with bycatch Estimator results
outDir<-setupObjBUM$bycatchInputs$outDir
# Date of bycatch estimator run
estimatorDate<-Sys.Date()
# Date of stan run
stanDate<-Sys.Date()
# Read in bycatchEstimator setup
setupObj<-readRDS(paste0(outDir,"/",estimatorDate,"_BycatchSetupSpecification.rds"))
spNum<-1
#Stan output directory
StanOutDir<-paste0(outDir,"/","Bluemarlincatch")
# Read in stan run summary files
stanSum<-readRDS(paste0(StanOutDir,
                         "/STAN",stanDate,"StanOutputs.rds"))
```

The following code takes either the output that was just read in or the
outputs from this section and looks at more diagnostics.

``` r
#Choose outputs to use
stanSum<-BUMRun
setupObj<-setupObjBUM
```

Plot the annual bycatch estimates

``` r
plotStan(stanSum$yearSum)
```

Here is the model selection table

``` r
stanSum$waictab
```

Pick AIC best model

``` r
modelNum<-which(stanSum$waictab$Dwaic==0) #To get WAIC best
```

Read in the corresponding Stan model object (these are deleted from the
environment to save space)

``` r
stanObj<-readRDS(BUMRun$stanRunFiles[[modelNum]])
```

Plot residuals

``` r
getResiduals(stanSum, 
             stanObj,
             modelNum,
             setupObj,
             useCode=useCode)
```

Plot prior and posterior densities of parameters

``` r
plotPriorPosterior(stanSum, 
                   stanObj,
                   useCode=useCode) 
```

Plot prior and posterior draws of bycatch

``` r
plotPriorPosteriorSims(stanSum=stanSum,
                       modelNum=modelNum,
                       stanObj=stanObj,
                       setupObj=setupObj,
                       modeledEffort = FALSE,
                       effortSD = NULL,
                       useCode=useCode)  
```

Convergence diagnostics

``` r
getConvergence(stanObj,
               useCode=useCode)
```

Parameter summary table

``` r
getSummary(stanSum,
           stanObj,
           modelNum,
           setupObj,
           spNum=1,
           useCode=useCode) 
```

Code to run survival/mortality model

With simulated survival data (arbitrary values). If there are any
numerical variables, they need to be standardized using the mean and sd
from the observer data for consistency. This data has year as a
category, so standardization is not needed.

``` r
mortData<-read.csv("data/SimulatedMortality.csv")
```

Run multiple models to get the best one. Doesn’t calculate predicted
probability of survival (predictP=FALSE)

``` r
modelsToRun=c("y~1","y~Species","y~Year","y~Year+Species")
MortResults<-mortalityStan(mortData=mortData,
                          predData = NULL,
                          modelsToRun=modelsToRun,
                          factorVariables=c("Species","Year"),
                          numericVariables=NA,
                          mortalityColumn="dead",
                          outDir=getwd(),
                          runName="Simulated",
                          predictP=FALSE,
                          useCode=useCode  
)
```

The outputs include the model selection and diagnostics tables.

``` r
MortResults$waictab
MortResults$diagTable
mortModelNum<-which(MortResults$waictab$Dwaic==0)
```

This function will give posterior predictive checks for the probability
model.

``` r
plotPPCMortality(y=mortData$dead,
                       modelNum=1,
                       mortalityStanList=MortResults$stanRuns,
                       useCode=useCode)  
```

With predictions for each year for BUM, best model only

``` r
predData<-obsdat %>%
  distinct(Year)%>%
  mutate(Species="BUM")
predData
MortResultsP<-mortalityStan(mortData=mortData,
                           predData = predData,
                           modelsToRun=modelsToRun[mortModelNum],
                           factorVariables=c("Species","Year"),
                           numericVariables=NA,
                           mortalityColumn="dead",
                           outDir=getwd(),
                           runName="Simulated",
                           predictP=TRUE,  
                           useCode=useCode  
)
```

Combine mortality and bycatch estimate to get bycatch mortality or
survival

Estimates total bycatch mortality

``` r
mortalityEsts<-getMortPred(stanSum=stanSum,
                           modelNum=which(stanSum$waictab$Dwaic==0),
                           stanObj=stanObj,
                           Species="BUM",
                           setupObj=setupObj,
                           modeledEffort = FALSE,
                           effortSD = NULL,
                           useCode=useCode,
                           mortResults=MortResultsP,
                          mortModelNum=1)

plotMortalityFunc(mortalityEsts,Species="BUM")
head(mortalityEsts)
```

Gabry, Jonah, Rok Češnovar, Andrew Johnson, and Steve Bronder. 2025.
*Cmdstanr: R Interface to ’CmdStan’*. <https://mc-stan.org/cmdstanr/>.

Stan Development Team. 2025. “RStan: The R Interface to Stan.”
<https://mc-stan.org/>.
