#####################################################################
#
#  Render all PDFs
#
#    Rob Smith
#
#      27 July 2021
#
####   GNU General Public License, Version 3.0    ###################


require(rmarkdown)


### obtain list of units (polygons)
x <- read.csv('./data_raw/list_of_units.csv')

### render the document, for one single example unit
rmarkdown::render('./inst/report_template.Rmd',
                  params = list(unit = c('Shawnee NF')))

### iterate
for (i in x$unit_id) {
     cat(i,'... ')
     fnm <- paste0('./pdf/',i,'_report.Rmd')
     rmarkdown::render(
          input       = './inst/report_template.Rmd',
          output_file = fnm,
          params      = list(unit = c('Shawnee NF'))
     )
}


####    END    ####
