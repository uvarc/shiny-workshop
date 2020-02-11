library(schrute)
library(dplyr)
library(tidytext)
library(imager)
library(stringr)

# Set working directory
setwd("~/shiny-valentine")

# Load The Office dataset
data <- theoffice

# List of desired characters
characters <- c("Angela","Creed","Dwight","Jim","Kelly","Michael","Oscar","Pam","Phyllis","Ryan")

# Tokenize data (split text column by word)
token.data <- data %>% unnest_tokens(word, text_w_direction)

# Filter by character and the word love
love_data <- token.data %>% filter(character %in% characters) %>% filter(word == "love")

# Count words in sentences
love_data <- love_data %>% mutate(word_count = str_count(text, "\\w+"))

# Filter out rows with 10 or fewer words
love_data <- love_data %>% filter(word_count <= 10)

# Select random row from love_data
my_valentine <- love_data[sample(1:nrow(love_data),1),]

# Load character image for valentine
img <- load.image(paste0("www/", my_valentine$character, ".jpg"))

# Display the valentine
plot(img, axes = F)
title(my_valentine$text)