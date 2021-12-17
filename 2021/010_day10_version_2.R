<!--
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
!pandoc % -f markdown -V geometry:margin=0.3in -o ~/Downloads/print_and_delete/day10.pdf
-->
    \tiny
```
# -------------------------
#      day 10 - version 2
# -------------------------
#      in this approach, start at left and brute force find all pairings (with no gaps between open & close symbols).
#      the pairings are then nulled (so skipped).
#      repeat the pairings, but skipping those already nulled.
#      stop when no more pairings can be found.
#  
#      the advantage:   conceptually easier, and maybe coding easier than prior apporach.
# -------------------------

#### Setup
setup <- function() {
    library(tinytest)
    line3  <- "{([(<{}[<>[]}>{[]{[(<()>"
    line  <- line3

## split_line in individual char[1]
    split_line  <- function(line = NULL) {
    line  <- unlist(strsplit(line, split=character(0)))
    }

    line  <- split_line(line)
    L  <- length(line) 

## Convert symbols to integers : Function
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
}
line  <- setup()
L  <- length(line)
line


{
    ## brute
    brute  <- function(pos){
        if (pos == L) return()
        right  <- pos + 1 # default
        right  <- find_candidate(pos, pos+1)
        if (right == 0) {
            print(line) 
            return("done")
        }
        if (is_pair(pos, right)) {
            set_paired(pos, right)
}

    }
    sapply(1:24, brute)
    line   
    options(error = NULL)

}

#-------------------
## helper functions
#-------------------
{

#   assume - we start with open bracket = pos
#   cand - refers to first possible closed bracket (ie add 1 to open bracket
#   position, before calling) 
#   cand  - if closed bracket, return as candidate.
#   cand  - if zero, skip, ie recurse with pos + 1 
#
find_candidate  <- function(pos, cand) {
    # pos isn't going to change; only helpful
    if (cand > L) {
        cat("****no more candidates, end of line", "\n")
        return(0)
    }
    if (line[[cand]] == 0) {
        cat(cand, "\n")
 #       if (cand == 24 ) browser()
        cand  <- find_candidate(pos, cand +1)
    } else {
        return(cand)
    }
}
## Check, if a position already paired?
    is_pair  <- function(left=1, right=1) {
        #brute(left, right)
        if (line[[left]] + line[[right]] == 0) return(TRUE)
        FALSE
    }

## When found to be pairs, set element to zero (as marker to skip) 
   set_paired  <- function(left, right) {
       ## are there TWO copies of line?
        line[[left]]  <<- 0
        line[[right]] <<- 0
        print(line)
    }
    
## is_open_bracket(pos)
    is_open_bracket  <- function(pos) {
        if (line[[pos]] < 0) return(TRUE)
        FALSE
    }

## is_closed_bracket(pos)
    is_closed_bracket  <- function(pos) {
        if (line[[pos]] > 0) return(TRUE)
        FALSE
    }


}
{## test find_candidate
    line
    pos = 1 
    cand = pos+1
    cand
    L
    (find_candidate(pos, cand))

    sapply(X= 2:7, find_candidate, cand= X+1 )

}

} ## end helpers


## Given pos, iterate from pos+1 to L to find a candidate.
brute  <- function(left, right) {
        print(paste0("(", left,",",
                     right, ")"))
    }

## checks
pos  <- 1
cand  <- find_candidate(pos+1)
        is_pair(pos, cand)

pos  <- 5
cand  <- find_candidate(pos+1)
cand
if( is_pair(pos,cand)) set_paired(pos,cand)

```
