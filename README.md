# RISC-V Symbolic Emulator

![CI](https://github.com/andrewtshen/riscv-symbolic-emulator/workflows/CI/badge.svg)

This project was built during the PRIMES 2019-2020 program by Andrew Shen under the mentorship of Anish Athalye.
The paper can be found at: https://math.mit.edu/research/highschool/primes/materials/2020/Shen.pdf

## Roadmap to the Directories
For more information on each of the directories use the README.md in each of the sub-directories.

### emulate
Contains the implementation of the RISC-V symbolic emulator, which contains the bulk of the project.

There are two types of RAM memory implementations: 
- array based RAM memory. This is the prefered emulator for running actual code, but fails to quickly reason about large pieces of memory.
- uninterpreted functional based RAM memory. This is the prefered emulator for verifying the inductive step of our proof as it allows much simpler reasoning for operations across large regions of memory. However, it is not as good for running large snippets of concrete code as many memory writes result in a large conditional, which scales poorly.

### legOS
The simplified kernel that we reason about in our proof. We implemented it in both the ARM and RISC-V variants of Assembly, however for the purposes of our proof, we only reason about the RISC-V variant.

### prerequisite_works
Contains the prerequisite work for this project. There are miscellaneous different projects in here, some complete and some partially complete. Currently, the following directories are included in `prerequisite_works`:
- `lang`, a simple language using Python libraries. Explores syntax trees and how languages are interpreted and compiled.
- `rkt_work`, assorted Racket work, many of which are just small experiements.
- `sign`, a sign function compilied down to both ARM and RISC-V Assembly.
- `software-foundations`, work from the software foundations book.
- `test_write`, example of Rosette, which was used in the presentation as well.
- `z3-proofs`, an assortment of proofs in z3 with Python.

### related_works
Contains different related works that were used for reference during the making of this project. Currently, the following repositories are included in `related works`:
- `serval-sosp19`
- `serval-tutorial-sosp19`
- `unitary`
- `xv6-public`
- `xv6-riscv-fall19`

### report
Contains the written report of this work as well as the presentation presented at MIT PRIMES '20.
