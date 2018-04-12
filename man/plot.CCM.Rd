\name{plot.CCM}
\alias{plot.CCM}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Plot CCM correlations
}
\description{
Constructs a boxplot of correlations by class for a test sample
}
\usage{
\method{plot}{CCM}(x, y, index,  no.plot, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
	a CCM correlation matrix as obtained from \code{\link{create.CCM}}
}
  \item{y}{
	classes corresponding to the training samples (columns) of 'K'
}
  \item{index}{
	the test sample to include in the plot, corresponding to the row of 'K'. }
  \item{no.plot}{
	if TRUE then plotting is turned off and a list of correlations is returned
}
  \item{\dots}{
	additional arguments for \code{\link{boxplot}}
}
}
\details{
	This function generates a boxplot of correlations between the training samples and a specific test sample by class
}
\value{
if \code{no.plot} is TRUE, then a list of correlations by class 
}
\author{
Garrett M. Dancik and Yuanbin Ru
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{boxplot}}; 
\code{create.CCM} for creating the CCM correlation matrix
}
\examples{
     ## load data ##
     data(data.expr)
     data(data.gender)
     
     ## split dataset into training / testing ##
     train.expr = data.expr[,1:20]
     test.expr = data.expr[,21:40]
     train.gender = data.gender[1:20]
     test.gender = data.gender[21:40]
     
     ## CCM using spearman correlation ##
     K = create.CCM(test.expr, train.expr, method = "spearman")
     
     ## plot correlations for the 3rd observation ##
     plot(K, train.gender, index = 3, main = "correlations for obs #3", 
	       xlab = "gender", ylab = "correlation") 

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ hplot }
\keyword{ methods }
