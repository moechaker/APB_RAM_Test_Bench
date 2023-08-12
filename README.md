# ABP RAM Test Bench

This repository contains a comprehensive SystemVerilog test bench along with relevant files, aimed at verifying the proper operation and data integrity of an Address Bus Protocol (ABP) RAM device. The test bench utilizes constraint randomization to generate an extensive range of test scenarios, focusing on address lines, read/write operations, and data transactions to thoroughly assess the behavior of the ABP RAM across various conditions. The signal "chip_select" (CS) is held active and not randomized.

## Introduction

The ABP RAM Verification Test Bench project is dedicated to ensuring the accurate functionality of an ABP RAM device through rigorous testing. The test bench generates diverse sequences of ABP transactions, varying addresses, read/write actions, and data patterns, effectively covering a wide spectrum of testing scenarios. This methodology effectively uncovers potential anomalies such as data corruption and address decoding errors.

Throughout the simulation process, the test bench orchestrates ABP transactions and interacts with the RAM device. The device's responses are meticulously monitored and cross-referenced with expected outcomes, enabling the detection of any inconsistencies or discrepancies that may arise.

## Important Notes
- PLEASE NOTE THAT I HAVE NOT WRITTEN THE DESIGN, I HAVE ONLY VERIFIED IT
- design.sv IS NOT WRITTEN BY ME
- EVERYTHING ELSE IS DONE BY ME
- sorry for shouting that out lol, I just wanted it to be seen

## Usage

To run the design verification test bench, follow these steps:

1. Visit this link: https://www.edaplayground.com/x/adcn
2. Top right, hit login and create an account
3. Eda Playground might open a new playground for you, so go ahead and click on my link again to open my playground
4. On the left, click on "Open EPWave after run" under Tools & Simulators if you wish to analyze the waveforms
5. hit Run


By utilizing this ABP RAM test bench, potential issues and discrepancies in the ABP RAM's behavior can be identified and rectified early in the development process, leading to a more robust and reliable final product.




