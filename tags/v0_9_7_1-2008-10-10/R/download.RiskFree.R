`download.RiskFree` <-
function(start = "1998-01-01", end = NULL, compression = c("m","d"))
{ # @ author Peter Carl

    #  Download returns of the risk free asset

    # Required inputs are just start and stop dates.
    # Outputs a table of estimates of risk-free returns

    # FUNCTION:


    # Download the risk free data, in this case, the 13-WEEK TREASURY BILL (^IRX)
    # from finance.yahoo.com
    compression = compression[1]

    stopifnot("package:tseries" %in% search() || require("tseries",quietly=TRUE))

    x = get.hist.quote("^irx", start = start, end = end, quote = "Close", compression = compression)

    # Yahoo returns yield data as an annualized percentage;
    rf = x/100/12
    colnames(rf) = "13-week US Treasury Bill (^IRX)"
    rf
}

###############################################################################
# R (http://r-project.org/) Econometrics for Performance and Risk Analysis
#
# Copyright (c) 2004-2008 Peter Carl and Brian G. Peterson
#
# This library is distributed under the terms of the GNU Public License (GPL)
# for full details see the file COPYING
#
# $Id: download.RiskFree.R,v 1.9 2008-06-25 03:35:23 peter Exp $
#
###############################################################################
# $Log: not supported by cvs2svn $
# Revision 1.8  2008-06-02 16:05:19  brian
# - update copyright to 2004-2008
#
# Revision 1.7  2007/04/14 13:55:46  brian
# - standardize enumerated arguments,
# - assign default value to a string string if no value passed in to avoid warnings
#
# Revision 1.6  2007/03/20 11:27:32  brian
# - add copyright, license, and CVS Log
#
# Revision 1.5 2007-03-16 peter
# - now delivers a zoo object instead of a data.frame
#
# Revision 1.4 2007-03-04 14:59:27 brian
# - minor changes to pass R CMD check
#
# Revision 1.3 2007-02-27 21:38:02 brian
# - change compression param to an enumerated default
#
# Revision 1.2 2007-02-27 16:32:58 peter
# - added compression as attribute
#
# Revision 1.1 2007-02-27 16:29:04 peter
# - added function
###############################################################################