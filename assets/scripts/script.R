
#' @title create_content
#' @description Creates new content for jekyll site
#' @param slug String denoting slug
#' @param type String. posts or pages.
#' @param path_base String. Base path to jekyll site.
#' @return Does not return anything
#' @details
#' Creates directory in pages or posts. Creates a directory in images. Creates an Rmd file in pages or posts and opens it for editing.
#' 
create_content <- function(slug="",type="posts",path_base="~/github/test-mm"){
  
  dt <- format(Sys.time(), "%Y-%m-%d %H:%M:%S")
  d <- format(Sys.time(), "%Y-%m-%d")
  y <- format(Sys.time(), "%Y")
  
  path_content <- file.path(path_base,"_posts",y,paste0(d,"-",slug))
  path_file <- paste0(path_content,"/",d,"-",slug,".Rmd")
  path_image <- paste0("/assets/images/",type,"/",y,"/",d,"-",slug,"/")
  
  x <- paste0(
  '---
date: ',dt,'
title: ',slug,'
slug: ',slug,'
excerpt: Liquid cheatsheet and demo
featured: featured.jpg
category:
 - Code
 - Craft
 - Design
 - General
 - Photography
 - Research
 - Travel
 - Web
tags:
 - Jekyll
 - Blogging
 - R
toc: true
toc_sticky: true
images: "',path_image,'"
---

```{r,include=FALSE}
library(knitr)
knitr::opts_knit$set(base.dir="',file.path(path_base,path_image),'")
```
'
)
  
  dir.create(path_content)
  message(paste("Directory created:",path_content))
  dir.create(path_image)
  message(paste("File created:",path_file))
  file.edit(path_file)
  message(paste("Directory created:",path_image))
  writeLines(x,path_file)
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

