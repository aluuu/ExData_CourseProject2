library(dplyr, warn.conflicts = F)
if(!dir.exists("./data")){
    dir.create("./data")
}
dataset_archive <- "./data/dataset.zip"
if(!file.exists(dataset_archive)){
    download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", destfile = dataset_archive)
    unzip(zipfile = dataset_archive, exdir = "./data/")
}
NEI <- readRDS("./data/summarySCC_PM25.rds")
