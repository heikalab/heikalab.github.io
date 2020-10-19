library(classInt)     ## Class intervals
library(spdep)
library(RColorBrewer) ## Visualization
require(maptools)

plotmymap = function(plotvar, nclr, title.name, shape){
  
  ## classify variable for color
  plotclr = rev(brewer.pal(nclr,"RdBu"))
  class = classIntervals(plotvar, nclr, style="quantile")
  colcode = findColours(class, plotclr)
  ## plot the map
  plot(shape, col=colcode)
  title(main=title.name)
  legend("topleft", legend=names(attr(colcode, "table")),
         fill=attr(colcode, "palette"), cex=0.6, bty="n")
}

## Local Moran function for plotting
## http://isites.harvard.edu/fs/docs/icb.topic923307.files/R%20code%20for%20Lab%20Ex%206.txt
# signif: statistical significance level for the local Moran's                
mylocalMI = function(plotvar, nb, shape, main="LISA Cluster Map", verbose=TRUE, zero.policy=NULL, signif=0.01)
{
  mI_local <- localmoran(plotvar, nb, zero.policy = zero.policy)   
  ## calculate the local Moran's for each location
  if(verbose)
  {
    print(mI_local)                                    
    # the output of localmoran() is a n by 1 matrix of local Moran's
    print(summary(mI_local))
    
  }
  
  ## Create a LISA Cluster Map
  quadrant <- vector(mode="numeric",length=nrow(mI_local))
  # centers the variable of interest around its mean        
  cCMEDV <- plotvar - mean(plotvar)     
  # centers the local Moran's around the mean
  C_mI <- mI_local[,1] - mean(mI_local[,1])    
        
  ## Define the high-high, low-low
  quadrant[cCMEDV >0 & C_mI>0] <- 4      
  # low-high and high-low categories
  quadrant[cCMEDV <0 & C_mI<0] <- 1      
  quadrant[cCMEDV <0 & C_mI>0] <- 2
  quadrant[cCMEDV >0 & C_mI<0] <- 3
  # places non-significant Moran's in the category "0"
  quadrant[mI_local[,5]>signif] <- 0     
  
  brks <- c(0,1,2,3,4)
  colors <- c("white","blue",rgb(0,0,1,alpha=0.4),rgb(1,0,0,alpha=0.4),"red")
  plot(shape,border="lightgray",
       col=colors[findInterval(quadrant,brks,all.inside=FALSE)])
  box()
  legend("bottomright",
         legend=c("insignificant","low-low","low-high","high-low","high-high"),
         fill=colors,bty="n",cex=0.7,y.intersp=1,x.intersp=1)
  title(main)
}
