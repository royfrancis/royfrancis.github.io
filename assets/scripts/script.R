
#' @title create_content
#' @description Creates directories and files for new content (post/page)
#' @param slug String denoting slug
#' @param date Date string (optional) as YYYY-MM-DD
#' @param type String. posts or pages.
#' @param path_base String. Base path to jekyll site.
#' @return Does not return anything
#' @details
#' Creates directory in pages or posts. Creates a directory in images. Creates an Rmd file in pages or posts and opens it for editing.
#' 
create_content <- function(slug="",date=NULL,type="posts",path_base="~/github/royfrancis.github.io"){
  
  if(is.null(date)) {
    date <- Sys.time()
  } else {
    date <- as.Date(date)
  }

  dt <- format(date, "%Y-%m-%d %H:%M:%S")
  d <- format(date, "%Y-%m-%d")
  y <- format(date, "%Y")
  
  path_content <- file.path(path_base,"_posts",y,paste0(d,"-",slug))
  path_file <- file.path(path_content,paste0(d,"-",slug,".Rmd"))
  path_image <- paste0("/assets/images/",type,"/",y,"/",d,"-",slug,"/")
  path_image_full <- file.path(path_base,path_image)
  
  x <- paste0(
  '---
date: ',dt,'
title: ',slug,'
slug: ',slug,'
excerpt: This is a description.
featured: featured.jpg
category:
 - Photography
 - Code
 - Travel
 - Research
 - Craft
 - Design
 - Web
 - Craft
tags:
 - R
 - Data Visualisation
 - Road Trip
 - Sweden
 - Forest
 - Scientific Graphs
toc: true
toc_sticky: true
images: "',path_image,'"
published: false
---

```{r,include=FALSE}
library(knitr)
knitr::opts_knit$set(base.dir="',path_image_full,'")
```
'
)
  
  dir.create(path_content)
  message(paste("Directory created:",path_content))
  dir.create(path_image_full)
  message(paste("Directory created:",path_image_full))
  message(paste("File created:",path_file))
  writeLines(x,path_file)
  file.edit(path_file)
}


add_figure <- function(path=NULL,alt=NULL,caption=NULL){
  k <- paste0('
  {% 
    include figure
    image_path="',path,'"
    alt="',alt,'"
    caption="',caption,'"
  %}
  ')
  return(cat(k))
}

add_gallery <- function(folder=NULL,caption=NULL,dim=NULL){
  k <- paste0('
  {% 
    include pixture.html
    folder="',folder,'"
    dim="',dim,'"
    caption="',caption,'"
  %}
  ')
    return(cat(k))
}

