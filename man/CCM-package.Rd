\name{CCM-package}
\alias{CCM-package}
\alias{CCM}
\docType{package}
\title{
Correlation classification method (CCM)
}
\description{
Classification method that classifies an observation based on its correlation with observations having known class labels. There are two main functions. The function \code{create.CCM} creates a correlation matrix of correlations between training and test samples. Both Pearson's and Spearman's rank-based correlations are supported.  The function \code{predict.CCM} assigns class labels to test observations according to the class that has the highest mean correlation by default. However, any (user-defined) function in addition to the mean (e.g., median, max) can be specified. 

For a complete list of functions, use 'library(help="CCM")'
}
\details{
\tabular{ll}{
Package: \tab CCM\cr
Type: \tab Package\cr
Version: \tab 1.2\cr
Date: \tab 2018-04-05\cr
License: \tab GPL(>=2)\cr
LazyLoad: \tab yes\cr
}

}
\author{
Garrett M. Dancik and Yuanbin Ru\cr
Maintainer: Garrett M. Dancik <dancikg@easternct.edu>
}
\keyword{ package }
\seealso{
   \code{\link{create.CCM}};
   \code{\link{predict.CCM}};
   \code{\link{plot.CCM}}
}
\examples{
     ## load data ##
     data(data.expr)
     data(data.gender)

     ## check within class correlations ##
     ## outliers may be caused by poor quality ##
     ## observations or may indicate CCM is not appropriate ##
     K = cor.by.class(data.expr, data.gender)
     ## visualize the results ##
     boxplot(K, xlab = "gender")
     
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
    
     ## plot correlations for the 3rd observation ##
     plot(K, train.gender, index = 3, main = "correlations for obs #3", 
	       xlab = "gender", ylab = "correlation") 

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ methods }
\keyword{ hplot }
