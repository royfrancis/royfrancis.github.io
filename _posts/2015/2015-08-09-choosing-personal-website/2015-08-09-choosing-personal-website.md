---
date: 2015-08-09 14:45:58
title: Choosing a platform for a personal website
slug: choosing-personal-website
excerpt: A general introduction and comparison of platforms for hosting a personal website. This is just a primer to the different options available and not a detailed and thorough comparison.
featured: "featured.jpg"
category:
- Web
tags:
- Blogging
- Personal Website
- Web Hosting
toc: true
toc_sticky: true
images: "/assets/images/posts/2015/2015-08-09-choosing-personal-website/"
---

Hello Internet! I finally have a website. I've been thinking about having a website for several years now but never actually got around to making one. It was mostly due to lack of focussed time rather than lack of ideas. I probably won't have and don't plan on having regular popular content. So my idea was to have a personal website showcasing my work, a bit about myself, contact,  various social links and an occasional blog post. I spent quite a bit of time researching on potential set-up for the website from various hosting services to themes and templates. I thought I would go through some of the web hosting options out there especially for a personal website.

## Dynamic Websites

### Unhosted websites

{% 
  include figure
  image_path="pw-1.jpg"
  alt="unhosted-websites"
  caption="Unhosted websites."
%}

If you do not want to bother with web hosting and management, the best choice is to go for a system that is ready and managed. These come as restricted free services or full-fledged paid services. Drag and drop builders are provided. No coding or server management is required. One of the most popular and beautiful looking options is [Squarespace](http://www.squarespace.com/). Others include [Wix](http://www.wix.com/), [Virb](http://virb.com/), [Weebly](http://www.weebly.com/), [Strikingly](https://www.strikingly.com/) and lots more. Another good example is [wordpress.com](http://www.wordpress.com) for example, which is heavily restricted in terms of domain name, theme modification etc. Some other options in similar category with limited customisation include [Blogger](https://www.blogger.com) and [Google sites](http://www.google.com/sites/overview.html). Google sites is probably from the 1990s and still feels and looks the same. I won't include things like Facebook or Tumblr since I don't see them as personal websites, but rather social media.

### Free hosted websites

{% 
  include figure
  image_path="pw-2.jpg"
  alt="free-hosted-websites"
  caption="Free hosted websites."
%}

There are several options for free hosted websites where you just have to create a user account and put in some details and you are set to go. These sort of web services have a range of features from custom domain names to site building tools. The best feature is of course that they are free. They might also provide free domain names like _yoursite.provider.com_. Most of them offer support for php, mysql databases etc with a graphical user interface without diving into code. The drawbacks with such services are that they are almost always shared which affects performance. The storage space and traffic bandwidth is limited. But, for a small personal website, this really shouldn't be a problem. Some of such providers include [000webshost](http://www.000webhost.com), [awardspace](http://www.awardspace.com/), [freewebhostingarea](http://www.freewebhostingarea.com) etc. Here is a small list on [prchecker](http://www.prchecker.info/web-hosting/top-10-free-web-hosting-sites/).

{% 
  include figure
  image_path="pw-3.jpg"
  alt="figure"
%}

### Shared hosted websites

Most basic paid web hosting are so called 'shared hosting'. The previously mentioned providers and almost all free providers also provide this sort of paid hosting. Free domain names are provided and the possibility of a custom domain is also possible. Storage and traffic bandwidth is increased. A wide range of pricing to fit your needs makes this an attractive option. Nevertheless, your website will still be shared on a physical location which means the cores and memory are shared between all other users/websites on the same computer. This might cause a drop in performance especially if another demanding website runs on the same computer. You also do not have root access to system administration. But, this option should suffice for most general users, private bloggers, small scale websites etc. [PCMag](http://www.pcmag.com/article2/0,2817,2424725,00.asp) has a nice list of such providers for 2015.

### Virtual Private Server

These are the upgraded version of shared hosting. You have your own private area that you have full control over as if you own it. You can configure anything any way you like. Handles traffic better. You need to load your own LAMP stack (Linux, Apache, MySQL, PHP or Perl) and set up your own server management. This means more technical work and demanding system administration and self regulated security. If done properly, has more security than shared hosting. You can install your own resource-hungry softwares. There are lots of resources on the web to compare differences between shared and VPS hosting. All major web hosting providers such as [bluehost](http://www.bluehost.com/), [hostgator](http://www.hostgator.com/), [dreamhost](https://www.dreamhost.com/) etc. have the VPS option.

### Dedicated server

A dedicated server means that you are not getting a slice of the server, instead you get the whole server to your self. You can choose the cores and RAM and storage etc. System management and administration is demanding and usually command line. Some services may provide control panels and auto-installer scripts for commonly used applications. You can install any server OS, any web-server from Apache to Nginx. While there is effectively no sharing on computing resources, there might be bandwidth sharing. [PCMag](http://www.pcmag.com/article2/0,2817,2430030,00.asp) has yet another list for dedicated servers.

### Cloud computing

{% 
  include figure
  image_path="pw-4.jpg"
  alt="cloud-computing"
  caption="Cloud computing."
%}

Cloud computing is the newest trend. Cloud computing provides users with something called instances. These are virtual machines with any configuration as you would like. Any number of cores, whatever RAM, storage etc. Instances can be created and installed with any OS on the fly in a couple of minutes. You can install, configure, management anything anyway you like. Billing is usually time based. Hourly billing is usually used for intensive high-computing instances while a monthly billing is used for lower configurations. Websites implemented through cloud computing have their content on multiple servers at multiple locations at the same time which means that they less prone to downtime if a single physical server crashes somewhere. This may not always be the case depending on the set-up. There are countless articles debating the pros and cons of cloud computing. As a bottom line, cloud computing might be overkill for hosting a small website. The most prominent players are [Amazon EC2](https://aws.amazon.com/) and [Digital Ocean](https://www.digitalocean.com/). Others include [Vultr](https://www.vultr.com/), [Linode](https://www.linode.com/), [Google Cloud](https://cloud.google.com/) and [Microsoft Azure](https://azure.microsoft.com/). Amazon AWS has a [free tier option](https://aws.amazon.com/free/) for new customers for the first one year.

## Static Websites

{% 
  include figure
  image_path="pw-5.jpg"
  alt="static-websites"
  caption="Static websites."
%}

Static websites contain fixed static content. They do not use server-side scripting like PHP or databases like SQL. They are simple and easy to develop and maintain. They are used for small websites where content do not change very often. Static websites use only HTML, javascript and CSS. They do not have any fancy features or functionalities. They are the cheapest to host as they do not need any sort of live server. They can be hosted off [Github](https://pages.github.com/) or even [Dropbox](https://www.dropbox.com/). Beautiful looking web pages can be created and updated simply using Markdown. Some of the popular platforms for generating static sites include [Jekyll](http://jekyllrb.com/), [Hugo](https://gohugo.io/), [GitBook](https://www.gitbook.com/) etc. Here is [Dean Attali's website](http://deanattali.com/) which is a good example of a static website.

## Conclusion

Ultimately, after all that brain racking, I decided (for now) to go with the cloud computing option of Vultr. I am running a wordpress site. I decided to go for the cloud computing option since I also wanted a live server to run an R shiny server for R shiny applications. Or else, I would've opted the static website option on Github pages.
