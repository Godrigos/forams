\name{she}
\alias{she}

\title{
SHE Analysis
}
\description{
This function implements the SHE method in community abundance datasets.
}
\usage{
\S4method{she}{she}(df, method)
}

\arguments{
  \item{df}{
a numerical data frame with samples as columns and \emph{taxa} as rows.
}
  \item{method}{
the method to be used, (\code{"abundance"} or \code{"frequency"}), defaults to \code{"abundance"}.
}
}
\details{
This method is intended to determine boundaries between abundance biozones, based in raw abundance (SHEbi) or in frequency (SHEbip) (\cite{Buzas et al. 1998, Wilson et al. 2010}).
The custom plot produces a line plot with points on a ln abscissa and uses the \code{axis} function, so a complete customization (i.e. \code{side}) of the axes is not possible at this moment.
}
\value{
 \item{S }{richness values.}
 \item{H }{shannon diversity values.}
 \item{E }{equitability values.}
 \item{N or L }{number of specimens (N) or sites rank based on specimens frequency (L).}
}
\references{
Buzas, M.A. & Hayek, L.A.C. (1998). SHE analysis for biofacies identification. \emph{Journal of Foraminiferal Research} \bold{28} (3), 233-239.

Wilson, B., Dawe, R., Gopee, A., Grant, S., Kissoon, A., Young, T., Noon, C., McLean, A. & Singh, K. (2010). Determining Boundaries between Abundance Biozones Using Minimal Equipment. \emph{International Journal of Ecology} \bold{2010}, 1-14.
}
\author{
Rodrigo Aluizio
}
\note{
This function implements great part of the process, but a small part must be caried out for the researcher when defining where to cut biozones before reruning the test.
For more details on other graphic prameters see \code{\link{par}}.
}
\examples{
data(LF)
MySHE <- she(LF, "abun")
plot(MySHE)

## The function is currently defined as
function (df, method = "abundance") 
{
    SHE <- new("she")
    if (!is.na(pmatch(method, "abundance"))) 
        method <- "abundance"
    METHODS <- c("abundance", "frequency")
    method <- pmatch(method, METHODS)
    if (is.na(method)) 
        stop("Invalid method, type 'abundance' or 'frequency'.")
    if (method == 1) {
        S <- NA
        H <- NA
        E <- NA
        N <- NA
        S[1] <- as.matrix(specnumber(t(df)))[1]
        H[1] <- as.matrix(diversity(t(df), "shannon"))[1]
        E[1] <- exp(H[1])/S[1]
        N[1] <- as.matrix(colSums(df))[1]
        for (i in 2:ncol(df)) {
            S[i] <- as.matrix(specnumber(t(cbind(matrix(rowSums(df[1:i]), 
                dimnames = list(c(rownames(df)), paste("AC", 
                  i, sep = ""))), df[-1:-i]))))[1]
            H[i] <- as.matrix(diversity(t(cbind(matrix(rowSums(df[1:i]), 
                dimnames = list(c(rownames(df)), paste("AC", 
                  i, sep = ""))), df[-1:-i])), "shannon"))[1]
            E[i] <- exp(H[i])/S[i]
            N[i] <- as.matrix(colSums(cbind(matrix(rowSums(df[1:i]), 
                dimnames = list(c(rownames(df)), paste("AC", 
                  i, sep = ""))), df[-1:-i])))[1]
        }
        SHE@bi <- as.data.frame(cbind(S, H, E, N))
        colnames(SHE@bi) <- c("S", "H", "E", "N")
        rownames(SHE@bi) <- colnames(df)
        return(SHE)
    }
    if (method == 2) {
        XF <- as.data.frame(matrix(nrow = nrow(df), ncol = ncol(df)))
        rownames(XF) <- rownames(df)
        for (i in 1:ncol(df)) {
            XF[, i] <- as.matrix(df[1:nrow(df), i]/colSums(df)[i])
        }
        S <- NA
        H <- NA
        E <- NA
        L <- NA
        S[1] <- as.matrix(specnumber(t(XF)))[1]
        H[1] <- as.matrix(diversity(t(XF), "shannon"))[1]
        E[1] <- exp(H[1])/S[1]
        L[1] <- 1
        for (i in 2:ncol(XF)) {
            S[i] <- as.matrix(specnumber(t(cbind(matrix(rowSums(XF[1:i]), 
                dimnames = list(c(rownames(XF)), paste("AC", 
                  i, sep = ""))), XF[-1:-i]))))[1]
            H[i] <- as.matrix(diversity(t(cbind(matrix(rowSums(XF[1:i]), 
                dimnames = list(c(rownames(XF)), paste("AC", 
                  i, sep = ""))), XF[-1:-i])), "shannon"))[1]
            E[i] <- exp(H[i])/S[i]
            L[i] <- (i + 1)
        }
        SHE@bi <- as.data.frame(cbind(S, H, E, L))
        colnames(SHE@bi) <- c("S", "H", "E", "L")
        rownames(SHE@bi) <- colnames(df)
        return(SHE)
    }
  }
}

\keyword{math}
\keyword{arth}
