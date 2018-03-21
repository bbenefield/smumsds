# Load libraries
library(tseries)

# Declare functions
Vol <- function(d, logrets) {
  var = 0
  lam = 0
  varlist <- c()
  for (r in logrets) {
    lam = lam*(1-1/d) + 1
    var = (1-1/lam)*var + (1/lam)*r^2
    varlist <- c(varlist, var)
  }
  sqrt(varlist)
}

# Get SNP data
SNPdata <- get.hist.quote('IBM',quote="Close")

# Return
SNPret <- log(lag(SNPdata) - log(SNPdata))

# Volatility
SNPvol <-  sd(SNPret) * sqrt(250) * 100

# Weighted results
volest <- Vol(10, SNPret)
volest2 <- Vol(30, SNPret)
volest3 <- Vol(100, SNPret)

# Plot
plot(volest, type="l")
lines(volest2, type="l", col="red")
lines(volest3, type="l", col="blue")
