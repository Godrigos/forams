\name{fi}
\alias{fi}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
fi(df, groups)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{df}{
%%     ~~Describe \code{df} here~~
}
  \item{groups}{
%%     ~~Describe \code{groups} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (df, groups) 
{
    Ps <- NA
    Po <- NA
    Ph <- NA
    for (i in 1:ncol(df)) {
        Ps[i] <- as.matrix(sum(df[i][groups == "Ps"])/sum(df[i]))
    }
    for (i in 1:ncol(df)) {
        Po[i] <- as.matrix(sum(df[i][groups == "Po"])/sum(df[i]))
    }
    for (i in 1:ncol(df)) {
        Ph[i] <- as.matrix(sum(df[i][groups == "Ph"])/sum(df[i]))
    }
    FI <- as.matrix((10 * Ps) + Po + (2 * Ph))
    FI2 <- cbind(as.matrix(1:ncol(df)), FI)
    colnames(FI2) <- c("PlotOrder", "FI")
    rownames(FI2) <- colnames(df)
    FI2 <- as.data.frame(FI2)
    class(FI2) <- "fi"
    return(FI2)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
