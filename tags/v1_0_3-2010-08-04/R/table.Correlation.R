table.Correlation <-
function (Ra, Rb, ...)
{# @author Peter Carl

    # DESCRIPTION:
    # This is a wrapper for calculating correlation and significance against
    # each column of the data provided.

    # Inputs:
    # Assumes that Ra and Rb are sequenced exactly the same.

    # Output:
    # A data table of correlation and corresponding p-value for each column
    # in Rb.

    # FUNCTION:

    Ra = checkData(Ra)
    Rb = checkData(Rb)

    # Get dimensions and labels
    columns.a = ncol(Ra)
    columns.b = ncol(Rb)
    columnnames.a = colnames(Ra)
    columnnames.b = colnames(Rb)

    # Calculate
    for(column.a in 1:columns.a) { # for each asset passed in as R
        for(column.b in 1:columns.b) { # against each asset passed in as Rb
            merged.assets = merge(Ra[,column.a,drop=FALSE], Rb[,column.b,drop=FALSE])
            merged.assets = na.omit(merged.assets) # leaves the overlapping period

            htest = cor.test(merged.assets[,1], merged.assets[,2], ...)
            values = cbind(htest$estimate, htest$p.value,htest$conf.int[1],htest$conf.int[2])

            if(column.a == 1 & column.b == 1) {
                result.df = data.frame(Value = values)
                rownames(result.df) = paste(columnnames.a[column.a], columnnames.b[column.b], sep = " to ")
            }
            else {
                nextrow = data.frame(Value = values)
                rownames(nextrow) = paste(columnnames.a[column.a], columnnames.b[column.b], sep = " to ")
                result.df = rbind(result.df, nextrow)
            }
        }
    }

    colnames(result.df) = c("Correlation","p-value","Lower CI","Upper CI")

    result.df

}

###############################################################################
# R (http://r-project.org/) Econometrics for Performance and Risk Analysis
#
# Copyright (c) 2004-2010 Peter Carl and Brian G. Peterson
#
# This R package is distributed under the terms of the GNU Public License (GPL)
# for full details see the file COPYING
#
# $Id$
#
###############################################################################