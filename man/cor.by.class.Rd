\name{cor.by.class}
\alias{cor.by.class}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Finds within class correlations
}
\description{
Finds within class correlations between samples of each class type,  which is useful for identifying extreme observations and assessing whether CCM is appropriate for classification.
}
\usage{
cor.by.class(x, y, method = "pearson", use = "complete")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
	data matrix with variables in rows and samples in columns
}
  \item{y}{
	classes corresponding to the columns of \code{x}
}
  \item{method}{
	the type of correlation to use, either 'pearson' (the default) or 'spearman'
}
  \item{use}{
	instructions for handling missing values. See details and \code{cor}. All values are used by default.
}
}
\details{
Calculates correlations between each pair of observations within each class. The correlation between an observation and itself is ignored.

The default correlation is the Pearson product moment correlation. If \code{method} is 'spearman', then the Spearman's rank correlation is used, which is the Pearson correlation calculated using the ranks of the data.

Correlations are calculated class-wise on the matrix of observations of each class separately. Therefore, missing values may be handled differently for different classes.
}
\value{
A list with each element a vector of correlations between samples of a different class.
}
\author{
Garrett M. Dancik and Yuanbin Ru
}
%% ~Make other sections like Warning with \section{Warning }{....} ~
\examples{
data(data.expr)
data(data.gender)
K = cor.by.class(data.expr, data.gender)
## visualize the results ##
boxplot(K, xlab = "gender")
}
