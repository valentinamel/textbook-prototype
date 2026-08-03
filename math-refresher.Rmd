# Mathematics Refresher {#math-refresher}

Use this appendix when notation or algebra is getting in the way of the
statistical idea.

## What each chapter needs

| Chapter | Mathematics to review here |
|---|---|
| Basic Lecture 1 | units, percentages, variables, graphs |
| Basic Lecture 2 | sets, events, complements, unions, intersections |
| Basic Lecture 3 | functions, support, sums, weighted averages |
| Basic Lecture 4 | fractions, conditional bars, powers, square roots |
| Basic Tutorial 1 | sets, fractions, sums |
| Basic Lecture 5 | ordered pairs, products, sums, standardisation |
| Basic Tutorial 2 | fractions, products, sums |
| Basic Lecture 6 | functions, intervals, inequalities, powers, roots |
| Basic Lecture 7 | indices, sums, fractions, degrees of freedom |
| Basic Lecture 8 | sums, variance scaling, square-root rule, z-scores, t distributions |
| Basic Tutorial 3 | fractions, sums, roots, z-scores, degrees of freedom |
| Basic Lecture 9 | intervals, t critical values, two-sided zero contrasts |
| Basic Lecture 10 | hypotheses, standardisation, errors, and power |
| Basic Tutorial 4 | intervals, two-sided tests, degrees of freedom |
| Intermediate Lecture 1 | straight lines, slopes, indices, squared residuals |
| Intermediate Lecture 2 | standardisation, inequalities, intervals |
| Intermediate Lecture 3 | squares, ratios, sums of squares |
| Intermediate Lecture 4 | subscripts and multivariable equations |
| Intermediate Lecture 5 | indicators and reference categories |
| Intermediate Lecture 6 | products, powers, centering, combined effects |
| Intermediate Tutorials 1--2 | all regression notation above |

## Numbers, proportions, percentages, and units

A proportion is a part divided by a total:

\[
\text{proportion}=\frac{\text{count in category}}{\text{total count}}.
\]

Convert a proportion to a percentage by multiplying by 100. A change from 40%
to 46% is:

- a 6 **percentage-point** increase;
- a \(6/40=15\%\) **relative** increase.

Keep units through every calculation. If \(Y\) is percentage-point equity and
\(X\) is measured in seasons, a slope has units of percentage points per
season. Rescaling dollars to $100,000s changes coefficient size but not the
underlying fitted relationship.

## Order of operations

Use this order:

1. brackets or parentheses;
2. powers and roots;
3. multiplication and division;
4. addition and subtraction.

For example,

\[
\frac{12-8}{\sqrt{16}}=\frac{4}{4}=1.
\]

In R:

```r
(12 - 8) / sqrt(16)
```

Use parentheses generously in code when they make the intended calculation
clear.

## Equality, approximation, and inequalities

| Symbol | Read as |
|---|---|
| \(=\) | equals |
| \(\ne\) | does not equal |
| \(\approx\) | is approximately equal to |
| \(<,>\) | is less than, is greater than |
| \(\le,\ge\) | is less/greater than or equal to |
| \(\in\) | is an element of |

Do not replace \(=\) with \(\approx\). A probability returned by rounded R
output may be approximately 0.612; the fraction \(882/1441\) is exact for the
file.

Interval notation:

- \([a,b]\) includes both endpoints;
- \((a,b)\) excludes both endpoints;
- \((a,b]\) excludes \(a\) and includes \(b\).

For a continuous random variable, endpoint inclusion does not change a
probability because individual points have probability zero.

## Variables, functions, and graphs

A variable is a symbol whose value may vary. A function assigns one output to
each allowed input:

\[
y=f(x).
\]

In \(F_X(x)=P(X\le x)\), \(F_X\) names the CDF and \(x\) is the input at which
it is evaluated. The subscript identifies the random variable whose
distribution is described.

A graph's horizontal axis displays the input or predictor; the vertical axis
displays the function value or outcome. Read both labels and units before
interpreting shape.

## Straight lines, slopes, and intercepts

A line is

\[
y=a+bx.
\]

- \(a\) is the value of \(y\) at \(x=0\): the intercept.
- \(b\) is the change in \(y\) for a one-unit increase in \(x\): the slope.

Between two points \((x_1,y_1)\) and \((x_2,y_2)\),

\[
b=\frac{y_2-y_1}{x_2-x_1}.
\]

The sign gives direction. The magnitude depends on both measurement units.
An intercept need not be substantively meaningful when \(x=0\) is outside the
observed range.

## Subscripts and indices

The symbol \(x_i\) means the value of variable \(x\) for observation \(i\).
For \(n\) observations,

\[
x_1,x_2,\ldots,x_n.
\]

In multiple regression, \(x_{ij}\) is the value of predictor \(j\) for
observation \(i\). Keep the two roles separate:

- \(i=1,\ldots,n\) indexes observations;
- \(j=1,\ldots,k\) indexes predictors.

Capital \(X_i\) usually denotes a random variable before sampling; lower-case
\(x_i\) denotes its observed value.

## Summation notation

The Greek letter sigma means “add”:

\[
\sum_{i=1}^{n}x_i=x_1+x_2+\cdots+x_n.
\]

The sample mean is

