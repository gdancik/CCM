\name{create.CCM}
\alias{create.CCM}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Creates a CCM correlation matrix 
}
\description{
Creates a CCM correlation matrix that calculates correlations between test and training samples or between each test sample
}
\usage{
create.CCM(X.test, X.train = NULL, method = "pearson", use = "everything", verbose = 1)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{X.test}{
	matrix of test samples with rows containing variables and columns containing observations
}
  \item{X.train}{
	optional matrix of training samples with rows containing variables and columns containing observations
}
  \item{method}{
	the type of correlation to use, either 'pearson' (the default) or 'spearman'
}
  \item{use}{
	instructions for handling missing values. See details and \code{cor}. All values are used by default.
}
  \item{verbose}{
	A value of '0' will suppress output
}
}
\details{

The default correlation is the Pearson product moment correlation. If \code{method} is 'spearman', then the Spearman's rank correlation is used, which is the Pearson correlation calculated using the ranks of the data.

If \code{X.train} is NULL then correlations are calculated between each column of \code{X.test}, but the correlation between a sample and itself will be assigned the value \var{NA}.
  
When \code{X.train} is specified, correlations are calculated sequentially between each test observation and all training observations using \code{apply}. Note that if missing values are present, they may be handled differently for different test samples.
}
\value{
 A CCM correlation matrix with element (i,j) as follows: if \code{X.train} is not NULL, then the correlation between the i(th) test sample and the j(th) training sample; otherwise the correlation between the i(th) and j(th) test samples, with NA along the diagonal. 
}
\author{
Garrett M. Dancik and Yuanbin Ru
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{cor}}, the function used to calculate correlations;
\code{\link{predict.CCM}}, for classification based on the CCM matrix;
\code{\link{plot.CCM}} for plotting correlations of test samples
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

### leave-one-out cross validation on entire dataset ###
K = create.CCM(data.expr, method = "spearman")
p = predict(K, data.gender)
table(pred = p, true = data.gender) # check accuracy
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ methods }
