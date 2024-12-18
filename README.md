# Reproducible research: version control and R
# logistic_growth
#The link to the logistic_growth repository:https://github.com/assignmentcontrol/logistic_growth/tree/main
R scripts for a reproducible analysis of logistic growth
# Logistic Growth Analysis

This repository contains the analysis of bacterial population growth in a test tube using the logistic growth model. The analysis aims to estimate the initial population size $N_0$, the rate of growth $r$, and the carrying capacity $K$.

## The Model

The logistic growth model is described by the differential equation:

$$\[ \frac{dN}{dt} = rN\left(1 - \frac{N}{K}\right) \]$$

The solution to this equation is given by:

$$\[ N(t) = \frac{K}{1 + \frac{(K - N_0)}{N_0}e^{-rt}} \]$$

## Results

### Parameter Estimates

Using a linear approximation for the exponential growth phase and constant size phase, we estimated the following parameters:

- Initial population size $N_0$: 879
- Growth rate $r$: 0.01152507
- Carrying capacity $K$: exp(7.1855445) 

The estimates were obtained from the provided data set (`experiment1.csv`), focusing on the exponential growth region for \(N \ll K\) and small \(t\).

### Population Size Calculation at $t = 4980$ minutes

Using the estimated values of $N_0 = 879$ and $r = 0.01152507$, we can calculate the population size at $t = 4980$ minutes assuming exponential growth. The formula for exponential growth is given by:

$$\[ N(t) = N_0e^{rt} \]$$
$$\[ N(4980) = 879e^{0.01152507 \times 4980} \]$$
$$\[ N(4980) = 7.417455e^{27} \]$$


### Comparison with Logistic Growth

However, the population size predicted under exponential growth at \(t = 4980\) minutes is much greater than the logistic growth model's prediction at the same time point. 
$$\[ N(t) = \frac{K}{1 + \frac{(K - N_0)}{N_0}e^{-rt}} \]$$
$$\[ N(t) = 6e+10  \]$$
Under the logistic growth the population growth reaches stasis at the level of a carrying capacity.

![image](https://github.com/assignmentcontrol/logistic_growth/assets/153260107/e95e6a57-98be-4845-8c95-64aa0eaf9bd4)


### Random walk

Using prepared script, the following paths were produced:
![image](https://github.com/assignmentcontrol/logistic_growth/assets/153260107/dbdc6c7a-204f-464e-966c-190ba1ff34fd)
These pahths are completely random, they do not share the walking trajectory, do not show the patterns and tendencies. The paths also exhibit significant volatility, with frequent fluctuations around the central trend. The distribution of individual steps appears to be skewed towards negative values in the second 
graph, but not in the first.

##### Random seed 
Many simulations appear to be pseudo-random. It is implemented using a random seed as a starting point for generating random numbers. It initializes the random number generator, ensuring that the sequence of random numbers generated is reproducible. If the same seed is provided to the random generator, the same sequence is going to be yielded. It allows  to obtain the same set of random numbers each time in a simulation.


<img width="1426" alt="Screenshot 2023-12-08 at 02 29 27" src="https://github.com/assignmentcontrol/logistic_growth/assets/153260107/f44bb5fb-fd1c-40a9-a351-4423769682d1">

# Viral particles

In the data table there are 33 rows (without index) and 13 columns.
To fit linear mode, the equation could be log-transformed:

$$\[ \log(V) = \log(\beta) + \alpha \log(L) \]$$

The .R file with the linear model is uploaded to the repository.
The linear model provided the following coefficient estimates:

- **Intercept $log(\(\beta\))$:** 7.0748
- **Slope $\(\alpha\)$:** 1.5152
- **Intercept p-value:** $\(2.28 \times 10^{-10}\)$
- **Slope (log_L) p-value:** $\(6.44 \times 10^{-10}\)$

The p-values are statistically significant as they are much smaller than the common significance level of 0.05. Therefore, we reject the null hypothesis for both the intercept and the slope. This suggests a strong and statistically significant relationship between the logarithm of virion volume and the logarithm of genome length for dsDNA viruses.
Results from the fitted linear model resemble the results obtained in paper in Table 2. 
![image](https://github.com/assignmentcontrol/reproducible-research_homework/assets/153260107/8660e32f-399d-4a58-89a1-d4ead5de5c6d)

virion_data <- read.csv(file.choose())
virion_data
log_transformed_data <- virion_data %>%
  mutate(log_V = log(`Virion.volume..nm.nm.nm.`),
         log_L = log(`Genome.length..kb.`))


linear_model <- lm(log_V ~ log_L, data = log_transformed_data)
summary(linear_model)
plot(log_V ~ log_L, data = log_transformed_data)
abline(linear_model)

ggplot(log_transformed_data, aes(x = log_V, y = log_L)) + 
  geom_point() +
  stat_smooth(method = "lm", col = "blue") +
  theme_bw() +
  xlab("log[Genome length (kb)]") +
  ylab("log[Virion volume (nm3)]")

### Bonus 

The reproducibility and replicability in the scientific research are principally different. Reproducibility is achieved when the same methods are performed on the same data in the same research context. As we did with the virion particle study. With this kind of approach, the same code is used to recreate the same data and conclusions. 
Whereas, replicability is achieved when the study is conducted on a new or different (subset) data with the similar or same methods to compare the results and achieve similar results. It is usually performed, when diiferent research teams are collecting data on the same hypothesis with similar methods.

Git and Github can potentially enhance reproducibility and replicability. For instance, with the version control we can track changes in code and data over time for reproducibility and then share the methods and the data analysis for replicability. Also the platform fosters collaboration and neat documentation with protocols and software control.

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
