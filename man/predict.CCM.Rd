\name{predict.CCM}
\alias{predict.CCM}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Classification from a CCM correlation matrix
}
\description{
Classification as a function of a CCM correlation matrix that contains the correlations between test and training samples
}
\usage{
\method{predict}{CCM}(object, y, func = mean, ret.scores = FALSE, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{object}{
	a CCM correlation matrix object obtained from \code{\link{create.CCM}}
}
  \item{y}{
	classes corresponding to the training samples (columns) of \sQuote{object}
}
  \item{func}{
	the function that determines how a test sample is classified, defaulting to \var{mean}. See details.
}
  \item{ret.scores}{
	If set to TRUE then a matrix of results by class are returned (see details); otherwise a vector of classifications/predictions is returned (the default) 
}
  \item{\dots}{
	Additional arguments to \code{func}
}
}
\details{
    The function \code{func} can be any R function whose first argument is a vector of correlations (x). The CCM assigns each test sample the class that maximizes func(x). If \code{func} is \var{mean} (the default), the classification is the class with the highest mean correlation. Other useful values for \code{func} include \var{median} and \var{max}. 

If \code{ret.scores} is TRUE, then a matrix of results by class is returned, where the i(th) column corresponds to the i(th) test sample and each row corresponds to a possible class. Entry (i,j) contains func(x), where \code{x} is a vector of correlations between the i(th) test sample and all training samples with the class in row j. 
}
\value{
The test sample classifications as a vector or a matrix of results by class.
}
\author{
Garrett M. Dancik and Yuanbin Ru
}
\note{
If the \var{max} function is used for \code{func}, then the CCM is identical to a 1-nearest neighbor classifier with distance = 1 - r, where 'r' is the correlation (pearson or spearman) specified in the call to \code{create.CCM}  
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{create.CCM}}
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
data(data.expr)
data(data.gender)

## split dataset into training / testing ##
train.expr = data.expr[,1:20]
test.expr = data.expr[,21:40]
train.gender = data.gender[1:20]
test.gender = data.gender[21:40]

## CCM using spearman correlation ##
K = create.CCM(test.expr, train.expr, method = "spearman")
## predict based on the class with the highest mean correlation (the default) ##
p = predict(K, train.gender)
table(pred = p, true = test.gender) # check accuracy

## CCM using pearson correlation ##
K = create.CCM(test.expr, train.expr, method = "pearson")
## predict based on the class with the maximum correlation
p = predict(K, train.gender, func = max)
table(pred = p, true = test.gender) # check accuracy
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ methods }
