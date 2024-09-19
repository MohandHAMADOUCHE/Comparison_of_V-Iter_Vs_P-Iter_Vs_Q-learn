# Comparison of Value Iteration, Policy Iteration, and Q-Learning for Solving Decision-Making Problems

This project focuses on comparing three methods for solving Markov Decision Processes (MDPs) in decision-making scenarios: Value Iteration, Policy Iteration (Dynamic Programming methods), and Q-Learning (Temporal-Difference method), implemented in MATLAB.

## Table of Contents

- [Overview](#overview)
- [Installation](#installation)
- [Results](#results)
- [Contributing](#contributing)
- [License](#license)

## Overview

In this project, we explore three major methods for solving Markov Decision Processes (MDPs) in decision-making scenarios under uncertainty:

- **Value Iteration**
- **Policy Iteration**
- **Q-Learning**

Each method is tested in different problem settings using MATLAB simulations. The project demonstrates that Policy Iteration is more efficient for complex and irregular scenarios, while a modified version of Q-Learning performs better in simple and regular problems.

We conduct numerical simulations in two environments: a grid-based environment and a mission planning scenario for an Unmanned Aerial Vehicle (UAV). All code is implemented using MATLAB.

## Installation

### Requirements

- MATLAB (any version supporting the base MATLAB functions)

### Getting Started

1. Clone the project repository:
    ```bash
    git clone https://github.com/MohandHAMADOUCHE/Comparison_of_V-Iter_Vs_P-Iter_Vs_Q-learn.git
    cd Comparison_of_V-Iter_Vs_P-Iter_Vs_Q-learn
    ```

2. Choose the appropriate test based on the case:

   - **2.1. To test the SelectionOptimal_Epsilon-value**: Navigate to the folder `"1_SelectionOptimal_Epsilon-value"` and run the MATLAB file `main.m`:
     ```matlab
     cd '1_SelectionOptimal_Epsilon-value'
     run('main.m')
     ```

   - **2.2. To compare the three methods with a regular case**: Navigate to the folder `"2_GenericRegularGrid"`, choose one of the subfolders corresponding to the different comparison versions, and run the file `main.m`:
     ```matlab
     cd '2_GenericRegularGrid/your-version-folder'
     run('main.m')
     ```

   - **2.3. To compare the three methods with an irregular case**: Navigate to the folder `"3_IrregularGrid"`, choose one of the subfolders corresponding to the different comparison versions, and run the file `main.m`:
     ```matlab
     cd '3_IrregularGrid/your-version-folder'
     run('main.m')
     ```

   - **2.4. To compare the three methods in an experimental UAV mission planning case**: Navigate to the folder `"4_MDP_Mission_Planning"` and run the file `main.m`:
     ```matlab
     cd '4_MDP_Mission_Planning'
     run('main.m')
     ```

## Results

The detailed results of the comparisons and simulations are presented in the published paper. You can access the full paper here: [Comparison of Value Iteration, Policy Iteration, and Q-Learning for solving Decision-Making Problems](https://ieeexplore.ieee.org/abstract/document/9476691).

## Contributing

We welcome contributions! Please follow the steps below:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Submit a pull request with a detailed explanation of your changes.

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.

The project is open source and free to use. Please cite this work in your publications:

```bibtex
@inproceedings{hamadouche2021comparison,
  title={Comparison of value iteration, policy iteration and Q-learning for solving decision-making problems},
  author={Hamadouche, Mohand and Dezan, Catherine and Espes, David and Branco, Kalinka},
  booktitle={2021 International Conference on Unmanned Aircraft Systems (ICUAS)},
  pages={101--110},
  year={2021},
  organization={IEEE}
}
```
