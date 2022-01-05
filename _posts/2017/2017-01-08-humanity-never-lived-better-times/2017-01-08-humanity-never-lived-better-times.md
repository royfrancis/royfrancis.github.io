---
date: 2017-01-08 12:56:15
title: Humanity has never lived in better times
slug: humanity-never-lived-better-times
excerpt: It is easy to be disillusioned and pessimistic about the world we live in. Bad news seems to be followed by worse news. But humanity has come a long way from the disease-ridden, impoverished, war-torn lives of our fore-fathers. Here we look at a few data-driven graphs to convince ourselves of the progress we have made over time in various aspects of life. Slow progress never makes headlines.
featured: featured.png
category:
- Code
- Research
tags:
- Data Analysis
- Data Visualisation
- R
classes: wide
images: assets/images/posts/2017/2017-01-08-humanity-never-lived-better-times/
---

It may seem like the world is descending into total chaos, violence, and destruction. War in Syria, Ukraine, Yemen, Islamic state, migrant crisis, Ebola, plane crashes, earthquakes, tsunamis and what-not. The more news you watch, the more worried you will be. This is because the news outlets tend to focus on spectacularly negative instances. Violence, atrocities, and hatred are thrown into the spotlight and into the lives of common people. With the ever increasing digital connectivity, it is easy to disseminate information and to absorb information at an unprecedented level. Relatively smaller incidents have a larger voice. As said by Ray Kurzwil, "The world isn't getting worse, our information is getting better". To appreciate the world we live in, we have to put things into a wider context.

