#import "lib/typst-palette/src/palette.typ": xcolor

// Functions

#let red(body) = text(fill: xcolor.red, body)

#let hrule(length) = line(start: ((100% - length)/2, 0pt), length: length)

#let question(points, body) = {
  body
  h(1fr)
  if points > 1 [
    \[#points pts\]
  ] else [
    \[#points pt\]
  ]
}

#let make-title(
  logo: none,
  title: none,
  subtitle: none,
  affiliations: none,
  body,
) = {

  set par(justify: true)
  set align(center)
  set text(font: "CMU Sans Serif")

  // Logotype
  image(
    width: 2.5cm,
    height: 2.5cm,
    logo,
  )

  v(2cm)

  {
    set par(leading: 1em)

    // Title: Course code and name
    text(size: 16pt, title)
    linebreak()

    // Subtitle: Type of examination and date
    text(size: 14pt, subtitle)
    linebreak()
  }

  v(1.5cm)

  // Horizontal ruler
  hrule(70%)

  // Affiliations
  text(size: 12pt, affiliations)

  v(0.5cm)
  {
    set text(font: "Computer Modern", 10pt)
    set align(left)
    body
  }
}

// Begin document

#set page(margin: (y: 3cm))

// Title page
#make-title(
  logo: "assets/KTH_Logotyp_RGB_2013.png",
  title: "XY1234 Course Name",
  subtitle: "Exam -- Jan 1970",
  affiliations: [
    Division of Decision and Control Systems \
    School of Electrical Engineering and Computer Science \
    KTH Royal Institute of Technology \
  ],
)[
  #set terms(separator: ". ", hanging-indent: 0pt, spacing: 2em)

  Re-exam (omtentamen), #red[January 1#super[st], 1970, kl 00.00 - 05.00]

  #v(1em)

  / Aids:
    Slides of the lectures (#red[not exercises]),
    lecture notes (summary.pdf),
    mathematical tables.

  / Observe:
    Do not treat more than one problem on each page. Each step
    in your solutions must be motivated. Write a clear answer
    to each question. Write name and personal number on each
    page. Please only use one side of each sheet. Mark the total
    number of pages on the cover.

  / Grading: \
    Grade A: $>= 43$ #h(1em) Grade B: $>= 38$ \
    Grade C: $>= 33$ #h(1em) Grade D: $>= 28$ \
    Grade E: $>= 23$ #h(1em) Grade Fx: $>= 21$ \

  / Responsible:
    John Doe #red[aaaxxxyyzz]

  / Results:
    Posted no later than #red[January 15#super[th], 1970]

  #v(1em)
  #emph[Good luck!]
]

// Problem page -- Quiz
#{
  pagebreak(weak: true)
  set par(justify: true)
  set text(font: "CMU Serif", size: 10pt)

  heading(level: 1)[Problem 1 - Quiz]

  v(1.5em)

  enum(numbering: "(a)", indent: 0pt, tight: false, spacing: 1.5em,
    question(1)[Why can’t we use the Policy Gradient approach for off-policy
                learning?],
    question(1)[Consider the following problem: in each round you choose a
                scalar $theta$ and you observe a random variable $f(theta)$
                such that $EE[f(theta)] = g(theta)$. Which technique would
                you use to solve in $theta$ the equation
                $g(theta) − alpha = 0$? (for some given $alpha$)],
    question(1)[What is the complexity (number of operations) of solving the
                Bellman’s equations in a finite time-horizon MDP with S
                states, A actions, and time-horizon T ?],
    question(1)[Is the SARSA algorithm based on the stochastic approximation
                algorithm or the stochastic gradient algorithm?],
    question(1)[Is the Q-learning algorithm with function approximation
                based on the stochastic approximation algorithm or the
                stochastic gradient algorithm?],
    question(1)[In SARSA, we propose to use $epsilon$-greedy policy with a
                value of $epsilon$ decreasing over time. More precisely, we
                select $epsilon_t = 1/t^2$. The algorithm does not seem to
                converge. Can you explain why?],
    question(1)[In actor-critic algorithms, how many parameters do we need
                to update? What do they correspond to?],
    question(1)[Suppose we take the step-size $alpha_t = 1/log(t)$ in the
                Q-learning algorithm. Are the iterates guaranteed to converge
                almost surely to the true Q-function?],
    question(2)[Let $X_1, X_2, ...$ be an homogenous Markov chain with finite
                state space. Is the reverse process starting at time $N$ also a
                Markov chain?
                (The reverse process is $(X_N , X_(N−1), ..., X_1)$)],
  )

}

// Problem page
