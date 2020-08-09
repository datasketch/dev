library(tidyverse)
library(ggplot2)
library(patchwork)

archimedean_spiral <- function(n, a = 0, b = 1, turns = 3){
  # b separation of turns
  t <- seq(0, turns  * 2 *pi, length.out=n)
  x <- (a + b*t) * cos(t)
  y <- (a + b*t) * sin(t)
  d <- tibble::tibble(x, y)
  d$n <- 1:n
  d
}

archimedean_spiral_const_arc <- function(n = 100, s = 5, r = 1){
  # https://math.stackexchange.com/questions/877044/keeping-the-arc-length-constant-between-points-in-a-spiral
  #s <- 5 # Separation between points
  #r <- 1
  t <- purrr::accumulate(rep(0.01,n-1), function(t1, t2){ s/(r*sqrt(1 + t1^2))  + t1 },
                         .init = 0)
  x <- r * t * cos(t)
  y <- r * t * sin(t)
  d <- tibble::tibble(x, y)
  d$n <- 1:n
  d
}

circle_involute <- function(n, a = 2){
  # https://mathworld.wolfram.com/CircleInvolute.html
  t <- seq(0,5*pi, length.out=n)
  x <- a * (cos(t) + t * sin(t))
  y <- a * (sin(t) - t * cos(t))
  d <- tibble::tibble(x, y)
  d$n <- 1:n
  d
}

atzema_spiral <- function(n, turns = 3){
  t <- seq(0, turns * 2 *pi, length.out=n)
  x <- sin(t)/t - 2 * cos(t) - t * sin(t)
  y <- cos(t)/t - 2 * sin(t) + t * cos(t)
  d <- tibble::tibble(x, y)
  d$n <- 1:n
  d
}


vogel_spiral <- function(n){
  t <- 1:n
  r <- sqrt(t)
  golden_angle <- pi * (3 - sqrt(5))
  theta <- t * golden_angle
  x <- r * cos(theta)
  y <- r * sin(theta)
  d <- tibble::tibble(x, y)
  d$n <- 1:n
  d
}

d <- archimedean_spiral(200)
g1 <- ggplot(d) + geom_path(aes(x,y)) + coord_equal() +
  ggtitle('Archimedean')
g1

d <- circle_involute(200)
g2 <- ggplot(d) + geom_path(aes(x,y)) + coord_equal() +
  ggtitle('Circle Involute')
g2

d <- atzema_spiral(200)
g3 <- ggplot(d) + geom_path(aes(x,y)) + coord_equal() +
  ggtitle('Atzema')
g3

d <- vogel_spiral(200)
g4 <- ggplot(d) + geom_path(aes(x,y)) + coord_equal() +
  ggtitle('Vogel')
g4

gg <- g1 + g2 + g3 + g4
gg

ggsave("spirals.png", width = 4, height = 4)


## With different numbers of points

d <- archimedean_spiral(50)
g1 <- ggplot(d) + geom_point(aes(x,y)) + coord_equal() +
  ggtitle('Archimedean with 50 points')
g1

d <- archimedean_spiral(200)
g2 <- ggplot(d) + geom_point(aes(x,y)) + coord_equal() +
  ggtitle('Archimedean with 200 points')
g2

d <- archimedean_spiral_const_arc(200)
g3 <- ggplot(d) + geom_point(aes(x,y)) + coord_equal() +
  ggtitle('Archimedean (constant arc) with 200 points')
g3

d <- archimedean_spiral_const_arc(1000)
g4 <- ggplot(d) + geom_point(aes(x,y)) + coord_equal() +
  ggtitle('Archimedean (constant arc) with 1000 points')
g4


gg <- g1 + g2 + g3 + g4
gg
ggsave("archimidean-points.png", width = 12, height = 9)


## Vogel spiral



d <- vogel_spiral(20)
g1 <- ggplot(d) + geom_point(aes(x,y), size = 18) + coord_equal() +
  ggtitle('Vogel with 20 points')
g1

d <- vogel_spiral(50)
g2 <- ggplot(d) + geom_point(aes(x,y), size = 10) + coord_equal() +
  ggtitle('Vogel with 50 points')
g2

d <- vogel_spiral(200)
g3 <- ggplot(d) + geom_point(aes(x,y), size = 2) + coord_equal() +
  ggtitle('Archimedean (constant arc) with 200 points')
g3

d <- vogel_spiral(1000)
g4 <- ggplot(d) + geom_point(aes(x,y), size = 1) + coord_equal() +
  ggtitle('Archimedean (constant arc) with 1000 points')
g4


gg <- g1 + g2 + g3 + g4
gg
ggsave("vogel.png", width = 10, height = 10)




