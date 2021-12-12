
---
title: "`r knitr::current_input()`"
date: "`r paste('last updated', 
    format(lubridate::now(), ' %d %B %Y'))`"
output:   
  html_document:  
        code_folding: show
        toc: true 
        toc_depth: 4
        toc_float: true
  pdf_document:   
    latex_engine: xelatex  
    toc: true
    toc_depth:  4   
fontsize: 11pt   
geometry: margin=0.4in,top=0.25in   
TAGS:  regression
---
~/code/MASTER_INDEX.md
file="/home/jim/.config/nvim/templates/skeleton.R"
https://adventofcode.com/2021/day/10
# R
#
#

    line3  <- "{([(<{}[<>[]}>{[]{[(<()>"

    line  <- line3


## split_line in individual char[1]
    split_line  <- function(line = NULL) {
    line  <- unlist(strsplit(line, split=character(0)))
    }

    line  <- split_line(line)
    L  <- length(line) 
    paired  <- vector(mode="logical", length=L) # default all F
    paired

## Check, if a position already paired?
    is_pair  <- function(left=1, right=1, line=NULL) {
        if (line[[left]] + line[[right]] == 0) return(TRUE)
        FALSE
    }

## When found to be pairs, mark as TRUE
    mark_paired  <- function(left, right, line=NULL) {
        paired[[left]]  <- TRUE
        paired[[right]]  <- TRUE
    }

    ## Function
    f  <- function(e) {
        if (e == "(") return(-1)
        if (e == ")") return(1)
        if (e == "[") return(-2)
        if (e == "]") return(2  )
        if (e == "{") return(-3 )
        if (e == "}") return(3)
        if (e == "<") return(-4 )
        if (e == ">") return(4)
        return(0)
    
    }

## convert all chars to ints (easier on eyes)
    line  <- vapply(line, f, 3)  # integer, example 3
    


## first closing
find_right  <- function(pos = 1, line=NULL){
    if (line[[pos]] > 0) return(pos)
    if (pos == length(line)) return("NOT FOUND")
    return(find_right(pos=pos+1, line))
}

{
    library(tinytest)
find_right(pos=1, line=c(-1,-2,3))
find_right(pos=1, line=c(1,-1,-2,3))
find_right(pos=1, line=c(-1,-1,-2,-3))
}

## Given current pos, return pos of next possible candidate to pair with
find_left  <- function(pos = NULL, line=NULL){
    candidate  <- pos -1
    if (candidate <= 0) return("ERROR")
    return(candidate)
}

options(error = browser)
check_candidate  <- function(candidate = NULL, pos=NULL ){
## candidate a match with pos?
if ( is_pair(candidate, pos) ) {
    mark_paired(candidate, pos)
    print("find next right")
}
}

check_candidate(candidate = 6, pos =7 )

if (
## already paired with someone?
    if (paired[[candidate]] == TRUE) return(find_left(candidate-1, line) )

## should it be paired?
    if (is_pair(candidate -1, candidate, line)) {
        mark_paired(candidate-1, candidate, line)
        print("must move to right")
    }
}

## test find_left
line
paired
candidate  <- find_left(pos = 7, line=line)

check_candidate(candidate, pos=7, line = line)



    # pair?  then skip
    if (is_pair(candidate -1 , candidate) ){
            make_pair(candidate -1 ,  candidate) 
            find_left(pos = candidate -2)}
    candidate

}


## Begin
pos  <- find_right(pos = 1, line = line)
find_left(pos = pos, line = line)

