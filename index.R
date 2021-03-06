---
title: "Mass Incarceration"
author: "Abdirahim M, Matthew S, Confidence O, Aminata D"
date: "2/19/2021"
output: html_document
---

```{r setup, include=FALSE}
source("compile.r")
library(knitr)
library(kableExtra)
```

## Introduction:

*Mass incarceration is an astronomical problem in the United States. The U.S. leads with the highest incarceration rate of any country in the world. Not really something that should be celebrated. Research has shown that it is mainly African-Americans that inhabit these prisons/jails. Is there a societal problem? Can we expose this great injustice to the individuals that, one could say, built this country? Let’s find out!*


*Here are our FIVE variables/ Summary:*

-  According to the data set the race with the highest crime rate in the United States is *`r race_with_the_highest_crime_rate_in_2019`*. Which wasn't surprising to us because the sheer difference of population size between white people and every other race in the United States. We also found out that the crime that was done the most frequently by white people in 2019 was `r highest_crime_type_for_white_in_2019`. This was surprising seeing that in 2013, the crime that was most frequently done by white people was *`r highest_crime_type_for_white_in_2013`*. After some more calculations, We learned that the crimes that  African Americans were mostly arrested for in 2013 was *`r highest_crime_type_for_African_Americans_in_2013`*, which made it even less surprising when we found out that crimes African Americans were arrested for six years later was *`r highest_crime_type_for_African_Americans_in_2019`* because it was very stereotypical. Looking at our data from the years 2013, 2015, 2017, and 2019 we found our that the average number of arrests was *`r average_criminal_total`* throughout the United States.





# Table:

```{r echo=FALSE}
kable(Table[1:4,], caption = "Arrest Info")
```

# Charts:

```{r include=TRUE, echo=FALSE, message=FALSE, warning=FALSE, fig.height=5, fig.width=10}
Data_2013_all <- filter(Arrest_Information, X2013=="2013")
Data_2015_all <- filter(Arrest_Information, X2013=="2015")
Data_2017_all <- filter(Arrest_Information, X2013=="2017")
Data_2019_all <- filter(Arrest_Information, X2013=="2019")

Total_Arrest<- c(Data_2013_all$Total[1],Data_2015_all$Total[1],Data_2017_all$Total[1],Data_2019_all$Total[1])
Year <- c("arrest_2013","arrest_2015","arrest_2017","arrest_2019")

Plot<- data.frame(Year, Total_Arrest)
ggplot(Plot, aes(x=Year, y=Total_Arrest,group=1)) + geom_line(linetype = "dashed",color = "red")+geom_point()+
  ggtitle("Arrests per Year")+ theme(plot.title = element_text(hjust = 0.5))

```

- Description: The purpose of the first chart is to show that arrests have been declining from 2013 to 2019. We can see that in 2013,2015,2017, and 2019 there was a decline in every year. I think that this is good news. There has been a lot more awareness around Mass incarceration and this has helped to reduce arrests arrests. ALso, some laws concerning drugs have been changed to help reduce the total number of arrests. 



```{r include=TRUE, echo=FALSE, message=FALSE, warning=FALSE, fig.height=5, fig.width=10}

Plot_2019 <- Data_2019_all[-c(1),c(1,2)]
ggplot(Plot_2019, aes(x=ï..Crime...Total.Arrest, y=Total)) + geom_bar(stat="identity")+
  ggtitle("Arrests in 2019")+ theme(plot.title = element_text(hjust = 0.5))+ theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  xlab("Crimes") + ylab("Total Arrest")

```

- Description: The purpose of the second chart is to show all the different crimes people are arrested for. This chart allows us to quickly see the crimes that are causing the most arrests. For instance, one observation that drug abuse violations, other assaults,property crime, along with a category titled all other offense, which we could not find more information on were the crimes that had the most arrests.  



```{r include=TRUE, echo=FALSE, message=FALSE, warning=FALSE, fig.height=5, fig.width=10}

boxplot(Arrest_Information$Black.or.African.American,
        main = "Decrease in Black Arrests",
        xlab = "Black Arrests",
        ylab = "Total",
        col = "orange",
        border = "brown",
        horizontal = TRUE,
        notch = TRUE
)



```

- Description: The purpose of this third chart is to show the decrease in Black Arrests in the United States, and the reason we chose this value is to show that we might be moving in the right direction in terms of fighting mass incarceration. 
