# Description -------------------------------------------------------------

#' @ Description:Rmarkdownを実行するためのスクリプト
#' @ Auther     :sasaki_K

# knit rmd ----------------------------------------------------------------

group_name <- commandArgs(trailingOnly = TRUE)[1]
current_time <- commandArgs(trailingOnly = TRUE)[2]

output_path <- paste("output/experiment_",current_time,"/",sep="")

rmarkdown::render(input = "modeling.Rmd",
                  output_dir = output_path,
                  output_file = paste("modeling_", 
                                      group_name, ".html", sep = ""))

