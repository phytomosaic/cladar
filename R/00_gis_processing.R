#####################################################################
#
#  GIS pre-processing
#
#    Jeremy Ash
#
####   GNU General Public License, Version 3.0    ###################


### preamble
require(raster)
require(rgdal)


### data import
r   <- raster('path/to/raster_file.tif')
p   <- readOGR('admin_polygons')


### clip and save to file
mask(r, p, filename='path/to/save/cookie_cut.tif', format='GTiff')


### iterate


####    END    ####
