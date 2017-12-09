;; Genetic algorithm in lisp
;; chromosome is six elements
;; gene is either 0 or 1
;; fitness is sum of 1s in a chromosome

;; util

(defun get-n-items (lst num)
        (if (> num 0)
            (cons (car lst) (get-n-items (cdr lst) (- num 1)))
            '()))

(defun slice (lst start count)
        (if (> start 0)
            (slice (cdr lst) (- start 1) count)
            (get-n-items lst count)))

;; main

;; nice way to build chromosomes
;; (bc build chromosome with gene '(0 1 0 0 1 1)
;; highly readable dsl
(defmacro bc (build cromosome with gene genes)
  genes)

;; fitness function which is sum of all the
;; genes in the chromosome
(defun fitness (chromosome)
  (reduce #'+ chromosome))

;; fittest in a population
(defun fittest (population)
  (if (eq population nil)
      '(0 0 0 0 0 0)
      (if (> (fitness (car population)) (fitness (fittest (cdr population))))
	  (car population)
	  (fittest (cdr population)))))

;; given a population of chromosomes pick
;; the best two to mate and form the next generation
(defun fittest-two (population)
  (cons (fittest (cdr population))
	(cons (fittest population) ())))

;; pick a point of c2, what ever is before that
;; point comes from c1 and whatever is after is
;; from c2
(defun copy-at-point (c1 c2 point)
  (if (eq point 0) c2
      (if (eq point 7) c1
	  (
	   ;; copy logic
	   append (slice c1 0 point) (slice c2 point (- 6 point))
	   ))))

;; pick a random point and perform a crossover
(defun crossover (fpop)
  (copy-at-point (nth 0 fpop) (nth 1 fpop) (random 7)))

;; configurable rate of genetic mutation
(setq mutation-rate 10)

;; flips a value with the probabilty mutation rate
(defun flip-value (gene)
  (if (eq 0 (random mutation-rate)) (if (eq gene 0) 1 0) gene))

;; helper function to mutate a chromosome
(defun mutate (chromosome)
  (mapcar #'flip-value chromosome))

;; build the next generation from the fittest
;; two of the previous population. This is
;; the mating phase.
(defun next-gen (fpop)
  (cons
   (mutate (crossover fpop))
   (cons
    (mutate (crossover fpop))
    (cons
     (mutate (crossover fpop))
     (cons
      (mutate (crossover fpop)) nil)))))

;; An initial population
(defun initial-population ()
  (cons
   (bc build chromosome with gene '(0 1 0 1 0 1))
   (cons
    (bc build chromosome with gene '(0 0 0 1 0 0))
    (cons
     (bc build chromosome with gene '(0 1 0 1 0 0))
     (cons
      (bc build chromosome with gene '(1 0 0 1 0 0)) nil)))))

;; Evolution
(setq popuholder (initial-population))
(setq popuholder (next-gen (fittest-two popuholder)))
