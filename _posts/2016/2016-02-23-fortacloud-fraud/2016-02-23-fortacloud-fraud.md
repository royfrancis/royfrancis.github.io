---
date: 2016-02-23 09:35:04
title: The FortaCloud fraud
slug: fortacloud-fraud
excerpt: My horrible experience with cloud computing service fortacloud.co and why you should stay clear of this service too.
category:
- Web
tags:
- Cloud Computing
- Web Hosting
classes: wide
image: "assets/images/posts/2016/2016-02-23-fortacloud-fraud/featured.jpg"
images: "assets/images/posts/2016/2016-02-23-fortacloud-fraud/"
---

Cloud computing is fun, flexible and relatively cheap. If you are a hobbyist like me, who likes to fiddle around with web apps, experiment with web hosting and such, standard established cloud services like Amazon AWS, Linode, Digital Ocean etc might a bit too pricey. So, in the search for cheaper alternatives, one comes across options such as [Vultr](https://www.vultr.com/), [CloudSigma](https://www.cloudsigma.com/) or [FortaCloud](http://fortacloud.co/). It is a gamble when one has to authenticate using credit cards and sometimes it can go wrong.

I came across FortaCloud in December 2015. They claim to provide cloud computing services and had a free-tier program. I thought it might a good idea to try it out and see how it goes. I created an account and signed up for their so called 'Free Tier FortaCloud VPS' on the 18-December-2015. There was an initial setup fee of 0.82 USD. I had to use the credit card to pay for this. I thought that was alright and perhaps it was a security measure to avoid misuse. Below is the email confirmation I received.

{%
  include figure
  image_path="Screenshot-2016-02-16-20.24.42.png"
  alt="figure"
  caption="Email of registration"
%}

Once my service was active, I set up a basic virtual server which was up and running. Below is the email I received once my server was running.

{%
  include figure
  image_path="Screenshot-2016-02-16-20.30.11.png"
  alt="figure"
  caption="Email of server creation"
%}

At this point, I was interesting in monitoring the performance and stability of the server. I set up a service called [SeaLion](https://sealion.com/). With SeaLion, I could monitor my server from the SeaLion dashboard, rather than logging on to my FortaCloud account or even SSH into my FortaCloud server. So far so good. Things were moving smoothly.

And then 3 days later, the FortaCloud server stopped responding to SeaLion. I could not SSH into the server or access the server in anyway. It seems like my server crashed for whatever reason. I tried to log into my account and that was not possible either. I tried to reset my password and it said my account did not exist and my email was not even registered. I tried to get support. That is when I realised the website does not have any support or proper contact details. A question ticket is charged 5 USD per question. Even after submitting the question, and paying for it, they do not respond. Then I came across their facebook page and found a post about the disruption in service. So, I posted a comment on their facebook page to which I received no response.

{%
  include figure
  image_path="Screenshot-2016-02-16-21.29.11.png"
  alt="figure"
  caption="Facebook"
%}

I tried for a few days and then gave up on it. One month passed by (Jan-2016), and in the middle of Feb-2016, I just happened to be going through my bank transactions and I noticed that my card was charged once in Jan and once in Feb by FortaCloud.

    01-18 01-19 FORTACLOUD.CO xxxxxxxxxx USD 101,39
    02-09 02-10 FORTACLOUD.CO xxxxxxxxxx USD 124,03

I have been charged 225 USD for a free service that did not work! I was shocked by this unauthorized transaction. I tried to log into my account again. I reset my password and tried again and it finally worked. Once I got into my account, I could see that the ‘Free Cloud VPS’ was active and I didn’t even know about it. So I tried to close it down and of course there is no option to close it or delete it. Digging around for a bit, I found a button to request cancellation. I submitted a cancellation request and now a week later, it is still active. The free tier server running is seen below.

{%
  include figure
  image_path="Screenshot-2016-02-16-20.41.33.png"
  alt="figure"
  caption="Dashboard"
%}

Scenario 1: It is a free service, and I should not be charged at all, except for the setup fee of 0.82 USD. Scenario 2: Let’s imagine 'free' was not really free, then they should be charging me 9.95 USD as shown above. I got charged 225 USD which doesn’t make any sense whichever scenario.

I then tried to remove my credit card details from the website, and as you guessed, it is not possible. I tried to close my account, and that is not possible either. And there is no one to contact. I finally figured that although I cannot remove my card details, I could change it. So I immediately changed the card details to a random card number found on the internet. And of course I blocked my credit card to avoid further use.

I started looking around about this company on their facebook page.

{%
  include figure
  image_path="Screenshot-2016-02-16-20.16.02.png"
  alt="figure"
  caption="Facebook page"
%}

To my horror, I came across numerous complaints from users which I hadn't paid attention to before. It seems like I am not the first person to have this problem. Many other users had similar experience as me.

{%
  include figure
  image_path="Screenshot-2016-02-16-20.53.53.png"
  alt="figure"
  caption="Facebook complaints"
%}

{%
  include figure
  image_path="Screenshot-2016-02-16-20.16.11.png"
  alt="figure"
  caption="Facebook complaints"
%}

Reading around a bit, there are many reports of the fraudulent activities of FortaCloud. Some examples are articles such as [this](http://www.ripoffreport.com/r/FortaCloud/internet/FortaCloud-FortaTrust-FortaCloud-aka-FortaTrust-Says-Free-VPS-Creates-Fee-VPS-Doral-1189935), [this](http://www.webhostingtalk.com/showthread.php?t=1413320) and [this](http://www.serchen.com/company/fortatrust/). The credit card transactions are clearly fraudulent and this whole company is a scam.

I am currently working up a case with my credit card company to reclaim the transactions. Many others are going through the same process. I hope this has been helpful and should help you avoid being caught up in this mess.

Since I had mentioned two other services Vultr and CloudSigma in the beginning of this post, I need to clarify those. I have been using Vultr for the past several months. The service has been quite stable and reliable. CloudSigma is still in experimental phase and the service is not entirely stable. But poor service is one thing and downright fraud is another.
