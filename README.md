## Code to accompany: *[Device-independent tests of structures of measurement incompatibility](https://arxiv.org/abs/1902.05841)*
#### Marco Túlio Quintino, Costantino Budroni, Erik Woodhead, Adán Cabello, and Daniel Cavalcanti

This is a repository for the code used to calculate the numerical results presented in the article "*Device-independent tests of structures of measurement incompatibility*, Marco Túlio Quintino, Costantino Budroni, Erik Woodhead, Adán Cabello, and Daniel Cavalcanti, [Phys. Rev. Lett. 123, 180401 (2019)](https://doi.org/10.1103/PhysRevLett.127.200504), [arXiv:1902.05841](https://arxiv.org/abs/1902.05841)".

 MATLAB code requires:
- [cvx](http://cvxr.com/) - a free MATLAB toolbox for rapid prototyping of optimization problems

We have also used functions of QETLAB ([QETLAB - A MATLAB Toolbox for Quantum Entanglement](http://www.qetlab.com/)), but all used functions can be found in the subfolder QETLAB_used_functions.

The main script in this repository is:
- [run1.m](https://github.com/mtcq/di-certification-measurement-incompatibility/blob/master/measurement_structures/run1.m)
Script used to generate the values presented in Table 1 of the paper. It evaluates the maximal score on the inequality given by Inow for all different sets of correlations considered in the paper. By default, the inequality Inow is set as I3322 and the NPA hierarchy level as level=2. These parameters may be adjusted to consider different inequalities and different levels of the NPA hierarchy. This script calls and explains all the subroutines, used to evaluate the maximal violation of a given Bell inequalities.

The Bell inequalities used in this project are declared in the script [load_variables1.m](https://github.com/mtcq/di-certification-measurement-incompatibility/blob/master/measurement_structures/load_variables1.m).
