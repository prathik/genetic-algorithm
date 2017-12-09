# Genetic Algorithm in Lisp

Genetic algorithm works as follows:

* Pick best two from an initial set of population
* Best two determined by the fitness function
* Form the next generation of population as children of the best two picked
* Iterate

## Mating phase between the best two

* Pick a random crossover point
* All genes before crossover point come from first chromosome
* All genes after crossover point including crossover point come from second chromosome
* Mutate the new chromosome by inverting each gene with a probabilty of mutation rate

Code is very readable do take a look into it to understand deeper.

# Screenshots

![Alt text](https://raw.githubusercontent.com/prathik/genetic-algorithm/master/img/0.png?raw=true "Optional Title")

![Alt text](https://raw.githubusercontent.com/prathik/genetic-algorithm/master/img/1.png?raw=true "Optional Title")

![Alt text](https://raw.githubusercontent.com/prathik/genetic-algorithm/master/img/2.png?raw=true "Optional Title")

![Alt text](https://raw.githubusercontent.com/prathik/genetic-algorithm/master/img/3.png?raw=true "Optional Title")

![Alt text](https://raw.githubusercontent.com/prathik/genetic-algorithm/master/img/4.png?raw=true "Optional Title")

![Alt text](https://raw.githubusercontent.com/prathik/genetic-algorithm/master/img/5.png?raw=true "Optional Title")