\[
\bar x=\frac{1}{n}\sum_{i=1}^{n}x_i.
\]

For values 2, 5, and 8,

\[
\bar x=\frac{2+5+8}{3}=5.
\]

A weighted sum multiplies every value by its weight before adding. Expectation
for a discrete random variable is a probability-weighted sum:

\[
E[X]=\sum_x x\,p_X(x).
\]

## Powers, roots, and squared deviations

The square is \(x^2=x\times x\). The square root reverses a non-negative square:

\[
\sqrt{x^2}=|x|.
\]

Squaring a deviation makes both signs positive and gives more influence to
large deviations. This is why variance and least squares use squared terms.

If variance has squared units, its square root—the standard deviation—returns
to the original units.

The square-root sample-size rule is central to standard errors:

\[
\operatorname{SE}(\bar X)=\frac{\sigma}{\sqrt n}.
\]

To halve the SE, multiply \(n\) by \(2^2=4\).

## Degrees of freedom and t critical values

Degrees of freedom count how many pieces of information remain free after
estimating required quantities. For a one-sample t procedure, the \(n\)
deviations from the sample mean satisfy

\[
\sum_{i=1}^{n}(x_i-\bar x)=0.
\]

After \(n-1\) deviations are known, the final deviation is fixed by this
constraint. The procedure therefore uses

\[
df=n-1.
\]

The notation \(t_{0.975,df}\) means the value with 97.5% of a t distribution
to its left. It leaves 2.5% in the right tail, so \(\pm t_{0.975,df}\) are the
critical values for a 95% two-sided procedure. In R:

```r
qt(0.975, df = 24)
```

With few degrees of freedom, the t distribution has heavier tails and the
critical value is larger. It approaches the standard normal distribution as
the degrees of freedom increase.

The same idea reappears in regression. If a model estimates an intercept and
\(k\) slopes from \(n\) observations, the residual degrees of freedom are

\[
df=n-k-1.
\]

## Sets and event notation

A set is a collection of elements. In probability:

- \(\Omega\) is the sample space;
- \(A\subseteq\Omega\) is an event;
- \(A^c\) is the complement, “not \(A\)”;
- \(A\cup B\) is the union, “\(A\) or \(B\), or both”;
- \(A\cap B\) is the intersection, “both \(A\) and \(B\)”;
- \(\varnothing\) is the empty event.

In conditional probability,

\[
P(A\mid B)=\frac{P(A\cap B)}{P(B)},
\]

the vertical bar means “given.” The event after the bar supplies the reference
class and denominator.

## Fractions and rearranging equations

Multiplying the numerator and denominator by the same non-zero number does not
change a fraction. To solve a simple equation, apply the same operation to
both sides.

Example:

\[
z=\frac{x-\mu}{\sigma}
\]

implies

\[
z\sigma=x-\mu
\]

and therefore

\[
x=\mu+z\sigma.
\]

This rearrangement converts between a raw value and a z-score.

## Indicators and reference categories

An indicator takes values 0 and 1:

\[
D_i=
\begin{cases}
1,&\text{condition holds},\\
0,&\text{otherwise}.
\end{cases}
\]

In \(Y=\beta_0+\beta_1D+\varepsilon\):

- \(D=0\) gives mean \(\beta_0\);
- \(D=1\) gives mean \(\beta_0+\beta_1\);
- \(\beta_1\) is the 1-group minus 0-group difference.

For \(G\) categories and an intercept, use \(G-1\) indicators and name the
omitted reference category.

## Products, interactions, and combined effects

An interaction contains a product \(XZ\):

\[
Y=\beta_0+\beta_1X+\beta_2Z+\beta_3XZ+\varepsilon.
\]

The slope of \(X\) is \(\beta_1+\beta_3Z\). When \(Z=0\), it is \(\beta_1\);
when \(Z=1\), it is \(\beta_1+\beta_3\). Interpret the combined expression,
not \(\beta_3\) alone.

Centering replaces \(X\) with

\[
X_c=X-\bar X.
\]

Then \(X_c=0\) represents the sample mean of \(X\), often making lower-order
terms more meaningful. Centering changes coefficient representation but not
the fitted values of a correctly re-expressed model.

## Polynomial terms

A quadratic function is

\[
y=\beta_0+\beta_1x+\beta_2x^2.
\]

Its one-unit change from \(x\) to \(x+1\) is

\[
\beta_1+\beta_2(2x+1),
\]

so there is no single constant slope. Evaluate fitted values at meaningful
inputs and graph the curve within the observed range.

In an R formula, write a squared predictor as `I(x^2)` so R treats the
expression arithmetically.

## References and further practice

- [OpenStax, *College Algebra 2e*](https://openstax.org/details/books/college-algebra-2e)
  provides free chapters on equations, functions, graphs, polynomials, and
  algebraic manipulation.
- [Khan Academy Algebra](https://www.khanacademy.org/math/algebra) provides
  short explanations and practice on linear equations, functions, exponents,
  and polynomials.
- [R as a Calculator](https://walshc.github.io/ebi-prog/r-as-a-calculator.html)
  connects arithmetic and order of operations directly to R.

When practising with AI, ask for one problem at a time, show your working, and
request feedback on the first incorrect step rather than a replacement answer.
