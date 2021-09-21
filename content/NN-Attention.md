---
---

## Tags

#neural-network

## Content

Compares current hidden state (dot product) with all previous hidden states. Gets a softmax score of similarity and uses the states combined in place of/in conjunction with the current hidden state to produce an output. Used in context of RNN/LSTM/GRU or derivatives.

- improves NMT performance
- solves bottleneck problem
- helps with vanishing gradient
- provides some interpretability

### Types

**Basic dot-product attention**

$$
e_i = s^Th_i \in \mathbb{R}
$$

**Multiplicative**

where $W$ is a weight

$$
e_i = s^TWh_i \in \mathbb{R}
$$

**Additive**

where $W_1$ and $W_2$ are weight and $v \in \mathbb{R}$

$$
e_i = v^T\mathrm{tanh}(W_1h_i+W_2s) \in \mathbb{R}
$$

### Case Study

Used in the decoder layer of seq2seq models (especially in [translation models](Machine-Translation)).
