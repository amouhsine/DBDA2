#
# Convert package CSV files to RDA format
#

csvNames = list.files("inst/extdata",
                      pattern="\\.csv" )
rootNames = sub("\\.csv", "", csvNames)

for (rootName in rootNames) {

  # Unfortunately, some original file names contain dashes (-),
  # which won't work as R variables. So replace dashes with underscores (_).
  fixedName = gsub("-", "_", rootName)

  csvPath = file.path("inst/extdata", paste0(rootName, ".csv"))
  rdaPath = file.path("data", paste0(fixedName, ".rda"))

  try({
    cat("Reading", csvPath, "\n")
    temp = read.csv(csvPath,
                    stringsAsFactors=FALSE )
    assign(fixedName, temp)
    cat("Dimensions are", dim(temp), "\n")
    save(list=fixedName, file=rdaPath)
    cat("Wrote", rdaPath, "\n")
  })
}
