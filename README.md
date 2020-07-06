# SUU-AGH

Performance test on two graph mining systems: Fractal and Arabesque. 

## Dataset
We usedReddit Hyperlink Social Networkdata graph in our evaluation. The hyperlink networkrepresents the directed connections between two subreddits (a subreddit is a community on Reddit). Eachhyperlink is annotated with three properties: the timestamp, the sentiment of the source community posttowards the target community post, and the text property vector of the source post. The network is directed,signed, temporal, and attributed 

## Application

We evaluate the performance test on two graph mining systems: Fractal and Arabesque. Performancecomparison is based on the most popular graph mining problems:
 * **Motif Counting.** A motif is any connected, unlabeled graph pattern. The problem involves countingthe occurrences of all motifs in G up to a certain size.
 * **Frequent Subgraph Mining (FSM).** The problem involves listing all labeled patterns with k edgesthat are frequent in G (i.e., frequency of their matches in G exceed a threshold). The frequency of apattern (also called support) is measured in a variety of ways, but most systems choose the minimumnode image (MNI) support measure since it can be computed efficiently.
 * **Clique Counting.** K-clique is a fully-connected graph with k vertices. The problem involves countingthe number of k-cliques in G. Variations of this problem include counting pseudo-cliques, i.e., patterns5 whose edges exceed some density threshold; maximal cliques, i.e., cliques that are not contained in anyother clique; and, frequent cliques, i.e., cliques that are frequent (exceeding a frequency threshold).
 
 We evaluated Fractal and Arabesque on a wide array of applications: counting motifs with 3 and 4 vertices,counting k-cliques, for k ranging from 3 to 5; FSM with patterns of 3 edges on labeled datasets using varioussupports.3.3  LaunchWe have prepared docker images and scripts to run performance tests, available on github repository.

## Start
```
 git clone https://github.com/jplewa/SUU-AGH.git
 docker-compose up --build fractal
 docker-compose up --build arabesque
 ```
