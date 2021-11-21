# ARC
## Information Theory and Encoding:
### Arithmetic coding:
Input should be a matrix, such as [1 2 3 4;0.5 0.25 0.125 0.125], in which the first row contains all the code elements (e.g., 12,1,102,1) and the other row is the matching probabilities. Sequency should be a vector like [1 2 3 1 2 4].

### Iteration method is used to calculate channel capacity:
Input transition probability matrix, e.g., [0.5. 0.5,; 0.5, 0.5], and then the ``total iteration times``, ``channel capacity``, and the ``optimal distribuation`` will be given accordingly.

### Huffman coding:
For the implementation of Huffman coding, one can refer to ``introduction-cs-2021/HW6/Huffman.h``.
