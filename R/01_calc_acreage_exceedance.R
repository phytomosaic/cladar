#####################################################################
#
#  GIS calculate acreage in each exceedance class
#
#    Rob Smith
#
#      12 July 2021
#
####   GNU General Public License, Version 3.0    ###################


### preamble
require(raster)
require(rgdal)


### data import (assumed to have values only within the polygon of interest)
r   <- raster('path/to/raster_file.tif')


### calculate acreage
m <- matrix(c(-Inf, -0.5, 1,   -0.5, 0.5, 2,   0.5, Inf, 3), ncol=3, byrow=T)
rc      <- reclassify(r, m)         # exceedance is below/at/above CL
frq     <- freq(rc)[,'count']       # frequencies
relfrq  <- round(frq / sum(frq), 3) # relative frequencies
acell   <- prod(res(rc)/1000)       # area of a single cell (km^2)
area_km <- frq * acell              # area in each exceedance class (km^2)


### summary of exceedances
cbind(frq, relfrq, area_km)


### save
...


### iterate
...


####    END    ####
