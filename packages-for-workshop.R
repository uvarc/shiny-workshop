# packages that  should be installed
package_list <- c(
  "devtools",        # you likely have this
  "tidyverse",       # ditto
  "rmarkdown",       # ditto
  "knitr",           # ditto
  "shiny",           # ditto
  "shinyWidgets",    # workshop specific
  "shinyjs",         # workshop specific
  "shinythemes",     # workshop specific
  "shinydashboard",  # workshop specific
  "flexdashboard",   # workshop specific
  "bslib",           # workshop specific
  "thematic",        # workshop specific"
  "miniUI",          # workshop specific
  "learnr",          # workshop specific
  "plotly",          # workshop specific
  "revealjs",        # just for compiling slide collection
  "mosaic",          # some data sets, etc
  "DT"               # data tables
  )

# Run this 
 install.packages(package_list)
