---
date: 2015-12-14 07:43:30
title: Structure 'Sort by Q' explained
slug: structure-sort-by-q-explained
excerpt: STRUCTURE is a popular software used by biologists to infer the population structure of organisms using genetic markers. Barplots in STRUCTURE have an option to sort individuals by Q. We explore the 'Sort by Q' option using R and Excel to figure out what it does.
category:
- Code
- Research
tags:
- Population Genetics
- R
- Scientific Graphs
classes: wide
image: "/assets/images/posts/2015/2015-12-14-structure-sort-by-q-explained/featured.png"
images: "/assets/images/posts/2015/2015-12-14-structure-sort-by-q-explained/"
---

I currently use STRUCTURE 2.3.4 on Windows. A typical assignment output file for _K_=2 looks like below. [Here](structure-file.txt) is the structure file I use.

{% 
  include figure
  image_path="structure-file.png"
  alt="structure-file"
  caption="<b>Fig.1:</b> A typical Structure assignment output."
%}

We can use the plotting functionality within STRUCTURE to view the assignment results as a barplot. See fig below. The individuals are ordered in the same order as the input file when selecting the 'Original order' option. There is another option to sort individuals called 'Sort by Q'. What does this actually do?

{% 
  include figure
  image_path="bp-structure-unsorted.png"
  alt="bp-structure-unsorted"
  caption="<b>Fig.2:</b> Barplot in STRUCTURE software showing original order of individuals (top) and 'Sort by Q' order (bottom)."
%}

One might reasonably assume that the individuals are sorted by one of the assignment clusters. But, that is not the case. We will try to plot the data manually and investigate this option. The structure output file used can be downloaded [here](structure-file.txt). This is the same as that linked earlier.

We use the R package `pophelper` to convert structure files to R dataframe, `ggplot` package for plotting and `reshape2` package for data restructuring. The data is read into R as a dataframe with two columns Cluster1 and Cluster2 with assignment values.

```r
#install pophelper library
#library(devtools)
#install_github('royfrancis/pophelper')

#load packages
library(ggplot2)
library(reshape2)
library(pophelper)

#read data to dataframe
df <- readQ("structure-file.txt")[[1]]
head(df)


> head(df)
Cluster1 Cluster2
1 0.965 0.035
2 0.977 0.023
3 0.961 0.039
4 0.975 0.025
5 0.974 0.026
6 0.982 0.018
```

Now we create a function to create the plot.

```r
#create function to generate plots
plotfn <- function(df=NULL, filename=NULL){
#reshape to long format
df$num <- 1:nrow(df)
df1 <- reshape2::melt(df, id.vars="num")
#reversing order for cosmetic reasons
df1 <- df1[rev(1:nrow(df1)), ]

#plot
p <- ggplot(df1, aes(x=num, y=value, fill=variable))+
geom_bar(stat="identity", position="fill", width=1, space=0)+
scale_x_continuous(expand = c(0, 0))+
scale_y_continuous(expand = c(0, 0))+
labs(x = NULL, y = NULL)+
theme_grey(base_size=7)+
theme(legend.position = "none",
axis.ticks = element_blank(),
axis.text.x = element_blank())

ggsave(filename=filename, plot=p, height=4, width=12, dpi=150, units="cm")
}

#plot unsorted plot
plotfn(df=df, filename="bp-r-unsorted.png")
```

Here is the assignment barplot in the original order.

{% 
  include figure
  image_path="bp-r-unsorted.png"
  alt="bp-r-unsorted"
  caption="<b>Fig.3:</b> Assignment barplot recreated in R. Individuals are in original order."
%}

Now we create two plots. One figure where the table is sorted by Cluster1 and second figure where the table is sorted by Cluster2.

```r
#sort table by cluster1
df_c1 <- df[order(df[, 1]), ]
plotfn(df=df_c1, filename="bp-r-sortedc1.png")

#sort table by cluster2
df_c2 <- df[order(df[, 2]), ]
plotfn(df=df_c2, filename="bp-r-sortedc2.png")
```

{% 
  include figure
  image_path="bp-r-sortedc1.png"
  alt="bp-r-sorted-c1"
  caption="<b>Fig.4:</b> Assignment barplot in R sorted by cluster 1."
%}

{% 
  include figure
  image_path="bp-r-sortedc2.png"
  alt="bp-r-sorted-c2"
  caption="<b>Fig.5:</b> Assignment barplot in R sorted by cluster 2."
%}

Both of these plots do not resemble the 'Sort by Q' option in Structure software. They look like mirror images only because it's _K_=2. For _K_>2, they would look quite different. Anyway, the 'Sort by Q' option does a bit more. For each individual, the max assignment value is picked to create a new column called 'max'. The cluster number with the max assignment is created as a new column called 'match'. The the whole table is sorted ascending by 'match' and descending by 'max'. Here is the R code.

```r
#pick max cluster, match max to cluster
maxval <- apply(df, 1, max)
matchval <- vector(length=nrow(df))
for(j in 1:nrow(df)) matchval[j] <- match(maxval[j], df[j, ])

#add max and match to df
df_q <- df
df_q$maxval <- maxval
df_q$matchval <- matchval

#order dataframe ascending match and decending max
df_q <- df_q[with(df_q,  order(matchval, -maxval)), ]

#remove max and match
df_q$maxval <- NULL
df_q$matchval <- NULL

#plot
plotfn(df=df_q, filename="bp-r-sortedq.png")
```

And that gives us the plot we are looking for. The same plot created in the STRUCTURE software.

{% 
  include figure
  image_path="bp-r-sortedq.png"
  alt="bp-r-sorted-q"
  caption="<b>Fig.6:</b> Assignment barplot in R sorted by Q."
%}

Here is also an **[Excel file](structure-plot.xlsx)** with the calculations, if R is not your thing.

{% 
  include figure
  image_path="structure-excel.png"
  alt="structure-excel"
  caption="<b>Fig.7:</b> Assignment barplot and 'Sort by Q' calculation in Excel."
%}

You can always verify by checking the individual number (#) with the individual numbers in the STRUCTURE software (set to 'Plot in multiple lines').

That's all for now. I hope this was useful for all those who were as confused as I was.
