---
date: 2017-03-19 21:05:26
title: Running ImageJ on a Linux cluster
slug: running-imagej-linux-cluster
excerpt: A quick tutorial on running ImageJ on a Linux cluster.
category:
- Code
- Research
tags:
- Image Analysis
- ImageJ
classes: wide
image: "assets/images/posts/2017/2017-03-19-running-imagej-linux-cluster/featured.jpg"
images: "assets/images/posts/2017/2017-03-19-running-imagej-linux-cluster/"
---

I use [ImageJ](https://imagej.nih.gov/ij/) for many of my image analysis needs. My desktop computer runs Windows 7 and it has pretty solid specs with Core i7 processor and 16GB RAM. I recently had to handle some large tiff stacks (4-5gb) and it simply wouldn't work on my desktop as I constantly ran into 'out of memory' errors. So I decided to run them on a computing cluster instead since I have access to one. Running on a cluster might be useful when handling data with large memory requirements or to perform computations on numerous files in parallel by distributing load to multiple cores. It took me a while to figure out how to get things to work, so I thought I would make a record of it. And this might hopefully be useful to others.

<!-- more -->
***

The computing cluster runs Linux OS CentOS 7. The cluster uses the [SLURM](https://en.wikipedia.org/wiki/Slurm_Workload_Manager) system for job submissions. I have set up a directory structure is as follows:


    home
    +--img/
       +--from/
       +--to/
       +--work/
       +--programs/
       +--scripts/


I have downloaded the ImageJ Java executable for [Linux](https://imagej.nih.gov/ij/download.html) and copied it to the programs directory.

## Substacking tiff stacks

In this example, the script performs a simple basic operation: Open a tiff-stack from a source directory (from), subset the stack (skip frame1, keep frames 2 to end) and write the new file to a destination directory (to). And this will be performed in batch for all files in the source directory. In this example, the file will be processed one after the other (serial) and not in parallel.

I have two script files: a bash script file (*tifftosubstack.sh*) and an ImageJ macro file (*tifftosubstack.ijm*) in my scripts directory.

My *tifftosubstack.sh* bash script looks like below:

```bash
#!/bin/bash

#SBATCH -A accountname
#SBATCH -p core
#SBATCH -n 3
#SBATCH -t 2:00:00
#SBATCH -J tifftoss

echo "Tiff to Substack"

#run imagej script
echo "Running ImageJ ..."
/home/programs/fiji-linux-64/ImageJ-linux64 --headless -macro /home/img/scripts/tifftosubstack.ijm

echo "End of Script"
```

The batch script just runs the ImageJ executable along with the ImageJ macro file. The SBATCH lines are only relevant if the script is submitted as a SLURM job. It doesn't matter where the bash script is run because there are no relative links. And my ImageJ macro script looks as below:

```bash
// ImageJ batch script to substack tiff stack
// 2016 Roy Mathew Francis

//set directories
dirsource = "/home/img/from/";
dirresult = "/home/img/to/";

setBatchMode(true);
list = getFileList(dirsource);
print("======================================================");
print("~~ ImageJ Tiff Substack ~~");
for (i=0; i<list.length; i++)
  {
    print("------------------------------------------------------");
    print("Processing "+(i+1)+" of "+list.length+"...");
    spath = dirsource+list[i];

    //open tiff image
    print("Opening "+spath);
    open(spath);
    title = getTitle();
    imgorig = getImageID();

    //substack slice 2 to end
  selectImage(imgorig);
  print("Slices: "+nSlices);
  run("Make Substack...", "  slices=2-"+nSlices);

  //save tiff file
  imgsub = getImageID();
  selectImage(imgsub);
    saveAs("Tiff", dirresult+title);
    print(dirresult+title+" saved.");

    //close all
    close("*.tif");
  }

print("======================================================");
eval("script","System.exit(0);");
```

The ijm script is a loop that reads each file in the source directory, creates a substack (frame 2 to end of stack) and writes it out to the destination directory. The ijm file can be modified to perform other kinds of ImageJ processing. Once the two scripts are ready, verify that the paths are correct and set execute permissions on them.

```bash
chmod +x tifftosubstack.sh
```

Then run the bash script.

```bash
./tifftosubstack.sh
```

If your current directory is not scripts, then use the full path to execute the bash script. Once the execution is complete, the new tiff stack will be in the 'to' directory.


## Substacking compressed tiff stacks


This is an example where the loop is created in the bash script instead. The operation is same as before except that we start with compressed tiff stacks (gzipped). The steps will be as follows: the file is copied from source directory (from) to a temporary working directory (work), uncompressed, processed in ImageJ and exported to destination directory (to), and finally compressed. This will be performed in batch for all files in the source directory and the files will be processed one after the other (serial) and not in parallel.

I have two script files: a bash script file (*tifftosubstackcompress.sh*) and an ImageJ macro file (*tifftosubstackcompress.ijm*).

My *tifftosubstackcompress.sh* bash script looks like below:

```bash
#!/bin/bash

#SBATCH -A accountname
#SBATCH -p core
#SBATCH -n 3
#SBATCH -t 2:00:00
#SBATCH -J tifftoss

echo "Tiff to Substack Compress"

cd /home/img/work/
for z in /home/img/from/*.gz
  do

    #copy file to work directory
    echo "Copying $z ..."
  cp $z .

  #get filename from path and remove .gz
  b=$(basename $z)
  newfilename="${b/.*/}"

  #Decompress file
  echo "Decompressing $b ..."
    gunzip $b

    #run imagej script
  echo "Running ImageJ ..."
  /home/programs/fiji-linux-64/ImageJ-linux64 --headless -macro /home/img/scripts/tifftosubstack.ijm

  #compress new file
  cd /home/img/to/
  echo "Compressing $newfilename.tiff ..."
  gzip "$newfilename.tif"

    #remove temporary file
  cd /home/img/work/
  echo "Removing $newfilename.tiff"
  rm -rf "$newfilename.tiff"
  done

echo "End of Script"
```

The bash script loop copies each gzipped tiff from the source to work directory, decompresses it, runs ImageJ, and compresses the output tiff.

And my ImageJ macro script looks as below:

```bash
// ImageJ batch script to substack tiff stack
// 2016 Roy Mathew Francis

//set directories
dirsource = "/home/img/work/";
dirresult = "/home/img/to/";

setBatchMode(true);
list = getFileList(dirsource);
print("======================================================");
print("~~ ImageJ Tiff Substack ~~");
for (i=0; i<list.length; i++)
  {
    print("------------------------------------------------------");
    print("Processing "+(i+1)+" of "+list.length+"...");
    spath = dirsource+list[i];

    //open tiff image
    print("Opening "+spath);
    open(spath);
    title = getTitle();
    imgorig = getImageID();

    //substack slice 2 to end
  selectImage(imgorig);
  print("Slices: "+nSlices);
  run("Make Substack...", "  slices=2-"+nSlices);

  //save tiff file
  imgsub = getImageID();
  selectImage(imgsub);
    saveAs("Tiff", dirresult+title);
    print(dirresult+title+" saved.");

    //close all
    close("*.tif");
  }

print("======================================================");
eval("script","System.exit(0);");
```

The only line that has changed is the source directory path (`dirsource`). Set execute permissions and execute the bash script as before. After the script has executed, a new compressed tiff file will be present in the `to` directory.

These are simple examples to get started. You can obviously build on this for all sorts of image analysis operations.
