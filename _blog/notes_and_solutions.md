alludedThese notes serve the following purpose. Firstly, they list and summaries
important concepts in Category Theory and how they can be expressed in Haskell.
Secondly, the book content is compared to other books I am reading in parallel.

In composing this text I will follow these rules:
- Notes: are for references to other books and papers
- Bold font: is for definitions and questions of challenges
- Italic: If things that still need to be defined appear in text

# 0 Preface

'Category Theory for Programmers' was written as a series of blog posts that are at times very vague about the concepts that are introduced


 reading .... text was very insightful for me. He actually wrote his second chapter in such a way that Bartosz blog posts make more sense.

> [[CH]](#C), Chapter 2, page 17:</br>
> To establish a link between functional programming and category theory, we need to find a category that is applicable. Observe that a type in a programming language, corresponds to a set in mathematics. Indeed, the type `int` in C based languages, corresponds to some finite set of numbers, the type `char` to a set of letters like 'a', 'z' and '$', and the type `bool` is a set of two elements (true and false). This category, the category of types, turns out to be a very fruitful way to look at programming.

> [[CH]](#CH) Section 1.1, page 9:</br>
> | Category         | Objects            | Arrows                 |
> | ---------------- | ------------------ | ---------------------- |
> | $\mathbf{Hask}$  | types              | maps                   |
> | $\mathbf{Set}$   | sets               | maps                   |
> | $\mathbf{Top}$   | topological spaces | continuous functions   |
> | $\mathbf{Vect}$  | vector spaces      | linear transformations |
> | $\mathbf{Grp}$   | groups             | group homomorphisms    |
> Table 1-1-1: Some examples of omnipresent categories

In all categories listed in [Talbe 1-1-1](table-1-1-1), the arrows correspond to *structure preserving maps* (which do not necessarily need to be functions, but can be assignments such as numbers to football players). For the application of category theory to Haskell we work with the category $\mathbf{Hask}$ which is a suset of $\mathbf{Set}$ and contains all Haskell types. More on that in [Chapter 2](#2-types-and-functions).

# 1 Category: The Essence of Composition
________________________________________________________________________________


## 1-1 Arrows as Functions & 1-2 Properties of Composition
In Haskell functions (`f` and `g`) between objects (`A`, `B` and `C`) and their composition can be declared as
|                      | Mathematical Notation           | Haskell Type Signature           |
| -------------------- | ------------------------------- | -------------------------------- |
| functions            | $f: A \to B$ and $g: B \to C$   | `f :: A -> B` and `g :: B -> C`  |
| function composition | $g \circ f: A \to C$            | `g . f :: A -> C`                |
| identity function    | $\text{id}_A: A \to A$          | `id :: a -> a` (part of Prelude) |
Table 1-1-1


In mathematics in general, and in category theory specifically, a commutative diagram is a diagram such that all directed paths in the diagram with the same start and endpoints lead to the same result.

## 1-2 Properties of Composition
For any category the following rules two apply, which specify it's composability.

1) Identity Laws
In Haskell, the identity function is part of the standard library (Prelude).
The identity function is polymorphic because it accepts any type, indicated
by the type variable a.
```
id :: a -> a
id x = x

f :: A -> B
f ◦ id == f
id ◦ f == f
```

2) Associative Law
As equality is not defined for functions in Haskell, we can it as pseudo code:
```
f :: A -> B
g :: B -> C
h :: C -> D
h ◦ (g ◦ f) == (h ◦ g) ◦ f == h ◦ g ◦ f
```

## 1-4 Challenges
**1. Implement, as best as you can, the identity function in your favorite
language.**</br>
Skip

**1. Implement, as best as you can, the identity function in your favorite
language.**</br>
Create a .hs file and write down the identity function:
```
-- chapter_1.hs:
identity :: a -> a
identity x = x
```
Then in terminal enter ghci:
```
λ: :l chapter_1.hs
λ: compose sqrt sqrt 1.0
1.0
λ: compose (+1) (+1) 1.0
3
```
**2. Implement the composition function. It takes two functions as arguments and returns a function that is their composition.**</br>
You can look up what signature our function compose must have, by typing `:t (.)` into ghci.
In the same file created above type the new function
```
-- chapter_1.hs:
compose ::  (b -> c) -> (a -> b) -> a -> c
compose g f = (g . f)
```
Testing it in ghci should give the same resutls as:
```
λ: :l chapter_1.hs
λ: compose sqrt sqrt 1.0
1.0
λ: compose (+1) (+1) 1.0
3
```

**3. Write a program that tries to test that your composition function respects identity.**</br>
To verify that our answer is correctly implemented, we need side effects which we can't use in Prelude. Thus, I use IO:
```
main :: IO ()
main = do
  let test_a = compose sqrt identity 4.0 == 2.0
  let test_b = compose identity sqrt 4.0 == 2.0

  print $ show test_a
  print $ show test_b
```
and execute the script in the terminal using:
```
$ runghc chapter_1.hs
$ "True"
$ "True"
```

**4. Is the world-wide web a category in any sense? Are links morphisms?**</br>
The world wide web is indeed a category if we consider the objects to be
webpages and for there to be an “arrow” between A and B if there is a way to
get to B from A by clicking on links.

**5. Is Facebook a category, with people as objects and friendships as morphisms?**</br>
No, since friendships are not composable.

**6. When is a directed graph a category?**</br>
If the digraph observes the identity and associativity law by containing self-loops and if `a -> b -> c` then it must follow that `a -> c`.

# 2 Types and Functions
________________________________________________________________________________

## 2-5 Pure and Dirty Functions
Putting it simple, all functions are pure in Haskell as long as they do not interact with the `IO Monad`. Situations in which you have to perform I/O actions are, i.e., when implementing random number generators, which have to interact with the outside world (such interaction is also called *side effects*) to generate a reasonably random number. This can be done using, i.e., the `getStdGen` I/O action of the `System.Random` module.

Through Haskell's pure functions we can make the mapping to the category $\mathbf{Set}$ and reason with Haskell in a categorical manner (while other imparativ programming langues do it through a more artificial way).

## 2-6 Examples of Types
In programming language, types are sets (often bounded by their bit range)!

**`Void` Type for the Empty Set**
: In the Haskell module `Data.Void` it is declared as `absurd :: Void -> a`. The type `Void` represents falsity, and the type of the function `absurd` corresponds to the statement that from falsity follows anything. The `absurd` function can never be executet, as it can no term of type `Void` exists.§

> [[SSC]](#SSC), page 7:<br/>
> The empty set $\varnothing := \{\}$ has no elements and is a subset of every other set.


**`Unit` Type for the Singleton Set**
: A singleton set contains only on object, such as `44` or `('a', 'b')`. Whatever is being fed into a singleton set returns always this one object,
```
f44 :: a -> Integer
f44 _ = 44
```
> [[CM]](#CM), page 19:<br/>
> A singleton is also called a *point* or *one-element set*, since when it appears in composition, it focuses the preceding mappings to a single point projection.

A special kind of singleton set, that is used for side-effects, is the one that contains the `unit` type,
```
funit :: a -> ()
funit _ = ()
```

**`Tuple` Types**
: Tuple types, `(x,y)`, are not discussed in this section, but it will be very important for later in [Section 5-5](#5-5-products) when introducing products, $x \times y$. For more information on them read [[PC]](#PC), Section 2.3, page 44.

**`Bool` and other Type**
: This introduction to types from a categorical perspective is quite different from any book that simply introduces a programming language. The latter often introduces many more types such as `Bool`, `List`, `Int` and so on. Those types however, are a composition of more fundamental concepts and will be introduced later starting with algebraic data types, [Section 6](#6-simple-algebraic-data-types).

## 2-7 Challenges

**1. Define a higher-order function (or a function object) memoize in your favorite
language. This function takes a pure function f as an argument and returns a
function that behaves almost exactly like f, except that it only calls the
original function once for every argument, stores the result internally, and
subsequently returns this stored result every time it’s called with the same
argument. You can tell the memoized function from the original by watching
its performance. For instance, try to memoize a function that takes a long
time to evaluate. You’ll have to wait for the result the first time you call
it, but on subsequent calls, with the same argument, you should get the result
immediately.**</br>
Searching the web provided my plenty examples on how to write a Memoization
function wrapper by hand for specific data types, specifically for Int for
Fibonacci sequence, but I haven't figured out how to write a short
polymorphic wrapper. Digging into it reveals much I have no idea about yet,
such as applying the Yoneda Lemma:
http://conal.net/blog/posts/memoizing-polymorphic-functions-via-unmemoization
Conal implemented this approach in the MemoTrie module, loaded as `Data.MemoTrie`

More reasons for headaches in Haskell are explained at the beginning of
[Chapter 4.](#4-kleisli-categories).

**2. Try to memoize a function from your standard library that you normally use to
produce random numbers. Does it work?**</br>
No, if it would work it would be a random number generator.

**3. Most random number generators can be initialized with a seed. Implement a
function that takes a seed, calls the random number generator with that seed,
and returns the result. Memoize that function. Does it work?**</br>
Skip

**4. Which of these C++ functions are pure? Try to memoize them and observe what
happens when you call them multiple times: memoized and not.**</br>
Skip

**5. How many different functions are there from Bool to Bool? Can you implement
them all?**</br>
There are $2^2$ possible *endomaps* `f: Bool -> Bool` (see [[CM]](#CM), page 34).
```
boolMap1 :: Bool -> Bool
boolMap1 True = True
boolMap1 False = False

boolMap2 :: Bool -> Bool
boolMap2 True = False
boolMap2 False = False

boolMap3 :: Bool -> Bool
boolMap3 True = True
boolMap3 False = True

boolMap4 :: Bool -> Bool
boolMap4 True = False
boolMap4 False = True
```

**6. Draw a picture of a category whose only objects are the types `Void`, `()` (unit) and `Bool`; with arrows corresponding to all possible functions between these types. Label the arrows with the names of the functions.**</br>
<img src="./imgs/challenge_2_7_6.png" alt="Answer to 2.7.6" style="height:200px;"/>


# 3 Categories Great and Small
________________________________________________________________________________


## 3-2 Simple Graphs

*Free Category*: Directed graphs

> Note: This subsection contains the answer for Challenge 1.4.6 on page 10

## 3-3 Orders
> [[SSC]](#SSC), Chapter 1: Goes into far more details on orders than given here.

**Preorder**
: A set, whose elements can be ordered by morphisms according to $<$ and $=$. A more precise definition is given in [[SSC]](#SSC) (Definition 1.25), which clarifies that preorder relations are binary [[SSC]](#SSC) (Definition 1.8): a relation between the sets $X$ and $X$, i.e. a subset $R \subseteq X \times X$. In other words, for a binary operation, the co- and domains are of the same set.

As booleans values `True` and `False` can be associated to $1$ and $0$, the boolean set is a preorder.

**Partial Order (poset for short)**
: A preorder that satisfies an additional condition: if $a \leq b$ and $b \leq a$ then $a=b$.

> [[SSC]](#SSC), Definition 1.25:</br>
> For a *preorder set*, if $a \leq b$ and $b \leq a$, we write $b \cong a$ and say $a$ and $b$ are equivalent.
>
> Remark 1.30: A *preorder* is a *partial order* if we additionally have that $b \cong a$ implies $b = a$.

**Total Order**
:

**Hom-set**
: A set of morphisms from object $a$ to object $b$ in a category $\mathcal{C}$ is called a homset and is written as $\mathcal{C}(a,b)$ (or, sometimes,  $\text{Hom}\mathcal{C}(a,b)$).

## 3-4 3-5 Monoid as Set and Category

Monoid are ubiquitous in programming, showing up as `Char`, `List`, recursive data structures, futures in concurrent programming, and so on. They are categories, $\mathcal{C}$, with just one object, $* \in \mathcal{C}$, such that there is only one homset, $\text{Hom}\mathcal{C}(*,*)$, which is the identity morphism, $\text{id}_*: * \to *$.

> [[CH]](#CH), Definition 1.2, page 10:</br>
> A *monoid* as set $(M, e, \diamond)$ consists of:</br>


> [[PC]](#PC), Definition 1.46, page 18:</br>
> A *monoid* as category $(M, e, \diamond)$ consists of:</br>
> - a single set $M$, called the *carrier*;</br>
> - an element $e \in M$, called the *unit*; and</br>
> - an associative function $\diamond : M \times M \to M$, called the (binary) *operation*.
>
> These are subject to two conditions:
> - unitality/identity: for any $m \in M$, we have $e \diamond m = m$ and $m \diamond e = m$, thus $e = \text{id}_M$;</br>
> - associativity: for any $l,m,n \in M$, we have $(l \diamond m) \diamond n = l \diamond (m \diamond n).$



## 3-6 Challenges
**1. Generate a free category from:**
- a) A graph with one node and no edges

<img src="./imgs/challenge_3_6_1_a.png" alt="Answer to 3.6.1.a" style="height:70px;"/>

However I am not quite sure about this answer, because [[CM]](#CM) speaks of interla morphisms on page 30.

- b) A graph with one node and one (directed) edge (Hint: this edge can be composed with itself)

<img src="./imgs/challenge_3_6_1_b.png" alt="Answer to 3.6.1.b" style="height:70px;"/>

- c) A graph with two nodes and a single arrow between them

<img src="./imgs/challenge_3_6_1_c.png" alt="Answer to 3.6.1.c" style="height:70px;"/>

- d) A graph with a single node and 26 arrows marked with the
letters of the alphabet: a, b, c ... z.

**2. What kind of order is this?**
- a) A set of sets with the inclusion relation: A is included in B if every element of A is also an element of B.

Our morphisms are subset relations. Every set includes itself, $A \subseteq A$. Inclusion is also composable. $A \subseteq B$ and $B \subseteq C$ implies $A \subseteq C$. This means that we at least have a preorder. If $A \subseteq B$ and $B \subseteq A$ then $A = B$, which means that we at least have a partial order. Not all objects are a subset of each other though. For example {1} and {2,3} are not subsets of each other. This means we don't have a total order and only a partial order.

- b) C++ types with the following subtyping relation: T1 is a sub-type of T2 if a pointer to T1 can be passed to a function that expects a pointer to T2 without triggering a compilation error.


# 4 Kleisli Functions
________________________________________________________________________________

It is quite strange that Kleisli functions are itroduced in the book before, e.g., isomorphisms or other concepts generally introduced beforehand in other books.

In typed functional programming, the Kleisli category is used to model call-by-value functions with side-effects and computation.

> Note: This section contains suggestions for Challenge 2.7.1

> [[CH]](#CH), page 75:<br/>
> Every *monad* defines a new category, called the *Kleisli category*.

## 4-2 Writer in Haskell
Here is an example on a possible application of a Kleisli category used for logging, memoization, or tracing the execution of functions. A Kleisli category for this purpose is also called *the writer monad*. We start by defining a costume type, which can be wrapped around functions and write something to a log file,
```
type Writer a = (a, String)
```
Then we need some morphism to compose the `Writer` type with the functions we want to keep a log of, `f :: a -> Writer b`. We’ll declare the composition as a funny infix operator (infix is, `a + b`, and prefix is `(+) a b`), sometimes called the “fish”:
```
(<=<) :: (b -> Writer c) -> (a -> Writer b) -> (a -> Writer c)
```
Note, that I changed the type signature here to that given in the book, as operators are left-associative (meaning they are applied left to right). We can implement the above signature as,
```
m2 <=< m1 = \x ->
    let (y, s1) = m1 x
        (z, s2) = m2 y
    in (z, s2 ++ s1)
```
I don't understand the function above.
The Kleisli identity morphism is commonly called *return*,
```
return :: a -> Writer a
return x = (x, "")
```
Having defined the `Writer` we can wrap it around other functions, e.g., `toUpper` and `toWords` provided by Haskell,
```
upCase :: String -> Writer String
upCase s = (map toUpper s, "upCase ")

toWords :: String -> Writer [String]
toWords s = (words s, "toWords ")
```
The composition of the two functions is accomplished with the help of the fish
operator,
```
process :: String -> Writer [String]
process = toWords <=< upCase
```
We have accomplished our goal: The aggregation of the log is no longer the concern of the individual functions. They produce their own mes- sages, which are then, externally, concatenated into a larger log.


## 4-3 Kleisli Categories

For our limited purposes, a Kleisli category has, as objects, the types of the underlying programming language.

“embellishment” corresponds to the notion of an *endofunctor* in a category... something like endomaps but for categories instead of objects in categories (we learn in [Sections 7.1](#7-1-functors-in-programming) that functors are mappings between categories).


## 4-4 Challenges

- a) Construct the Kleisli category for partial functions (define composition and identity), meaning a function `Optional` that can be wrapped around another functions that is not defined for all possible values of its argument.

In order to solve this exercise, [[PC]](#PC) Chapter 5 on *monads* (and Section 2.3.4 on *type constructors*) provides some helpful comments.

> [[PC]](#PC), Chapter 5, page 125:
> "Starting with the category of types and functions, it’s possible to construct new categories that share the same objects (types), but redefine the morphisms and their composition."
>
> "A simple example is [that of partial functions]. These are computations that are not defined for all values of their arguments. We can model such computations using the `Maybe` data type".
> ```
> data Maybe a = Just a | Nothing
> ```
> "A partial computation from `a` to `b` can be implemented as [...] `f :: a -> Maybe b`. When the partial computation succeeds, this function wraps its output in `Just`, other-wise it returns `Nothing`."

Thus, what we are trying is to create a new category that we will call `Optional(Maybe)`, a *Kleisli category*, which relates to the function it wraps around through an *endofunctor*.

As any introduction to Category Theory tells us, a category consists of ([[CM]](#CM), page 21): objects, morphisms, identities, and composition, which we need to define.

First, let's with the easiest first and declare the identity morphism
```
identity :: a -> Maybe a
identity a = Just a
```
Secondly, we need to define a function that can compose two Kleisli morphisms, for which we use the 'fish' infix operator as as above (but in opposite direction). We define it's type signature to be:
```
(<=<) :: (b -> Maybe c) -> (a -> Maybe b) -> (a -> Maybe c)
```
Here is a way we could implement this: if the first function returns `Nothing`, don’t call the second function. Otherwise, call it with the contents of `Just`
```
g <=< f = \a -> case f a of
                   Nothing -> Nothing
                   Just b -> g b
```

Now that we have define the contents of our category, we need to proof that it also satisfies the *identity law* and *associativity law*.


- b) Implement the embellished function `safe_reciprocal` that returns a valid reciprocal of its argument, if it's different from zero.

```
safeDiv :: Float -> Float -> Maybe Float
safeDiv m n
        | n == 0    = Nothing
        | otherwise = Just (m / n)
```

- c) Compose the functions `safe_root` and `safe_reciprocal` to implement `safe_root_reciprocal` that calculates `sqrt(1/x)` whenever possible.

```
safeSqrt :: Float -> Maybe Float
safeSqrt x
       | x >= 0    = Just (sqrt x)
       | otherwise = Nothing
```


```
safeSqrtDiv :: Float -> Maybe Float
safeSqrtDiv = safeSqrt <=< safeDiv1
```


# 5 Products and Coproducts
________________________________________________________________________________


Before jumping into the chapter let's make clear that a *universal property/construction* are unique up to isomorphism ...

## 5-1 Initial Object & 5-2 Terminal Object

> [[CH]](#CH) Definition 1.3, page 13:
> An object $t \in \mathcal{C}$ is terminal if for all $a \in \mathcal{C}$ there is [a unique morphism $!: a \to t$]. Similarly, $i \in \mathcal{C}$ is the initial if there [a unique morphism $!: i \to a$] to all objects.</br>
> <img src="./imgs/definition_5_1_initial_terminal_objects.png" alt="Definition of the initial and terminal object in 'Categories and Haskell'" style="height:100px;"/>

Within the Haskell type system, $\mathbf{Hask}$, `Void` takes the place of the inital objects which maps to every other type through `absurd`, `absurd: Void -> a`, and unit `()` takes is the terminal object as everything can uniquly map onto it, `unit: a -> ()`. However, the terminal object does not need to be `()` but could be any singleton set.

Since this *unique* morphism exists *for all* objects in $\mathcal{C}$, we say that terminal objects have a *universal property*.

Many more notes on initial objects:
- [[SSC]](#SSC), Section 6.2.1, page 183
- [[PC]](#PC), Section 2.2.2, page 39
- [[CH]](#CH), Definition 1.3, page 13
and terminal objects:
- [[SSC]](#SSC), Section 3.5.1, page 108
- [[PC]](#PC), Section 2.2.1, page 37
- [[CH]](#CH), Definition 1.3, page 13
- [[CM]](#CM), Article IV.1, page 213
For an explaination of *uniqueness up to isomorphism* see:
- https://www.math3ma.com/blog/up-to-isomorphism
- https://en.wikipedia.org/wiki/Up_to


## 5-3 Duality

The duality w.r.t. categories describes the fact, that for any category $\mathcal{C}$ we can define the opposite category $\mathcal{C}^{\text{op}}$ just by reversing all it's morphisms $f: a \to b$ to $f^{\text{op}}: b \to a$ ([[CM]](#CM) denotes it as $f^{-1}$). It follows then that a terminal object is the initial object in the opposite category.

> This is related to *invertible morphisms*, for which you can find an indepth introduction in [[CM]](#CM) starting from Article II, page 40 (and continuing for a long time), which I find clearer than what is described in the next section on *isomorphisms*.

The table below lists some examples of duality. Most of them weren't introduced yet, so don't worry if you don't know what they mean. However, for *monomorphism* and *epimorphism* are introduced early on in other books so it might be good to mention that you find more information on them in [CM](#CM) Article II page 52f.

| Element of $\mathcal{C}$         | Element of $\mathcal{C}^{\text{op}}$ |
| -------------------------------- | ------------------------------------ |
| identity morphism; $\text{id}_A$ | identity morphism; $\text{id}_A$     |
| initial object                   | terminal object                      |
| monomorphism                     | epimorphism                          |
| product; $x \times y$            | coproduct; $x + y$                   |
| monad                            | comonad                              |
| limits                           | colimits                             |
| cones                            | cocones                              |
Table 5-3-1: Some examples of duality.

Note that monoidal categories, $\mathcal{C}(*)$, are equal to their opposite category, $\mathcal{C}^{\text{op}}$, as there is only one homset, $\text{Hom}\mathcal{C}(*,*)$,  which is the identity morphism, $\text{id}_* = \text{id}^{\text{op}}_*$.

## 5-4 Isomorphisms

> [[CM]](#CM), Section 4.2, page 61:</br>
> "If $f: A \to B$, an *inverse* for $f$ is a [morphism] $g: B \to A$ satisfying both</br>
> $g \circ f = 1_{A}$, and $f \circ g = 1_{B}$</br>
> If $f$ has an inverse, we say $f$ is an isomorphism, or invertible [morphism]."


## 5-5 Products

> [[PC]](#PC), Definition 2.19, page 40:</br>
> Let $x$ and $y$ be objects in a category $\mathcal{C}$. A *product* of $x$ and $y$ consists of three things:
> - an object, denoted as $x \times y$,
> - a morphism $\pi_1: x \times y \to x$, and
> - another morphism $\pi_2: x \times y \to y$,
>
> with the following *universal property*: For any other such three things, i.e. for any object $a$ and morphisms $f: a \to x$ and $g: a \to y$, there is a unique morphism $h: a \to x \times y$ such that the following diagram commutes:
>
> <img src="./imgs/definition_5_5_products.png" alt="Definition of products from 'Programming with Categories'" style="height:150px;"/>
> Figure 5.5.1
>
> Often we just refer to $x \times y$ as the product of $x$ and $y$. We call the morphisms $\pi_1$ and $\pi_2$ *projection maps* and *h* is frequently denoted as $h = \langle f, g \rangle$.
>
> (This definition is basically the same as [[SSC]](#SSC), Definition 3.71, page 110)

Note, that in the definition above the universal property is shown as a dashed line, which is quite common in diagramatic notations (some also use dotted lines).

In terms of Haskell, the cartesian product, $x \times y$, is a tuple `(x,y)`, and the two morphisms $\pi_1$ and $\pi_2$ are the function `fst (x,y)` and `snd (x,y)` which are both part of Prelude.

The important lesson is, that we can construct cartesian products of some set $A$, simply by focusing on the product elements individually by defining a pair of functions, $f: a \to x$ and $g: a \to y$.


Note, that the triangles $\pi_1 \circ h = f$ and $\pi_2 \circ h = g$ are both *choice problems* as introduced in [[CM]](#CM) Article 2.2, page 45.

Many more notes in:
- [[PC]](#PC), Section 2.2.3, page 40
- [[SSC]](#SSC), Section 3.5.1, page 110

## 5-6 Coproduct

> [[PC]](#PC), Definition 2.31, page 43:</br>
> Let $x$ and $y$ be objects in a category $\mathcal{C}$. A *coproduct* of $x$ and $y$ is an object, denoted as $x+y$, together with two morphisms $i_1: x \to x+y$ and $i_2: y \to x+y$, such that for any object $a$ and morphisms $f: x \to a$ and $g: y \to a$, there is a unique morphism $h: x+y \to a$ such that the following diagram commutes:
>
> <img src="./imgs/definition_5_6_coproducts.png" alt="Definition of coproducts from 'Programming with Categories'" style="height:150px;"/>
> Figure 5.6.1
>
> We call the morphisms $i_1$ and $i_2$ *inclusion maps*. We will frequently denote $h$ by $h=[f,g]$, and call it the *copairing* of $f$ and $g$.
>
> (This definition is basically the same as [[SSC]](#SSC), Definition 6.11, page 185)

The inverse product are injective morphisms
```
h :: a -> c
l :: b -> c
```

Another example then the on given in the book is found in [[RWH]](#RWH) Chapter 3, page 55. Here the data type `Customer` is the *coproduct* of objects/types `customerID` and `customerName`.
```
data Customer = Customer {
    customerID :: Int,
    customerName :: String,
}
```
Thus, the injection `h: customerID -> Customer` would be written as `costumer1 = Customer {customerID=1234, customerName=Adam}`. The product, or surjective morphism, through which we can access the separate parts is `customerID costumer1`.

In Haskell we can implement coproducts using the type constructor `|` as
```
data Coproduct x y = Incl1 x | Incl2 y
```
however, in Haskell it is more common to write coproducts as
```
data Either x y = Left x | Right y
```
Thus, `Either` is the object $x+y$ in Figure 5.6.1 and the two morphisms $i_{1,2}$ from the input objects $x$ and $y$ are `Left :: a -> Either a b` and `Right :: b -> Either a b`.


In the category of sets, the coproduct is the *disjoint union* of two sets. An element of the disjoint union of the two sets `a` and `b` is either an element of `a` or an element of `b`. If the two sets overlap, the disjoint union contains two copies of the common part.

The two injections can either be implemented as *constructors* or as *functions*.

I also notice that the triangles $h \circ i_1 = f$ and $h \circ i_2 = g$ are Both *determination problems* as introduced in [[CM]](#CM) Article 2.2, page 45.

Many more notes in:
- [[PC]](#PC), Section 2.2.4, page 43
- [[SSC]](#SSC), Section 6.6.2, page 185
- [[CM]](#CM), Article IV.5, page 222

## 5-7 Asymmetry

We’ll see later that product behaves like multiplication, with the terminal object playing the role of one; whereas coproduct behaves more like the sum, with the initial object playing the role of zero.

In the category of sets, an isomorphism is the same as a bijection.

## Summary of Universal Constructions

- Isomorphism
- Initial and Terminal object
- Products
- Coproducts

Universal properties are typically indicated through dashed lines in diagrams.

## 5-8 Challenges

**1. Show that the terminal object is unique up to unique isomorphism.**</br>
This challenge asks us to proof the proposition known as the *uniqueness of the terminal object*

> [[CM]](#CM), Article IV.1, page 213</br>
> Proposition (Uniqueness of the Terminal Object):</br>
> If $S_1$, $S_2$ are both terminal objects in the category $\mathcal{C}$, then there is exactly one $\mathcal{C}$-map $S_1 \to S_2$, and that map is a $\mathcal{C}$-isomorphism.
>

Proof: By definition, there is for each object in $\mathcal{C}$ exactly one morphism to the terminal object. Thus if we claim that $S_1$ and $S_2$ are both terminal objects of $\mathcal{C}$, then there must be exactly one morphism for $f: S_1 \to S_2$ and $g: S_2 \to S_1$.

**This is wrong, Correct:** By definition, the only morphism that has the terminal $S$ object as the domain is it's own isomorphism $1_{S}$.

This mean must must mean that $f \circ g = 1_{S_1}$ and $g \circ f = 1_{S_2}$ are the inverse of each other. Thus, the *uniqueness of the terminal object* is also related to the *uniqueness of inverses*.


**2. What is a product of two objects in a poset?</br>
Hint: Use the universal construction.**</br>
Thus our two objects $x$ and $y$ are in the *partial order* category, which uses $\leq$ as it's arrows. Drawing the product diagram helps to find the answer,

<img src="./imgs/challenge_5_8_2.png" alt="Product diagram for Challenge 5.8.2" style="height:150px;"/>

it is useful to know that divisibility relation defines partial ordering on positive integers

Thus, at the domains are objects smaller or equal to the codomain. Meaning that the product in a poset is a greatest lower bound.

A short answer is given in [[PC]](#PC), Section 2.2, Example 2.20, page 41.
[[CH]](#CH) page 28 and [[CH]](#CH) Example 3.4 has the better answer

Look also at  [[SSC]](#SSC), Example 3.72, page 110 on products in **Set** to help make sense of it.


**3. What is a coproduct of two objects in a poset?**</br>
Reversing our reasoning to the previous question we conclude, that the coproduct is the smallest upper bound, the smallest positive integer that is a multiple of both a and b.


**4. Implement the equivalent of Haskell Either as a generic type in your favorite language (other than Haskell).**</br>
Skip.

**5. Show that `Either` is a “better” coproduct than `Int` equipped with two injections:**</br>
```
int i(int n) { return n; }
int j(bool b) { return b ? 0: 1; }
```
**Hint: Define a function `m :: Int -> (Int, Bool)` that factorizes i and j.**

This is the inverse of the example given on page 62.
`Either` is a "better" coproduct, as it is the initial object, and thus we can map it onto `Int` but not vice versa.

**6. Continuing the previous problem: How would you argue that int with the two injections i and j cannot be “better” than Either?**</br>

**7. Still continuing: What about these injections?**</br>

**8. Come up with an inferior candidate for a coproduct of int and bool that cannot be better than Either because it allows multiple acceptable morphisms from it to Either.**</br>


# 6 Simple Algebraic Data Types
________________________________________________________________________________
This section develops our understanding of *products* and *coproducts* (introduced in Sections 5.5 and 5.6) further in the context of data types.

## 6-1 Product Types

## 6-2 Records

## 6-3 Sum Types

To model finite coproducts, one uses *sum types* (the concepts of sum types, coproducts, and tagged union have their origin from different communities but their meaning are tightly related).

In Section 5.3 introduced the fact of categorical duality, meaning that given a category $\mathcal{C}$ we can invert all morphisms to obtain its the opposite category $\mathcal{C}^{\text{op}}$. Have learned about products and coproducts, we realy that they are each others dual. Hence, we can also understand sum types as being the dual of product types.

In Haskell, sum types $x + y$ are created using the constructor `x | y` as shown in Section 5.6.

It turns out that 𝐒𝐞𝐭 is also a (symmetric) monoidal category with respect to coproduct. The role of the binary operation is played by the disjoint sum, and the role of the unit element is played by the initial object. In terms of types, we have Either as the monoidal operator and Void, the uninhabited type, as its neutral element. You can think of Either as plus, and Void as zero.

> [[RWH]](#RWH), page 44:<br/>
> A famous two-element set is the familiar `Bool`, is the simplest common example of a category of *algebraic data type*, meaning it can have more than one value constructor.
> ```
> data Bool = True | False
> ```

Functions to Bool, `f: a->Bool`, are called *predicates*.

## 6-4 Algebra of Types

We have the sum types with Void as the neutral element, and the product types with the unit type, (), as the neutral element.

Mathematicians have a name for two such intertwined monoids: it’s called a semiring. It’s not a full ring, because we can’t define subtraction of types.

| Numbers      | Types                           |
| ------------ | ------------------------------- |
| $0$          | `Void`                          |
| $1$          | `()`                            |
| $x+y$        | `Either x y = Left x | Right y` |
| $x \times y$ | `(a,b)` or `Pair a b`           |
| $2 = 1 + 1$  | `data Bool = True | False`      |
| $1 + a$      | `data Maybe = Nothing | Just a` |
Table 6-4-1

| Logic    | Types                           |
| -------- | ------------------------------- |
| false    | `Void`                          |
| true     | `()`                            |
| x $||$ y | `Either x y = Left x | Right y` |
| x && y   | `(a,b)` or `Pair a b`           |
Table 6-4-2

## 6-5 Challenges

**1. Show the isomorphism between Maybe a and Either () a.**

Both `Either` and the Kleisli category `Maybe` are sum types,
```
data Either () a = Left () | Right a
```
and
```
data Maybe a = Just a | Nothing
```
Using the definition of isomorphisms from [[CM]](#CM) page 40, we need to show that the two mappings `f: Maybe a -> Either () a` and `g: Either () a -> Maybe a` are the inverse of each other, meaning `f . g = maybeID` and `g . f = eitherID`. The to mapping `f` and `g` are provided in Haskell in the `Data.Either.Combinators` module and are called `maybeToLeft`, `leftToMaybe`, `maybeToRight` and `rightToMaybe`.

One can implement `f` as
```
maybeToEither :: Maybe a -> Either () a
maybeToEither Nothing  = Left ()
maybeToEither (Just a) = Right a
```
and `g` as
```
eitherToMaybe :: Either () a -> Maybe a
eitherToMaybe (Left ()) = Nothing
eitherToMaybe (Right a) = Just a
```


**2.**
Skip

**3.**
Skip

**4.**
Skip

**5. Show that $a + a = 2 \times a$ holds for types (up to isomorphism). Remember that $2$ corresponds to `Bool`, according to our translation table.**

From [Table 6-4-1](table-6-4-2) we can read that $a+a$ expressed in types is `Either a a`. And the relation $2=1+1$ is given by `Bool`, of which we need to multiply both sides with `a`. In Section 5.5 we learned that in the categorical context, multiplication is a metaphor for taking the set product. Thus we need to show that there are morphisms $\pi_1$ and $\pi_2$ from the set product `[(True, a), (False, a)]` to `Either a a` and `Bool`.


We can write $\pi_1$ as
```
eitherToProd :: Either a a -> (Bool, a)
eitherToProd (Left a)  = (False, a)
eitherToProd (Right a) = (True, a)
```
and it's inverse as
```
prodToEither :: (Bool, a) -> Either a a
prodToEither (False, a) = Left a
prodToEither (True, a)  = Right a
```

# 7 Functors
________________________________________________________________________________

A functor is a mapping between categories. While functions act on elements in objects, *functors from one category to another are structure-preserving maps of objects and morphisms*.

Since functors are morphisms in $\mathbf{Cat}$, the category of categories.
(while morphisms -- and functions in particular -- apply to functors as well... what exactly is the difference between morphisms and functions?)

Functors are a very powerful concept. For functional programming specifically they are what allows you to define container, type constructors, and translations between data types. But more general, they allow us to translate between different branches of mathematics.

Many more notes in:
- [[PC]](#PC), Section 3.2, page 66
- [[CH]](#CH), Section 1.2, page 11

## 7-1 Functors in Programming

From now on, when I speak of functors in the context of programming, I will almost always mean endofunctors.

- `Maybe` functor
- `List` functor
- `Reader` functor

### 7-1-4 Typeclasses

We’ll be using type classes to help model structures from category theory, including functors, profunctors, monads and many more. In doing so, we'll follow the Haskell convention of simply defining the types of the key pieces of data. The laws these data must obey are not specified in code, but often written in the documentation. This guides usage of the type class. The more closely these structures obey these laws, the more reliable categorical insights are for reasoning about them, and so the more useful category theory is for writing code.

Here’s the definition of the Functor class
```
class Functor f where
    fmap :: (a -> b) -> f a -> f b
```
It stipulates that `f` is a `Functor` if there exists a function `fmap` with the specified type signature. The lowercase `f` is a type variable, similar to type variables `a` and `b`, which Haskell's compiler recognises as a type constructor from it's context.

Declaring the `Maybe` instance of `Functor`
```
instance Functor Maybe where
    fmap _ Nothing = Nothing
    fmap f (Just x) = Just (f x)
```
and the `List` instance of the same functor
```
instance Functor List where
    fmap _ Nil = Nil
    fmap f (Cons x t) = Cons (f x) (fmap f t)
```
(however, I am not really sure wether it is useful to include the type constructor signature `Cons` as it is almost never used... or am I wrong?)

An example of an endofunctor $\Delta_c$, the 'blackhole' functor that maps every other category to a singleton is
```
class Functor f where
    fmap :: (a -> b) -> Const c a -> Const c b

instance Functor (Const c) where
    fmap _ (Const v) = Const v
```

## 7-3 Functor Composition

The result of `maybeTail` is of a type that’s a composition of two functors, `Maybe` and `[]`, acting on a, as
```
maybeTail :: [a] -> Maybe [a]
maybeTail []     = Nothing
maybeTail (x:xs) = Just xs
```

## 7-4 Challenges

**1. Can we turn the `Maybe` type constructor into a functor by defining: `fmap _ _ = Nothing` which ignores both of its arguments?</br>
Hint: Check the functor laws.**

So, instead of using `fmap` as defined on page 94, we tweak it a bit. As explained, we can use equational reasoning to proof the functor laws (identity and composition).

Let's start with the shorter one first, proving the identity law for both types in `Maybe`:
```
fmap id Nothing = Nothing      -- using definition of fmap
                = id Nothing   -- using definition of id

fmap id (Just x) = Nothing     -- using definition of fmap
                 = id Nothing  -- using definition of id
```
We see that for the 'Just x' is being mapped onto Nothing instead of to itself.


**2. Prove functor laws for the reader functor.</br>
Hint: it’s really simple.**

Remember the type signature of the reader functor is
```
class Functor f where
    fmap :: (a -> b) -> (r -> a) -> (r -> b)

instance Functor ((->) r) where
    fmap f g = f . g
```

Let's start again to prove the identity law, `fmap id = id`,
```
fmap id a = id . a
          = a
          = id a
```
and the composition law, `fmap (g . f) = fmap g . fmap f`,
```
fmap (g . f) a = (g . f) . a          -- using definition of fmap
               = g . (f . a)          -- using associative law
               = g . (fmap f a)       -- using definition of fmap
               = fmap g (fmap f a)    -- using definition of fmap
               = (fmap g . fmap f) a  -- using definition of composition
```


**3.**
Skip

**4. Prove the functor laws for the list functor. Assume that the laws are true for the tail part of the list you're applying it to (in other words, use induction).**

Remember the `List` category,
```
data List a = Nil | Cons a (List a)
```
and the `List Functor`  mentioned above
```
instance Functor List where
    fmap _ Nil = Nil
    fmap f (Cons x t) = Cons (f x) (fmap f t)
```

Again, let's start with the identities for both parts of of the `List` sum type

```
fmap id Nil = Nil
            = id Nil

fmap id (Cons a as) = Cons (id a) (fmap id as)
                    = Cons (id a) as
                    = Cons a as
                    = id (Cons a as)
```

Now that we have shown that the identity laws are preserved we move on to the compositin Laws

```
fmap (g . f) Nil = Nil
                 = fmap g Nil
                 = fmap g (fmap f Nil)
                 = (fmap g . fmap f) Nil

fmap (g . f) (Cons a as) = Cons ((g . f) a) (fmap (g . f) as)     -- def of fmap
                         = Cons ((g . f) a) (fmap g (fmap f as))  -- induction
                         = Cons (g (f a)) (fmap g (fmap f as))    -- def of comp
                         = fmap g (Cons (f a) (fmap f as))        -- def of fmap
                         = fmap g (fmap f (Cons a as))            -- def of fmap
                         = (fmap g . fmap f) (Cons a as)          -- def of comp
```

# 8 Functoriality
________________________________________________________________________________

## 8-1 Bifunctors

Just as one can take the *Cartesian product* $\times$ for every pair of two objects within one category $\mathcal{A}$, we can also take a product of two categories $F: \mathcal{A} \times \mathcal{B} \to \mathcal{C}$, where $F$ is called a *bifunctor* as it has two arguments (instead of one as a functor has). The produc of categories is an important application of bifunctors, but not the only one...


> [[CH]](#CH), Definition 3.7, page 34</br>
> Given two categories $\mathcal{A}$, $\mathcal{B}$ their product category $\mathcal{A} \times \mathcal{B}$ is given by:
> - The objects $a \in \mathcal{A}$ and $b \in \mathcal{B}$ the bifunctor $F$ produces product-pairs $(a,b)$.
> - The arrows $g: a \to a'$ in $\mathcal{A}$ and the arrows $h: b \to b'$ in $\mathcal{B}$ combine to pairs as $(g,h): (a,b) \to (a',b')$.
> - The identity arrwos for $(a,b)$ are the pair $(\text{id}_a, \text{id}_b)$.
> - Composition of arrows happens per component, i.e. when $g,g' \in \mathcal{A}$ and $h,h' \in \mathcal{B}$:</br>
> $(g,h) \circ (g',h') \equiv (g \circ g', h \circ h')$

In Haskell the `Data.Bifunctor` library contains the following type class implementation:
```
class Bifunctor f where
    bimap :: (a -> a') -> (b -> b') -> (f a b -> f a' b')
    bimap g h = first g . second h
    first :: (a -> a') -> f a b -> f a' b
    first g = bimap g id
    second :: (b -> b') -> f a b -> f a b'
    second = bimap id
```
with the bifunctor `f` being type constructor that takes two arguments. Notice that this is a circular definition, which means that a bifunctor can be implemented in Haskell by either:
- providing the bimap definition,
- the first and second functions (but sometimes this doesn’t work because `first g . second h` and `first h . second g` may not commute), or
- implement everything: `bimap`, `first`, and `second`

Thus, when we have a morphisms in $\mathcal{A}$ as $f: a \to a'$ and a different morphism in $\mathcal{B}$ as $g: b \to b'$ then the Cartesian product needs to be implements in Haskell as an instance of the `Bifunctor` class as
```
instance Bifunctor (,) where
    bimap f g (a, b) = (f a, g b)
```
This is the instance of pair production, the simplest product type. This instance of the `Bifunctor` makes pairs of types, `(,) a b = (a,b)`.

Here, I have given different labels to the three categories involved in the bifunctor mapping. However, as Bartosz states on page 92, we want to stay in the realm where objects are Haskell types and therefore consider only endofunctors. This means that we talk about $\mathcal{C} \times \mathcal{C} \to \mathcal{C}$, does this make sense?

Let’s define a bifunctor in Haskell. In this case all three categories are the same: the category of Haskell types, $\mathbf{Hask}$.

Many more notes in:
- [[PC]](#PC), Section 3.4.3, page 83
- [[CH]](#CH), Section 3.3, page 34

## 8-2 Product and Coproduct Bifunctors

Above we have introduced the bifunctor through it's application to form products of categories. But we can of course by duality also use bifunctors to create coproducts of categories.

In In Haskell, this is exemplified by the `Either` type constructor being an instance of `Bifunctor`:
```
instance Bifunctor Either where
    -- this instance gives bimap the type signature:
    -- bimap :: (a -> a') -> (b -> b') -> (Either a b -> Either a' b')
    bimap f _ (Left a) = Left (f a)
    bimap _ g (Right b) = Right (g b)
```


## 8-3 Functorial Algebraic Data Types

We can implement a bifactor also in another way in Haskell and treat it as a composition `BiComp` of two functor `fu` and `gu`.
```
newtype BiComp bf fu gu a b = BiComp (bf (fu a) (gu b))
```

```
instance (Bifunctor bf, Functor fu, Functor gu) =>
    Bifunctor (BiComp bf fu gu) where
        bimap :: (fu a -> fu a') -> (gu b -> gu b') -> bf (fu a) (gu b) -> bf (fu a') (gu b')
        bimap f1 f2 (BiComp x) = BiComp ((bimap (fmap f1) (fmap f2)) x)
```

Placing
```
{-# LANGUAGE DeriveFunctor #-}
```
at the top of your .hs file will compile functors with the additionally
deriving Functor to your data structure
```
data Maybe a = Nothing | Just a deriving Functor
```

## 8-5 The `Writer` Functor
Advancing the `Write` introduced in [Section 4.2](#4-2-writer-in-haskell)


## 8-6 Covariant and Contravariant Functors

## 8-7 Profunctors

## 8-8 The Hom-Functor

As you can see, the hom-functor is a special case of a profunctor.


To summaries
> [[PC]](#PC), Definition 3.2, page 67</br>
> Two categories $\mathcal{C}$ and $\mathcal{D}$ can be subjected to the following incomplete list of functors</br>
> - A *identity functor* $\text{id}_{\mathcal{C}}: \mathcal{C} \to \mathcal{C}$
> - A *constant/blackhole functor* $\Delta_{d}: \mathcal{C} \to \mathcal{D}$ for $d \in \mathcal{D}$
> - A *contravariant functor* $\mathcal{C} \to \mathcal{D}$ is a functor $\mathcal{C}^{\text{op}} \to \mathcal{D}$.
> - An *endofunctor* on $\mathcal{C}$ is a functor $F: \mathcal{C} \to \mathcal{C}$
> - A *bifunctor* on $\mathcal{C}$ is a functor $\mathcal{C} \times \mathcal{C} \to \mathcal{D}$
> - A *profunctor* on $\mathcal{C}$ is a functor $\mathcal{C} \times \mathcal{C}^{\text{op}} \to \mathbf{Set}$.


## 8.9 Challenges


**1. Show that the data type `data Pair a b = Pair a b` is a bifunctor.</br>
For additional credit implement all three methods of `Bifunctor` and use equational reasoning to show that these definitions are compatible with the default implementations whenever they can be applied.**

As Bartosz mentioned earlier: "you may even view the built-in `Pair` type as a variation on this kind of declaration, where the name `Pair` is replaced with the binary operator `(,)`." An example implementation of `(,)` was given on page 117.

To implement this bifunctor we have three options:
- i) implementing only `bimap` and accepting the defaults for `first` and `second`
    ```
    instance Bifunctor Pair where
        bimap g h (Pair a b) = Pair (g a) (h b)
    ```
    * Identity law
    * Associative law
- ii) implementing `first` and `second` and accepting the default of `bimap`
    ```
    instance Bifunctor Pair where
        first g (Pair a b) = Pais (g a) b
        second h (Pair a b) = Pair a (h b)
    ```
    * Identity law
    * Associative law
- iii) implementing all three: `bimap`, `first`, and `second`
    ```
    instance Bifunctor Pair where
        bimap g h (Pair a b) = Pair (g a) (h b)
        first g (Pair a b) = Pais (g a) b
        second h (Pair a b) = Pair a (h b)
    ```
    * Identity laws
        ```
        bimap ida idb (Pair a b) = Pair (ida a) (idb b)
                                 = Pair a b

        first ida (Pair a b) = Pair (ida a) b
                             = Pair a b

        second idb (Pair a b) = Pair a (idb b)
                              = Pair a b
        ```
    * Composition laws
        ```
        bimap (g . h) (g' . h') (Pair a b) = Pair ((g . g') a) ((h . h') b)
                                           = Pair (g (g' a)) (h (h' b))
                                           = bimap g h (Pair (g' a) (h' b))
                                           = bimap g h (bmap g' h' (Pair a b)
                                           = (bimap g h) . (bimap g' h') (Pair a b)

        first (g . g') (Pair a b) = Pais ((g . g') a) b
                                  = Pair (g (g' a)) b
                                  = first g (Pair (g' a) b)
                                  = first g (first g' (Pair a b))
                                  = (first g) . (first g') (Pair a b)

        second (h . h') (Pair a b) = Pais a ((h . h') b)
                                   = Pair a (h (h' b))
                                   = second h (Pair a (h' b))
                                   = second h (second h' (Pair a b))
                                   = (second h) . (second h') (Pair a b)
        ```

We could have also, as Bartosz mentioned, considered the `first` and `second` case seperatly, but he also warned that "in general, separate functoriality is not enough to prove joint functoriality."

**2. Show the isomorphism between the standard definition of `Maybe` and this desugaring:</br>
`type Maybe' a = Either (Const () a) (Identity a)`.</br>
Hint: Define two mappings between the two implementations.</br>
For additional credit, show that they are the inverse of each other using equational reasoning.**

This exercise is an extension of Exercise 2 in [Section 6-5](#6-5-challenges).

Even though `Const` is a bifunctor, we implement it as a functor since it's always partially applied
```
data Const c x = Const c

fmap :: (a -> b) -> Const c a -> Const c b
fmap _ (Const v) = Const v
```

also remember the other types needed for this exercise,
```
data Identity x = Identity x
data Either x y = Left x | Right y
data Maybe x = Just x | Nothing
```

Thus we can implement `maybeToEither: Maybe -> Maybe'` and `eitherToMaybe: Maybe' -> Maybe` as
```
maybeToEither :: Maybe a -> Either (Const () a) (Identity a)
maybeToEither Nothing  = Left (Const ())
maybeToEither (Just x) = Right (Identity x)

eitherToMaybe :: Either () a -> Maybe a
eitherToMaybe (Left (Const ())) = Nothing
eitherToMaybe (Right (Identity x)) = Just x
```

To prove the isomorphism we have to show that `maybeToEither . eitherToMaybe = maybeID` and `eitherToMaybe . maybeToEither = eitherID`, meaning we should obtain what we put in.
```
(maybeToEither . eitherToMaybe) (Left (Const ())) = maybeToEither Nothing
                                                  = Left (Const ())

(maybeToEither . eitherToMaybe) (Right y) = (maybeToEither . eitherToMaybe) (Right (Identity y))
                                          = maybeToEither (Just y)
                                          = Right (Identity y)
                                          = Right y

(eitherToMaybe . maybeToEither) (Just x) = eitherToMaybe (Right (Identity x))
                                         = Just x

(eitherToMaybe . maybeToEither) Nothing = eitherToMaybe (Left (Const ()))
                                        = Nothing
```


**3. Let’s try another data structure. I call it a `PreList` because it’s a precursor to a `List`. It replaces recursion with a type parameter `b`.</br>
`data PreList a b = Nil | Cons a b`</br>
You could recover our earlier definition of a `List` by recursively applying `PreList` to itself (we’ll see how it’s done when we talk about fixed points).</br>
Show that `PreList` is a bifunctor.**


First we must implement `PreList` as an instance of `Bifunctor`, which I do through `bimap` and accept the defaults of `first` and `second`,
```
instance Bifunctor PreList where
    bimap g h Nil        = Nil
    bimap g h (Cons a b) = Cons (g a) (h b)
```
To show that this `Bifunctor` instance of `PreList` behaves like a bifunctor, we need to show it fulfils the bifunctor identity and composition laws.

- Identity laws:
    ```
    bimap ida idb Nil = Nil

    bimap ida idb (Cons a b) = Cons (ida a) (idb b)
                             = Cons a b
    ```
- Composition laws:
    ```
    bimap (g . h) (g' . h') Nil = Nil
                                = bimap g h (bimap g' h' Nil)
                                = (bimap g h) . (bimap g' h') Nil

    bimap (g . h) (g' . h') (Cons a b) = Cons ((g . g') a) ((h . h') b)
                                       = Cons (g (g' a)) (h (h' b))
                                       = bimap g h (Cons (g' a) (h' b))
                                       = bimap g h (bimap g' h' (Cons a b))
                                       = (bimap g h) . (bimap g' h') (Cons a b)
    ```


**4. Show that the following data types define bifunctors in a and b:</br>
`data K2 c a b = K2 c`</br>
`data Fst a b = Fst a`</br>
`data Snd a b = Snd b`</br>
For additional credit, check your solutions against Conor McBride’s paper '[Clowns to the Left of me, Jokers to the Right](http://strictlypositive.org/CJ.pdf)'.**

**5.**
Skip

**6. Should `std::map` be considered a bifunctor or a profunctor in the two template arguments `Key` and `T`? How would you redesign this data type to make it so?**


# 9 Function Types
________________________________________________________________________________

# 9-1 Universal Construction
(is it sometimes also called *universal mapping property* as in [[CH]](#CH) page 28?)

Many more notes on initial objects:
- [[PC]](#PC), Chapter 2, page 35

# 9-2 Currying
# 9-3 Exponentials

Haskell types are objects and Haskell functions are morphisms in the set of all Haskell types, which is a subset of the category of sets, $\mathbf{Set}$. We’ve also seen, however, higher order functions, such as the composition operator, `.`. Higher order functions can take a function as an input, or give a function as an output. How do we explain these? What are the domain and codomain types of a higher order function?

To save the situation, we need an object in our category that represents all morphisms from one given object to another. This works perfectly well in the category $\mathbf{Set}$ of sets. Functions between two sets, $A$ and $B$, form a set, the homset $\mathbf{Set}(A,B)$, and that set is an object in $\mathbf{Set}$ as well (for categories different from $\mathbf{Set}$ this is not true). This object is denoted $B^A$ and is called the *exponential*. This would generally be called the function type in a programming context, and the exponential type in category theory context; see [[PC]](#PC) Exercise 1.14 and [[CM]](#CM) page ??? for why.



# 9-4 Cartesian Closed Categories

> *Cartesian closed category* (CCC): A category $\mathcal{C}$ is called *cartesian closed category*, if the following conditions are satisfied:
> - It has a terminal object $1$.
> - For each pair $a,b \in \mathcal{C}$ there exists a product $a \times b$
> - For each pair $a,b \in \mathcal{C}$ there exists an object $[a,b]$, also written as $b^a$, called the *exponential*.

Now that we know what CCC's are we can make our definition of *exponentials* more precies

> [[PC]](#PC) Definition 2.57, page 58:</br>
> Let $A,B \in \mathcal{C}$ be objects in a cartesian category. An object ...

# 9-5


### References
<a id="CM">[CM]</a>
'Conceptual Mathematics' by F. William Lawvere, Stephen H. Schanuel

<a id="SSC">[SSC]</a>
'An Invitation to Applied Category Theory: Seven Sketches in Compositionality' by Brendan Fong and David I. Spivak

<a id="RWH">[RWH]</a>
'Real World Haskell' by Bryan O'Sullivan, Don Stewart, John Goerzen

<a id="PC">[PC]</a>
'Programming with Categories' by Brendan Fong, Bartosz Milewski, David I. Spivak

<a id="CH">[CH]</a>
https://github.com/jwbuurlage/category-theory-programmers by Jan-Willem Buurlage
