# Robust-Multiobjective-Optimization-via-Evolutionary-Algorithms-RMOEA

This repository provides implementations for the [paper](https://ieeexplore.ieee.org/document/8419222):

> Z. He, G. G. Yen, and Z. Yi, "Robust Multiobjective Optimization via Evolutionary Algorithms," in IEEE Transactions on Evolutionary Computation, vol. 23, no. 2, pp. 316-330, April 2019, doi: 10.1109/TEVC.2018.2859638.

## Abstract

Uncertainty inadvertently exists in most real-world applications. In the optimization process, uncertainty poses a very important issue and it directly affects the optimization performance. Nowadays, evolutionary algorithms (EAs) have been successfully applied to various multiobjective optimization problems (MOPs). However, current researches on EAs rarely consider uncertainty in the optimization process and existing algorithms often fail to handle the uncertainty, which have limited EAs' applications in real-world problems. When MOPs come with uncertainty, they are referred to as robust MOPs (RMOPs). In this paper, we aim at solving RMOPs using EA-based optimization search. We propose a novel robust multiobjective optimization EA (RMOEA) with two distinct, yet complement, parts: 1) multiobjective optimization finding global Pareto optimal front ignoring disturbance at first and 2) robust optimization searching for the robust optimal front afterward. Furthermore, a comprehensive performance evaluation method is proposed to quantify the performance of RMOEA in solving RMOPs. Experimental results on a group of benchmark functions demonstrate the superiority of the proposed design in terms of both solutions' quality under the disturbance and computational efficiency in solving RMOPs.

## Parameter Setting

For Matlab Version: The parameter setting is in the `RMOEA.m`.

```matlab
M;     % NO.Objectives
n;     % NO.Decision variables
N;     % The size of initial population
phi;   % Disturbance level
mu;    % Distribution index of SBX  
mum;   % Distribution index of polynomial mutation
r_c;   % Rate of SBX
r_p;   % Rate of polynomial mutation
num;   % The number of generations
pool;  % Parameter in tournament_selection
tour;  % Parameter in tournament_selection
Tnon;  % Number of sampled solutions
theta; % theta used in PBI
T;     % Neighborhood size
TN;    % Sampling size in robust detection
func;  % Benchmark
%Notify: The benchmark problems should be written in a separate document.
```

## Citation

If you find our work and this repository useful. Please consider giving a star and citation.

Bibtex:

```
@ARTICLE{RMOEA,
		 author={He, Zhenan and Yen, Gary G. and Yi, Zhang},
		 journal={IEEE Transactions on Evolutionary Computation},
		 title={Robust Multiobjective Optimization via Evolutionary Algorithms},
		 year={2019},
		 volume={23},
		 number={2},
		 pages={316-330},
		 doi={10.1109/TEVC.2018.2859638}}
```
