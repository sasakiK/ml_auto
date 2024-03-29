# Description -------------------------------------------------------------

#' @ Description:Rmarkdownを実行するためのスクリプト
#' @ Auther     :sasaki_K

# knit rmd ----------------------------------------------------------------

library(emayili)
library(tidyverse)

file_name <- commandArgs(trailingOnly = TRUE)[1]
password <- commandArgs(trailingOnly = TRUE)[2]

email <- envelope() %>%
  from("k.coobb@gmail.com") %>%
  to("k.coobb@gmail.com") %>%
  subject("実験は無事に終わりました!") %>% 
  body("結果を見てみましょう!") %>% 
  attachment(file_name)

smtp <- server(host = "smtp.gmail.com",
               port = 465,
               username = "k.coobb@gmail.com",
               password = password)
smtp(email, verbose = TRUE)


