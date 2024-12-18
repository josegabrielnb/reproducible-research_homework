# Reproducible research: version control and R
## Answers
### Other questions
https://github.com/Willbill1978/logistic_growth
### Question 4
After running the code I see 2 random walks generated side by side. They both show a random walk over 2d space, there is a fair amount of clustering, by chance.
Each time you run the code it leads to new plots as it generates the turns by using the runif function which generates a random number within the range 0-2pi. The graph itself is set up in a way with both X and Y coordinates that represent physical 2d space.

A random seed is a number which can be used to start a "pseudorandom number generator" This seed is used to generate a pseudorandom sequence through an algorithm. This makes the series of (pseudo)randomly generated angles/numbers dependent on the seed. Therefore it is deterministic in nature and acts as a starting point to create a list of perceived random numbers.  This makes the code reproducible as by using the same seed you will see the same sequence of generations

Edited script is in the question-4-code directory

![image](https://github.com/Willbill1978/reproducible-research_assignment/assets/150149267/6646960c-a2d9-430c-981d-11fe18020401)
Latest commit

### Question 5
There are 33 rows and 13 columns.
To linearise the equation V=BL^a we plot lnV against lnL to get a linear graph with gradient alpha and intercept lnB (or just C as its just a scaling constant)

Intercept is 7.0748 with p-value of 2.28e-10
Gradient is  1.5152 with a Value of 6.44e-10
This means that alpha, the exponent has a value of 1.5152
And beta, the scaling factor is 1181.80711574
They are both very statistically significant with P values very under 0.05, showing that this model fits ALOT closer than is due to chance
The value of dsDNA viruses in Table 2 is 1.52 and 1182 which is exactly the values I obtained, rounded.

The table was reproduced below
![image](https://github.com/Willbill1978/reproducible-research_assignment/assets/150149267/eec7624e-d554-486f-be81-df5d955c83f9)

The estimated volume is V= 1181.80711574 *300^1.5152 = 6697006.58117 nm^3

### Bonus
Reproducibility is the ability to repeat the experiment/analysis and **get the same results** while replicability is the ability **to repeat the experiment** with the same method/analysis, not necessarily yielding the same results. They are both related and often come hand in hand.
Git and Github act as a way for people to track every change and version of a protocol. It makes the logic of the work easier to follow and by having all of your information in one central place it makes it a lot easier to keep track of what is going on. Allowing all versions to be in one place so a user can track and install the specific version that they need. A possible limitation is that people can often become reliant on a very narrow set of tools instead of making their own, they could use methods that don't necessarily fit their requirements due to either a change in environment or an altered method. Many tools on github also become version dependent which can create difficulty when one library or tool is slightly out of date and you have to find which tool isn't compatible. Luckily however this information is normally easy to find, but it's up to the developers to keep stuff up to date.
## Instructions

The homework for this Computer skills practical is divided into 5 questions for a total of 100 points. First, fork this repo and make sure your fork is made **Public** for marking. Answers should be added to the # INSERT ANSWERS HERE # section above in the **README.md** file of your forked repository.

Questions 1, 2 and 3 should be answered in the **README.md** file of the `logistic_growth` repo that you forked during the practical. To answer those questions here, simply include a link to your logistic_growth repo.

**Submission**: Please submit a single **PDF** file with your candidate number (and no other identifying information), and a link to your fork of the `reproducible-research_homework` repo with the completed answers (also make sure that your username has been anonymised). All answers should be on the `main` branch.

## Assignment questions 

1) (**10 points**) Annotate the **README.md** file in your `logistic_growth` repo with more detailed information about the analysis. Add a section on the results and include the estimates for $N_0$, $r$ and $K$ (mention which *.csv file you used).
   
2) (**10 points**) Use your estimates of $N_0$ and $r$ to calculate the population size at $t$ = 4980 min, assuming that the population grows exponentially. How does it compare to the population size predicted under logistic growth? 

3) (**20 points**) Add an R script to your repository that makes a graph comparing the exponential and logistic growth curves (using the same parameter estimates you found). Upload this graph to your repo and include it in the **README.md** file so it can be viewed in the repo homepage.
   
4) (**30 points**) Sometimes we are interested in modelling a process that involves randomness. A good example is Brownian motion. We will explore how to simulate a random process in a way that it is reproducible:

   a) A script for simulating a random_walk is provided in the `question-4-code` folder of this repo. Execute the code to produce the paths of two random walks. What do you observe? (10 points) \
   b) Investigate the term **random seeds**. What is a random seed and how does it work? (5 points) \
   c) Edit the script to make a reproducible simulation of Brownian motion. Commit the file and push it to your forked `reproducible-research_homework` repo. (10 points) \
   d) Go to your commit history and click on the latest commit. Show the edit you made to the code in the comparison view (add this image to the **README.md** of the fork). (5 points) 

5) (**30 points**) In 2014, Cui, Schlub and Holmes published an article in the *Journal of Virology* (doi: https://doi.org/10.1128/jvi.00362-14) showing that the size of viral particles, more specifically their volume, could be predicted from their genome size (length). They found that this relationship can be modelled using an allometric equation of the form **$`V = \alpha L^{\beta}`$**, where $`V`$ is the virion volume in nm<sup>3</sup> and $`L`$ is the genome length in nucleotides.

   a) Import the data for double-stranded DNA (dsDNA) viruses taken from the Supplementary Materials of the original paper into Posit Cloud (the csv file is in the `question-5-data` folder). How many rows and columns does the table have? (3 points)\
   b) What transformation can you use to fit a linear model to the data? Apply the transformation. (3 points) \
   c) Find the exponent ($\beta$) and scaling factor ($\alpha$) of the allometric law for dsDNA viruses and write the p-values from the model you obtained, are they statistically significant? Compare the values you found to those shown in **Table 2** of the paper, did you find the same values? (10 points) \
   d) Write the code to reproduce the figure shown below. (10 points) 

  <p align="center">
     <img src="https://github.com/josegabrielnb/reproducible-research_homework/blob/main/question-5-data/allometric_scaling.png" width="600" height="500">
  </p>

  e) What is the estimated volume of a 300 kb dsDNA virus? (4 points) 
