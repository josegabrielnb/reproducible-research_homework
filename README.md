# Reproducible research: version control and R


Questions 1,2,3: https://github.com/beecabbages/logistic_growth.git

4. The first time the code is run, both random walks display areas of more frequently traversed yet the paths followed by both are erratic. Despite both being randomly generated, the paths appear to be quite similar in shape and constricted to certain areas (path 1 avoids the bottom right corner completely and path 2, while more spread across the plane, it does not quite cover the entire area equally). Both paths appear to end in the negative Y coordinates. Running the code more times will generate different random walk paths, each following the same criteria of having an erratic pattern and areas that are more frequently walked. None of the walks generated are identical to each other. The scales of the axes also change between the different walks that are generated.  

A seed is a number or a vector that acts as a starting point for a pseudorandom number generator algorithm. The seed will determine the sequence of the numbers, which means that results using this seed are reproducible, as the same sequence of numbers will be generated if the same random seed is used. 

![image](https://github.com/beecabbages/reproducible-research_homework/assets/150164163/f8ca30c8-8b78-46e4-80fc-e1ae0b940833)

5. The table has 13 columns and 33 rows.

To make the data fit a linear model, we could apply a log transformation (see question_5_code.R for process). 

The value I found for the exponent is 11.37312, p< 2e-16, and the value i found for the scaling factor 5424800, p = 0.233. This implies that the values I have obtained are statistically significant. However, I did not find the same values as found in the paper.

the code to reproduce the figure:
![image](https://github.com/beecabbages/reproducible-research_homework/assets/150164163/3fdf691a-0d25-43e7-aa96-59dfd8b81fd8)

To estimate the volume of a 300kb virus, must sub L = 300 into allometric equation:
**$`V = \beta L^{\alpha}`$**
V = (1182)*(300)^(1.52)
V = 6884014.61564 

BONUS QUESTION 
Reproducibility and replicability refer to different parts of research - replicability refers to the ability of an experimental design to produce consistent results when repeated, even by another researcher; reproducibility refers to the analysis of said results, and producing consistent computational results using the same methods of analysis. 

git and GitHub can enhance the reproducibility of research, as it provides a way to keep track of the changes and different versions of the code one makes as they are analysing their data. It also allows for easier collaborative work, as the work can be made accessible to other members of a research team for example, and even researchers who wish to repeat the analysis themselves.  

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
