---
---

## Tags

#nlp, #neural-network, #statistics 

## Content

### Statistical Machine Translation

1990-2010

$$
\underset{y}{\mathrm{argmax}}P(y|x)
$$

Bayes transformation. $P(x)$ is not needed in argmax, therefore dropped.

$$
= \underset{y}{\mathrm{argmax}}P(x|y)P(y)
$$

Needs large amount of parallel data.

To learn model from corpus using alignment.

$$
P(x, a|y)
$$

with $a$ as alignment (world level correspondence between source and target).

Some words have no corresponding target counterparts.

They can also be many 2 one, one 2 many, or many 2 many

$a$ is a **latent variable**: not explicitly defined in data.

Impose strong independent assumptions in model. Decoding.

#### Cons

Complex
Hundreds of details

Many separately designed sub components

Lots of feature engineering - fragile

Require compiling and extra resources (parallel corpus)

Lots of human labor required.

### Neural Machine Translation

Uses a seq2seq (sequence to sequence) model using two RNNs.

```mermaid
flowchart
    subgraph Input Text
    I --- like --- bananas
    end
    I --> 1
    like --> 2
    bananas --> 3
    subgraph Seq 2 Seq
    subgraph er [Encoder RNN]
    1 --> 2
    2 --> 3
    end
    er == Initial State ==> dr
    subgraph  dr [Decoder RNN]
    4 --> 5
    5 --> 6
    end
    end
    4 --> 我 --> 5 --> 喜欢 --> 6 --> 香蕉
    subgraph Output Text
    我 --- 喜欢 --- 香蕉
    end

```

Conditional - prediction based on encoder output.

Multi-layer:

```mermaid
flowchart

    subgraph Seq 2 Seq
    Input --> a1
    Input --> a2
    Input --> a3
    subgraph er [Encoder RNN]
    a1 --> b1
    a2 --> b2
    a3 --> b3
    end
    subgraph  dr [Decoder RNN]
    a4 --> b4
    a5 --> b5
    a6 --> b6
    end
    b4 --> o1 --> a5
    b5 --> o2 --> a6
    b6 --> o3
    a1 --> a2 --> a3 --> a4 --> a5 --> a6
    b1 --> b2 --> b3 --> b4 --> b5 --> b6
    subgraph Output
    o1 --- o2 --- o3
    end
    end

```

#### Encoder RNN

Input is read by the encoder RNN, producing a initial hidden state for the [Decoder](Machine-Translation#Decoder RNN).

#### Decoder RNN

Reads the initial state and writes output.

```mermaid
flowchart LR
    s[<START>] --> l1 --> l2 --> l3 --> l4
    l1 -- I --> l2 -- Like --> l3 -- Bananas --> l4 --> e[<END>]
```

##### Beam Search

Helps with highest score searching

On each step - save the $k$ most probable partial translations.

$k$ is known as the **beam size**

### Assessing Machine Translation

#### BLEU (Bilingual Evaluation Understudy)

Compares the machine translation to one or several human-produced translations. Computes a similarity score based on

- n-gram precision (1, 2, 3, 4 grams)
- Plus a penalty for short translations

##### Cons

Many valid ways to translate.
