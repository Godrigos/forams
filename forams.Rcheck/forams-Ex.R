pkgname <- "forams"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
options(pager = "console")
library('forams')

assign(".oldSearch", search(), pos = 'CheckExEnv')
cleanEx()
nameEx("Factors")
### * Factors

flush(stderr()); flush(stdout())

### Name: Factors
### Title: FORAM Index Factors
### Aliases: Factors
### Keywords: datasets

### ** Examples

data(Factors)
summary(Factors)



cleanEx()
nameEx("LF")
### * LF

flush(stderr()); flush(stdout())

### Name: LF
### Title: FORAM Index and SHE dataset
### Aliases: LF
### Keywords: datasets

### ** Examples

data(LF)
str(LF)



cleanEx()
nameEx("NB")
### * NB

flush(stderr()); flush(stdout())

### Name: NB
### Title: ABC Method Dataset
### Aliases: NB
### Keywords: datasets

### ** Examples

data(NB)
str(NB)



cleanEx()
nameEx("abc-class")
### * abc-class

flush(stderr()); flush(stdout())

### Name: abc-class
### Title: Class '"abc"'
### Aliases: abc-class
### Keywords: classes

### ** Examples

showClass("abc")



cleanEx()
nameEx("abc")
### * abc

flush(stderr()); flush(stdout())

### Name: abc
### Title: Abundance and Biomass Comparison Method
### Aliases: abc
### Keywords: arith math

### ** Examples

data(NB)
MyABC <- abc(NB)
plot(MyABC)



cleanEx()
nameEx("fi-class")
### * fi-class

flush(stderr()); flush(stdout())

### Name: fi-class
### Title: Class '"fi"'
### Aliases: fi-class
### Keywords: classes

### ** Examples

showClass("fi")



cleanEx()
nameEx("fi")
### * fi

flush(stderr()); flush(stdout())

### Name: fi
### Title: The FORAM Index
### Aliases: fi
### Keywords: arth math

### ** Examples

data(LF)
data(Factors)
MyFI <- fi(LF, Factors)
plot(MyFI)



cleanEx()
nameEx("forams-package")
### * forams-package

flush(stderr()); flush(stdout())

### Name: forams-package
### Title: Foraminifera and Community Ecology Analyses
### Aliases: forams-package forams
### Keywords: package

### ** Examples

data(NB)
data(Factors)
data(LF)
# ABC
plot(abc(NB))
# FORAM Index
plot(fi(LF, Factors))
# SHE
plot(she(LF))



cleanEx()
nameEx("plot.abc")
### * plot.abc

flush(stderr()); flush(stdout())

### Name: plot.abc
### Title: Plot function for Abundance and Biomass Comparison Method
###   objects.
### Aliases: plot.abc plot,abc-method
### Keywords: dplot hplot

### ** Examples

data(NB)
MyABC <- abc(NB)
plot(MyABC)



cleanEx()
nameEx("plot.fi")
### * plot.fi

flush(stderr()); flush(stdout())

### Name: plot.fi
### Title: Custom plot function for FORAM Index results
### Aliases: fi.plot plot,fi-method
### Keywords: dplot hplot

### ** Examples

data(LF)
data(Factors)
MyFI <- fi(LF, Factors)
plot(MyFI)



cleanEx()
nameEx("plot.she")
### * plot.she

flush(stderr()); flush(stdout())

### Name: plot.she
### Title: Custom plot function for SHE Analysis objects
### Aliases: plot.she plot,she-method
### Keywords: dplot hplot

### ** Examples

data(LF)
MySHE <- she(LF, "abun")
plot(MySHE)



cleanEx()
nameEx("she-class")
### * she-class

flush(stderr()); flush(stdout())

### Name: she-class
### Title: Class '"she"'
### Aliases: she-class
### Keywords: classes

### ** Examples

showClass("she")



cleanEx()
nameEx("she")
### * she

flush(stderr()); flush(stdout())

### Name: she
### Title: SHE Analysis
### Aliases: she
### Keywords: math arth

### ** Examples

data(LF)
MySHE <- she(LF, "abun")
plot(MySHE)



### * <FOOTER>
###
cat("Time elapsed: ", proc.time() - get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