The fact is that humanity has never lived in a better time than now in pretty much every aspect you look at; war, violence, diseases, poverty are all at the lowest it has ever been. Of course, there is still a long way to go, but this is the best it has been since the beginning of humankind. To prove my point, here we evaluate human progress using some real data and simple time-series plots. Most of the data and information was obtained from [OurWorldInData](https://ourworldindata.org/).

### Life expectancy

We look at life expection as a metric for human health. Life expectancy is the mean age that an individual is expected to live. Mean global life expectancy has increased from around 30 years to over 70 years in 240 years.

{%
  include figure
  image_path="ny-life-expectancy.png"
  alt="figure"
  caption="Average global life expectancy from 1770 to 2015."
%}

A person born in 1770 would on average live for 30 years while an individual born in 2015 on average is expected to live up to 70 years old. Life expectancy should not be confused with lifespan. The lifespan may have remained the same while factors that detrimentally affect human health such as child mortality, diseases, epidemics, wars, poverty, malnutrition etc has dropped drastically which allows people to live longer lives. Living longer means that ageing itself is a health risk due to increasing old-age related health disorders such as Alzheimers, various Cancers, Osteoarthritis etc. Perhaps increasing human lifespan may also be feasible with [recent](http://www.popularmechanics.com/science/health/a19277/scientists-can-now-radically-expand-the-lifespan-of-mice-are-humans-next/) developments in biotechnology and ageing research. Read more about life expectancy [here](https://ourworldindata.org/life-expectancy/).

### Child mortality

Child mortality is the percentage of deaths in children under the age of 5.

{%
  include figure
  image_path="ny-child-mortality.png"
  alt="figure"
  caption="Mean global child mortality from 1800 to 2010."
%}

Child mortality is down from 40% in 1800 to 5% in 2015. This means that 95% of newborns in 2015 are born alive and survive at least first 5 years of their life. Child mortality is directly linked to life expectancy and is the largest contributing factor for increased life expectancy. Child mortality although indicating child survival is also an indicator of medical progress, maternal health etc. Go [here](https://ourworldindata.org/child-mortality/) to read more about child mortality, changes, and causes.

### Vaccination

Vaccination is possibly one of the greatest achievements in medicine. The ability to tackle a diseases/pathogen before an outbreak/infection. Vaccines although discovered in the late 1700s, was globally implemented and coordinated by the World Health Organization in the 1960s. Smallpox was the first disease to be eradicated by vaccination by 1980. Vaccination was quickly introduced for a wide range of diseases.

{%
  include figure
  image_path="ny-vaccination.png"
  alt="figure"
  caption="Percentage of the world population with access to DPT3 vaccination since 1980 to 2015."
%}

As an example, the DTP3 (Diphtheria-Tetanus-Pertussis) vaccine in 2015 reaches more than 6 billion people (86%) compared to less than 1 billion people (21%). WHO is on the brink of eradicating the second disease Polio.

In recent years, a fraudulent Lancet article (later retracted) linking vaccination to autism in children has given rise to an anti-vaccination movement especially in the US with parents choosing to not vaccinate their children. This has led to recent outbreaks of Pertussis and Measles. This again demonstrates how critical vaccinations are to maintain [herd immunity](http://vk.ovg.ox.ac.uk/herd-immunity) in the population.

### Literacy

Education is the driving force behind progress. Education gives rise to scientific progress, freedom, tolerance and equality.

{%
  include figure
  image_path="ny-literacy.png"
  alt="figure"
  caption="Percentage of the world population with basic literacy from 1800 to 2010."
%}

The percentage of people with basic literacy has increased from 10% to 85% over the last 200 years. Literacy rates below 30% are now confined to Afghanistan, Central Africa and Sub-Saharan Africa. Se here to read more about [literacy](https://ourworldindata.org/literacy/).

### Poverty

Next we look at poverty as a measure of standard of living.

{%
  include figure
  image_path="ny-poverty.png"
  alt="figure"
  caption="Percentage of the world population living in extreme poverty from 1820 to 2010."
%}

Although one might come across reports of rising unemployment, increasing inflation and economic instability, the fact is that absolute poverty has dropped by more than 70% in the last 200 years. Alleviating poverty not only provides people with better health education and standard of life, it also creates satisfied and [happy people](https://ourworldindata.org/happiness-and-life-satisfaction/).

### Political Regimes

We also explore political regimes as a measure of human rights and freedom of expression. Human beings have always lived in a hierarchical system of classes and castes. The idea of considering all human beings to be equal is a new concept.

{%
  include figure
  image_path="ny-politics.png"
  alt="figure"
  caption="Change in composition of the world population living in various political regimes from 1816 to 2010."
%}

### War

War is arguably detrimental to human progress or a melting pot of innovation due to necessity. We use war-related deaths as a measure of violence. War related deaths have been declining since the last major war in 1946. If the number of war deaths were controlled for population size, the decline is even more pronounced. We are living in the most peaceful era of our species' existence as far as violence is concerned.

{%
  include figure
  image_path="ny-war-deaths-1.png"
  alt="figure"
  caption="Number of global war fatalities per 100,000 people from 1946 to 2013."
%}

The matter of if war is on the decline is hard to answer. Perhaps war fatalities have declined but many are seriously wounded. Perhaps better body armour, better military evacuation and medical care may play an important role to reduce fatalities. War classification has changed to civil conflict, counter-terrorism, drug-violence, organised gangs etc. Major wars only happen a couple of times a century and perhaps sufficient time has not passed since the last war. Only time will tell.

### Environment

If everything is getting better, something must be getting worse? It seems like we can't have everything. All this human progress has come at great cost to the environment. Two centuries of industrial development has resulted in significant damage and destruction to our planet. Some of the notable environmental effects as a consequence of human activity are reduced forest cover, increased air pollution, dramatic increase in the number of extinct animal and plant species, changes in landscape composition and man-made catastrophes (oil spill etc).

{%
  include figure
  image_path="ny-co2-emissions.png"
  alt="figure"
  caption="Total global carbon dioxide emissions since 1800 to 2010."
%}

The carbon dioxide levels in the atmosphere is a commonly used metric to assess the consequence of human activity on the environment. Global Co2 emissions have been increasing faster and faster since the industrial revolution as the world gets richer and richer. Methane emissions have also increased dramatically especially with the advent of mass cattle farms.

### Conclusion

Declinism and rising depression are worrying trends. Sure, the world is not anywhere close to perfect, but we have sophisticated tools and better opportunity to solve those problems. It is easy to miss out on the slow progress we make as a species while we fixate on the shortcomings. We have to be optimistic and keep the momentum of change rolling. We don't see how good things are because we are not aware of how bad things were.
