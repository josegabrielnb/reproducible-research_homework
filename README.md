# Reproducible research: version control and R

### Questions 1-3
Answers to questions 1, 2 and 3 are found within README.md in the dev branch of my logistic_growth repository: https://github.com/AnonymousUsernameCodingAssigment/logistic_growth/tree/dev

### Question 4 
**(30 points) Sometimes we are interested in modelling a process that involves randomness. A good example is Brownian motion. We will explore how to simulate a random process in a way that it is reproducible:**
   
<ins>A script for simulating a random_walk is provided in the question-4-code folder of this repo. Execute the code to produce the paths of two random walks. What do you observe? (10 points)</ins>
   
The graphs each show a paths which both start at (0,0), the line then moves 0.25 in a random direction 500 times in each graph. The code creates two data sets, each containing 500 random walks. Since the random_walk function is used to determine these random walks, the coordinates at each step is differnt in the different datasets. Therefore, when this is plotted, the path of each graph is different.
   
<ins>Investigate the term random seeds. What is a random seed and how does it work? (5 points)</ins>

Random seeds allow us to create the same random set of numbers each time a line of code is run, meaning that it is reproducible. In the code for question 4, new random numbers are produced each time. This means that each time the code is run, differnt numbers are produced, resulting in the production of different graphs. This is not reproducible. Therefore, we can use random seeds to create a random dataset that remains constant and can be used each time the code is run to give the same results/plot. 

<ins>Edit the script to make a reproducible simulation of Brownian motion. Commit the file and push it to your forked reproducible-research_homework repo. (10 points)</ins>

https://github.com/AnonymousUsernameCodingAssigment/reproducible-research_homework/blob/main/question-4-code/random_walk.R

<ins>Go to your commit history and click on the latest commit. Show the edit you made to the code in the comparison view (add this image to the README.md of the fork). (5 points)</ins>

<img width="1417" alt="Screenshot 2023-12-06 at 12 02 22" src="https://github.com/AnonymousUsernameCodingAssigment/reproducible-research_homework/assets/150151352/54b8a69c-b96a-4bdf-be2d-c3547c219e67">

### Question 5 

**(**30 points**) In 2014, Cui, Schlub and Holmes published an article in the *Journal of Virology* (doi: https://doi.org/10.1128/jvi.00362-14) showing that the size of viral particles, more specifically their volume, could be predicted from their genome size (length). They found that this relationship can be modelled using an allometric equation of the form $`V = \beta L^{\alpha}`$, where $`V`$ is the virion volume in nm<sup>3</sup> and $`L`$ is the genome length in nucleotides.**

<ins>Import the data for double-stranded DNA (dsDNA) viruses taken from the Supplementary Materials of the original paper into Posit Cloud (the csv file is in the `question-5-data` folder). How many rows and columns does the table have? (3 points)</ins>

The table has 33 rows and 13 columns (using ncol() and nrow()).
  
<ins>What transformation can you use to fit a linear model to the data? Apply the transformation. (3 points)</ins>

If we transform both the x and y axis, the data will fit a linear model. 
   
<ins>Find the exponent ($\alpha$) and scaling factor ($\beta$) of the allometric law for dsDNA viruses and write the p-values from the model you obtained, are they statistically significant? Compare the values you found to those shown in **Table 2** of the paper, did you find the same values? (10 points)</ins>

The $\alpha$ and $\beta$ values found using the linear models were 1.52 and 1182 respectivly. Both were significant at a significance level of 0.05 with _p_ = 6.44x10<sup>-10</sup> for alpha and _p_ = 2.28x10<sup>-10</sup> for beta. These are the same values as for dsDNA in the orginal papaer, meaning that the data analysis is reproducible. 


<ins>Write the code to reproduce the figure shown below. (10 points)
   
<img width="1001" alt="Screenshot 2023-12-06 at 15 54 21" src="https://github.com/AnonymousUsernameCodingAssigment/reproducible-research_homework/assets/150151352/e0224ce9-91b3-4180-b192-43ba4c171344">

<ins>What is the estimated volume of a 300 kb dsDNA virus? (4 points)</ins>

1182*300<sup>1.52</sup> = 6884014.616
Where the genome size of a virus us 300kb dsDNA, the esimated volume is 6884041nm3


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
   - Investigate the term **random seeds**. What is a random seed and how does it work? (5 points)
   - Edit the script to make a reproducible simulation of Brownian motion. Commit the file and push it to your forked `reproducible-research_homework` repo. (10 points)
   - Go to your commit history and click on the latest commit. Show the edit you made to the code in the comparison view (add this image to the **README.md** of the fork). (5 points)

5) (**30 points**) In 2014, Cui, Schlub and Holmes published an article in the *Journal of Virology* (doi: https://doi.org/10.1128/jvi.00362-14) showing that the size of viral particles, more specifically their volume, could be predicted from their genome size (length). They found that this relationship can be modelled using an allometric equation of the form **$`V = \beta L^{\alpha}`$**, where $`V`$ is the virion volume in nm<sup>3</sup> and $`L`$ is the genome length in nucleotides.

   - Import the data for double-stranded DNA (dsDNA) viruses taken from the Supplementary Materials of the original paper into Posit Cloud (the csv file is in the `question-5-data` folder). How many rows and columns does the table have? (3 points)
   - What transformation can you use to fit a linear model to the data? Apply the transformation. (3 points)
   - Find the exponent ($\alpha$) and scaling factor ($\beta$) of the allometric law for dsDNA viruses and write the p-values from the model you obtained, are they statistically significant? Compare the values you found to those shown in **Table 2** of the paper, did you find the same values? (10 points)
   - Write the code to reproduce the figure shown below. (10 points)

  <p align="center">
     <img src="https://github.com/josegabrielnb/reproducible-research_homework/blob/main/question-5-data/allometric_scaling.png" width="600" height="500">
  </p>

  - What is the estimated volume of a 300 kb dsDNA virus? (4 points)

**Bonus** (**10 points**) Explain the difference between reproducibility and replicability in scientific research. How can git and GitHub be used to enhance the reproducibility and replicability of your work? what limitations do they have? (e.g. check the platform [protocols.io](https://www.protocols.io/)).
