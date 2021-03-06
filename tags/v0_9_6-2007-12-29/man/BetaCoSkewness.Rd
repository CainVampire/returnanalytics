\name{BetaCoSkewness}
\alias{BetaCoSkewness}
\alias{BetaCoS}
\alias{SystematicSkewness}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ systematic skewness of an asset to an initial portfolio }
\description{
Beta CoSkewness is the beta of an asset to the skewness of an initial portfolio.  Used to determine diversification potential. also called "systematic skewness" or "systematic co-skewness" by several papers.
}
\usage{
BetaCoSkewness(Ra,Ri, na.rm = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Ra}{ return vector of asset being considered for addition to portfolio }
  \item{Ri}{ return vector of initial portfolio }
  \item{na.rm}{ TRUE/FALSE Remove NA's from the returns? }
}
\value{
systematic skewness of asset to an initial portfolio
}
\details{
    \deqn{S_{a,b}=\frac{CoS_{a,b}}{S_{a}}=\frac{\sum((R_{a}-\bar{R_{a}})(R_{b}-\bar{R_{b}})^{2})}{\sum(R_{a}-\bar{R_{a}})^{3}}}{BCoS=CoS(Ra,Rb)/skew(Ra)}
}
\references{
Martellini L., Vaissie M., Ziemann V., October 2005. Investing in Hedge Funds: Adding Value through Active Style Allocation Decisions. Edhec Risk and Asset Management Research Centre. Equation [5] p. 10

}
\author{ Brian G. Peterson }
\note{}
\seealso{
    \code{\link{CoSkewness}}
    \code{\link[fBasics]{skewness}}
}
\examples{
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ts }
\keyword{ multivariate }
\keyword{ distribution }
\keyword{ models }