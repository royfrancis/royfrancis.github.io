---
date: 2016-04-16 18:24:42
title: Which file compression to use on Linux?
slug: file-compression-use-linux
excerpt: This is a quick comparison of some of the data compression and decompression formats on Linux. The idea is to compare compression/decompression time and compression size difference using seven compression formats on five different file types.
category:
- Research
tags:
- Bash
- Image Analysis
- NGS
classes: wide
image: "assets/images/posts/2016/2016-04-16-file-compression-use-linux/featured.jpg"
images: "assets/images/posts/2016/2016-04-16-file-compression-use-linux/"
---

Seven different compression formats (7z, bzip2, gzip, lrzip, lz4, xz and zip) are tested using ten different compression commands (7za, bzip2, lbzip2, lrzip, lz4, pbzip2, gzip, pigz, xz and zip) on five different file types (fastq, mp3 tar archive, mp4 movie file, random text file and a tiff stack) for compression ratio and time. bzip2 compression using the command lbzip2 and pbzip2 comes out as the winner due to high compression ratio, speed and multi-threading capabilities.

<!-- read more -->

Five different data files were tested: a fastq text file, mp3 tar archive, an mp4 movie file, a randomly generated text file and a tiff image stack. Some properties of the files: fastq file (403 MB, 1.56 million reads), mp3 tar archive (390 MB, a tar archive composed of four tar archives each with 6 mp3 tracks of size 10MB to 32MB), mp4 file (340 MB), text file (400MB, created using (`base64 /dev/urandom | head -c 419430400 > text.txt`) and tiff stack (404MB, 1380 frames, 640 x 480 px, sequence of zebrafish larvae swimming in a microtitre plate).  For clarity, fastq files are text files containing next generation sequencing data and tiff stacks are used for image analysis using [ImageJ](https://imagej.nih.gov/ij/), for example.

Seven different compression formats were tested: **7z**, **bzip2**, **gzip**, **lrzip**, **lz4**, **xz** and zip using ten different compression commands: **7za**, **bzip2**, **lbzip2**, **pbzip2**, **gzip**, **pigz**, **lrzip**, **xz** and **zip**. For decompression, the same commands were used except for zip where **unzip** was used. The **7za** command by default compresses to the **7z** format but also allows exporting to **bzip2**, **gzip** and **zip**. **lbzip2** and **pbzip2** are multi-threaded versions of **bzip2**. Similarly, **pigz** is the multi-threaded version of **gzip**.

All commands were run on a Scientific Linux cluster with 8 cores and a total of 24GB of RAM. All commands used the default settings/switches. Most of these commands allow the user to set the level of compression but this was not changed. By running on 8 cores, the methods were free to utilize the 8 available cores if they could.

{%
  include figure
  image_path="compression-time.png"
  alt="compression-time"
  caption="Total time used by each format/command for each file type."
%}

The x-axis shows the different file types. The y-axis shows the total time taken (in seconds) for compression plus decompression. The colour of the bar denotes format/command. The shorter the bars, the faster the command is. **lz4** seems to be the fastest for all file types. **lbzip2**, **pbzip2** and **pigz** are also extremely fast for all file types taking around 15 secs or so. **7z** and **xz** seems to be pretty slow taking more than 2 mins for all file types.

{%
  include figure
  image_path="compression-diff.png"
  alt="compression-diff"
  caption="File size comparison between original file and compressed file for each format/command for each file type. A smaller value means higher compression."
%}

The x-axis shows the different file types. The y-axis shows the percentage size difference between the original file and the compressed file. The colour of the bar denotes format/command. The shorter the bars, the smaller the compressed file is. The compression ratio is drastically different depending on the file type. fastq files show the highest compression with **7z**, **lrz** and **xz** showing the best compression. For mp4 files, no compression was observed with any of the formats. The tiff stack had varying levels of compression with different formats but generally show high compression. Even for the same file types, compressed file size greatly varies with the content within the file.

{%
  include figure
  image_path="summary-spots-common.png"
  alt="summary-spots-common"
  caption="Scatterplot showing scaled times and scaled file size difference for each file type."
%}

The x-axis shows scaled file size difference and the y-axis shows scaled time. Separate sub-plots show different file types. The different compression formats are shown in ten different colours. On both axes, smaller value is better. A format with shortest time and smallest compressed file size is desirable. The plot quadrant/area is coloured to indicate best, good, intermediate and bad formats. R function `rescale()` from `scales` package was used to rescale time and file size difference to values between 0 and 1 across all file types.

{%
  include figure
  image_path="compression-score.png"
  alt="compression-score"
  caption="Summary score comparison for each format/command for each file type. Score is an arbitrary value calculated from scaled time and scaled compression size difference. A larger value is better."
%}

A summary score was calculated from the scaled total time and scaled file size difference. 1 was subtracted from all values to invert the values. Now a larger value is better than a smaller value. And then the inverted scaled value for each format was added to produce the summary score. The x-axis shows the different file types. The y-axis shows the summary score. The score takes into account speed and well as level of file compaction and is comparable across file types. A larger score is better.

Multi-threaded **bzip2** commands such as **lbzip2**, **pbzip2** have the best scores for all file types especially for text files. Parallel **gzip** command **pigz** also has high score. **lrz** shows a curiously high score for mp3 file. The mp4 movie file does not seem to reduce in size at all with any compression format, therefore, it might be pointless to compress them in the first place. **7z** has generally low scores as they it is much slower than others. For tiff-stacks, **7z** has a pretty high score due to the extremely high file size reduction.

The overall winner in this **particular** test would be **bzip2** compression using the command **lbzip2** or **pbzip2** as it is extremely fast, multi-threaded, has high compression ratio and allows random access. A multi-threaded **7z** tool might be a game changer. **7z** tool for windows (**7zip**) supports multi-threading on windows. A multi-threaded version of **xz** called **[pixz](https://github.com/vasi/pixz)** is available but not tested here. **bzip2** also has a parallel version specifically for clusters called the [mpibzip2](http://compression.ca/mpibzip2/).

The versions of softwares used here were: [7za](http://www.7-zip.org/) (9.20), [bzip2](http://www.bzip.org/) (1.0.5), gzip (1.3.12), [lbzip2](http://lbzip2.org/) (2.5), [lrzip](https://github.com/ckolivas/lrzip) (0.621), [lz4](http://cyan4973.github.io/lz4/) (r131), [pbzip2](http://compression.ca/pbzip2/) (1.1.12), [pigz](http://zlib.net/pigz/) (2.3.3), [xz](http://tukaani.org/xz/) (4.999.9beta) and zip (3.0). The basic bash commands used to compress and decompress the files are shown below.

```bash
#compression
7za a -y -t7z file.7z file;
bzip2 -qk file;
gzip -cq file > file.gz;
lbzip2 -qkz file;
lrzip -q file -o file.lrz;
lz4 file file.lz4;
pbzip2 -qkz file;
pigz -kq file;
xz -zkq file;
zip -q file.zip file;

#decompression
7za x -y file.7z;
bzip2 -dk file.bz2;
gzip -qdc file.gz > file;
lbzip2 -dkq file.bz2;
lrzip -dq file.lrz;
lz4 -d file.lz4;
pbzip2 -dk file.bz2;
pigz -dk file.gz;
xz -dk file.xz;
unzip file.zip;
```

Of course this is by no means the bottom line. There are lot more aspects to dig into such as ability to compress streams, encryption, the underlying algorithm (LZMA etc), indexability, memory usage etc. The whole comparison can be repeated by changing the compression level switches within these commands which might change the outcome. Memory consumption was not measured or monitored in this test. The way a function is parallelized can be different. For instance, one file can be split to be run on multiple cores simultaneously (case 1) or if multiple files are provided, each core works on one single file in parallel (case 2). Given that information, if only one file is provided to a parallel function programmed as case 2, only one core is utilized and there is no added benefit from multiple cores. And of course, there are numerous other compression algorithms, formats and commands out there.
