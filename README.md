# Reproducible research: version control and R

# Question 4

Initially, the two faceted plots show different paths because each path is determined by a different set of random steps. Also, every time I re-run the code, a different random path is generated for each left and right graph. 

A random seed is a feature that determines the set of numbers that will be used when random numbers are used. Usually, when getting a set of random numbers in R, R will choose a random seed for you. However, this is not reproducible--every time the code is run, a different set of random numbers will be used, and results and plots will look different. Instead of a random seed, you can use a set seed. A set seed fixes the random numbers generated for a project so that every time the code runs, including when different users run the code on different devices, the same data and figures will be generated. When code relies on drawing random numbers, it is important to use a set seed to ensure reproducibility. 

I used the function set.seed to make sure the same random number distribution is used for every run of the code. When I use the set.seed function before the random_walk function both times it is used, the left and right graphs look the same -- the same set of random numbers are being used to create both plots. 

# Question 5


summary(Cui_etal2014)
The dataset has 13 columns and 33 rows.


A log transformation will make the data suitable for linear modeling, because the relationship between genome size and volume follows an exponential relationship. 


Cui_etal2014$log_volume <- log(Cui_etal2014$`Virion volume (nm×nm×nm)`)
Cui_etal2014$log_genome_length <- log(Cui_etal2014$`Genome length (kb)`)

model <- lm(log_volume ~ log_genome_length  , Cui_etal2014)
summary(model)

Obtained from model: 
intercept = 7.0748, p = 2.28e-10
log_volume = 1.5152, p = 6.44e-10
These coefficients are statistically significant. 

To match these linear coefficients to the exponential equation referenced in the paper, we need to use rules of logarithms:
**$`V = \beta L^{\alpha}`$**
**$`log(V) = log(\beta L^{\alpha})`$**
**$`log(V) = log(\beta) + log(L^{\alpha})`$**
**$`log(V) = log(\beta) + \alpha*log(L)`$**

Comparing the linear model to this transformation, the intercept represents log(\beta) while the slope represents \alpha. 
\alpha = 1.5152
In table 2 of the paper, the authors report the \alpha value for dsDNA viruses as 1.52, which exactly matches the \alpha value found here. 

To find \beta, back-transform the intercept: e^7.0748 = 1181.807. 

The paper reports a \beta value of 1,182, which agrees with this calculation.

Reproducing the figure in the README report: 

virion_plot <- ggplot(Cui_etal2014,aes(x=log_genome_length, y=log_volume)) +
  geom_point() +
  geom_smooth(method='lm') + 
  theme_bw() + 
  labs(x = "log[Genome length (kb)]", y= "log[Virion volume (nm3)]") +
  theme(axis.title = element_text(face="bold"))

virion_plot

png(filename="virion_plot.png", width=600, height=500)

To calculate the volume of a 300 kb dsDNA virus, we can use the final parameters or the linear model: 
**$`V = \beta L^{\alpha}`$**
**$`V = 1182 * 300^{1.52}`$**
**$`V = 6884015$**

log(virion_volume) = 7.0748 + 1.5152 * log(genome_length)
log(virion_volume) = 7.0748 + 1.5152 * log(300)
log(virion_volume) = 15.71717
virion_volume = 6696998

There are minor differences in these two calculations due to rounding, but the model predicts that a 300 kb DNA virus will have a volume of 7 x 10^6 (7 million) nm^3. 

# Bonus
Reproducibility and replicability are used as synonyms colloquially and in some academic contexts. However, sources more specific to data science tend to distinguish between the two, though not always in consistent ways. For conciseness, I will stick to the Association for Computing Machinery as reported by Plesser (2018, https://www.frontiersin.org/articles/10.3389/fninf.2017.00076/full); however, these definitions shift and flip depending on the author. For example, "reproducibility" as it is used in our computing sessions on creating reproducible code and figures refers to writing code that will run consistently across several machines, though that might be considered "replicable" under these guidelines. 

According to the ACM, reproducibility refers to the ability to reach the same conclusions using independently developed code or software, whereas replicability refers to the ability to reach the same conclusions using the same code. Github is useful in enhancing both replicability and reproducibility. Providing all code and data in one open-access place is great for replicability, since code and documents can be forked and run directly on the platform to ensure that the computational methods work as intended for other researchers. Github is also useful for reproducibility, since seeing the starting point and logical basis for how code was written and run allows other researchers to critically inspect it for flaws and write their own methods to check your work. However, especially in biology, data science is only one part of the experimental process, and git and Github are not really designed to share tools to enhance the replicability and reproducibility of your work. Other platforms like protocols.io, which has similar sharing and forking abilities as Github, can integrate full, step-by-step methods focusing on computation or on lab methods. Sharing replicable and reproducible code isn't worth much if your data was collected based on faulty methods--the precise steps of data collection have to be accounted for as well.  

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
