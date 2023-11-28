# Reproducible research: version control and R

\# INSERT ANSWERS HERE #

answers are found after each successive question - only for questions 4 and 5 in this readme


![image](https://github.com/hannahugboma/reproducible-research_homework/assets/150162434/761be67d-b4fc-47b6-8271-198466ac151c)


## Instructions

The homework for this Computer skills practical is divided into 5 questions for a total of 100 points (plus an optional bonus question worth 10 extra points). First, fork this repo and make sure your fork is made **Public** for marking. Answers should be added to the # INSERT ANSWERS HERE # section above in the **README.md** file of your forked repository.

Questions 1, 2 and 3 should be answered in the **README.md** file of the `logistic_growth` repo that you forked during the practical. To answer those questions here, simply include a link to your logistic_growth repo.

**Submission**: Please submit a single **PDF** file with your candidate number (and no other identifying information), and a link to your fork of the `reproducible-research_homework` repo with the completed answers. All answers should be on the `main` branch.

## Assignment questions 

1) (**10 points**) Annotate the **README.md** file in your `logistic_growth` repo with more detailed information about the analysis. Add a section on the results and include the estimates for $N_0$, $r$ and $K$ (mention which *.csv file you used).
   
2) (**10 points**) Use your estimates of $N_0$ and $r$ to calculate the population size at $t$ = 4980 min, assuming that the population grows exponentially. How does it compare to the population size predicted under logistic growth? 

3) (**20 points**) Add an R script to your repository that makes a graph comparing the exponential and logistic growth curves (using the same parameter estimates you found). Upload this graph to your repo and include it in the **README.md** file so it can be viewed in the repo homepage.
   
4) (**30 points**) Sometimes we are interested in modelling a process that involves randomness. A good example is Brownian motion. We will explore how to simulate a random process in a way that it is reproducible:

   - A script for simulating a random_walk is provided in the `question-4-code` folder of this repo. Execute the code to produce the paths of two random walks. What do you observe? (10 points)

what do i observe after running the random wlak model

Based on the graph itself – the graph shows the movement of a random particle through a space filled with other moving particles, the line on the graph being the movement pathway of the particle and the colour of the line being the time passed since the particle started moving, the darker the line being the earlier in time since movement commenced and the lighter being the position/movement of the particle later in time. Both the graphs have different scales of the x and y coordinates, indicating each of the particles followed different paths of movement within the space of the graph. The particle in the first graph (left) moved a greater distance on the x and y axis, moving between -5 to 0 on the x axis and -1 to 3 on the y asixs, whereas the second graph (right) only moved between -1 to 3 on the x axis and -2 to 0 on the y axis.  
The 2 walks show different patterns of motion and movement – the first one generated (on left) shows a more linear movement and the particle does not reach the area of the graph between the coordinates (-1,0), whereas in the second generated walk, the particles movement is more widespread and covers most of the coordinate regions of the space. the overall movement of the particle on both of the graphs looks relatively random, and the environment is considerably busy as the graph has many loops of the particle moving back on itself, indicating continuous bumping into other particles. In the first graph, there is a short period where the particle moves in a straight direction.

upon running this code again and creating a new model, 2 copletely different graphs are formed with different patterns and directions of movement to those just described.
  
   - Investigate the term **random seeds**. What is a random seed and how does it work? (5 points)

In R studio a setting a seed creates a pseudo random number generator, and setting a random seed can be used to generate random numbers. The function itself in R studio is an ‘integer containing vector’, and contains a random number generator and can be used for generating random numbers to create different scenarios in the model or data being observed and tested. This can be used to introduce randomness and therefore reduce the reproducibility of the results.
   - 
   - Edit the script to make a reproducible simulation of Brownian motion. Commit the file and push it to your forked `reproducible-research_homework` repo. (10 points)
   - Go to your commit history and click on the latest commit. Show the edit you made to the code in the comparison view (add this image to the **README.md** of the fork). (5 points)
   - ![image](https://github.com/hannahugboma/reproducible-research_homework/assets/150162434/761be67d-b4fc-47b6-8271-198466ac151c)

5) (**30 points**) In 2014, Cui, Schlub and Holmes published an article in the *Journal of Virology* (doi: https://doi.org/10.1128/jvi.00362-14) showing that the size of viral particles, more specifically their volume, could be predicted from their genome size (length). They found that this relationship can be modelled using an allometric equation of the form **$`V = \beta L^{\alpha}`$**, where $`V`$ is the virion volume in nm<sup>3</sup> and $`L`$ is the genome length in nucleotides.

   - Import the data for double-stranded DNA (dsDNA) viruses taken from the Supplementary Materials of the original paper into Posit Cloud (the csv file is in the `question-5-data` folder). How many rows and columns does the table have? (3 points)

33 rows, 9 columns

   - What transformation can you use to fit a linear model to the data? Apply the transformation. (3 points)

use a log transfomation on both aspects of the data, so

lm(log(genome_length_kb) ~ log(virion_volume_nm_nm_nm), virusdata1)

   - Find the exponent ($\alpha$) and scaling factor ($\beta$) of the allometric law for dsDNA viruses and write the p-values from the model you obtained, are they statistically significant? Compare the values you found to those shown in **Table 2** of the paper, did you find the same values? (10 points)
   - Write the code to reproduce the figure shown below. (10 points)

code to reproduce figure:

#install.packages('ggplot2')
#install.packages('janitor')
library(ggplot2)
library janitor

virusdata <- read.csv('Cui_etal2014.csv')

virusdata1 <- clean_names(virusdata)

log_virusdata <- lm(genome_length_kb ~ log(virion_volume_nm_nm_nm), virusdata1)

ggplot(logVirusdata, aes(x = log.virusdata1.genome_length_kb.,
                                             y = log.virusdata1.virion_volume_nm_nm_nm.))+
  
  labs(x = 'log[Genome length(kb)]',
       y = 'log[Viron volume (nm3)]')+
  
  geom_point()+
  
  geom_smooth(method = 'lm')+
  
  theme_bw()

  <p align="center">
     <img src="https://github.com/josegabrielnb/reproducible-research_homework/blob/main/question-5-data/allometric_scaling.png" width="600" height="500">
  </p>

  - What is the estimated volume of a 300 kb dsDNA virus? (4 points)

**Bonus** (**10 points**) Explain the difference between reproducibility and replicability in scientific research. How can git and GitHub be used to enhance the reproducibility and replicability of your work? what limitations do they have? (e.g. check the platform [protocols.io](https://www.protocols.io/)).
