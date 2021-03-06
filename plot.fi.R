setMethod("plot", signature(x = "fi"),
          function (x, ylim = c(1, 10), yaxp = c(1, 10, 9), xlab = 'Samples',
                    ylab = 'FORAM Index', pch.urg = 25, pch.mrg = 21, pch.crg = 24,
                    bg.urg = 'red', bg.mrg = 'yellow', bg.crg = 'green', pt.cex = 1,
                    limits = TRUE, ...) {
            
            plot(x = X$PlotOrder, y = X$FI, ylim = ylim, axes = FALSE, xlab = xlab,
                 ylab = ylab, type = 'n', ...)
            
            par(las = 2)
            
            points(as.matrix(x$PlotOrder[x$FI <= 2]), as.matrix(x$FI[X$FI <= 2]),
                   pch = pch.urg, bg = bg.urg, cex = pt.cex)
            
            points(as.matrix(x$PlotOrder[X$FI > 2 & X$FI <= 4]),
                   as.matrix(x$FI[x$FI > 2 & X$FI <= 4]), pch = pch.mrg, bg = bg.mrg,
                   cex = pt.cex)
            
            points(as.matrix(x$PlotOrder[x$FI > 4]), as.matrix(x$FI[X$FI > 4]),
                   pch = pch.crg, bg = bg.crg, cex = pt.cex)
            
            axis(1, at = c(1:max(x$PlotOrder)), labels = attr(x, 'row.names'))
            
            axis(2, ylim = ylim, yaxp = yaxp)
            
            if (limits == TRUE)
              mtext(c('URG', 'MRG', 'CRG'), side = 4, at = c(1.5, 3, 5), col = 'gray',
                    las = 3)
            
            if (limits == TRUE)
              abline(h = 2, lty = 'dotted')
            
            if (limits == TRUE)
              abline(h = 4, lty = 'dotted')
          }
)