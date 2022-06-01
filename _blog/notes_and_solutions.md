These notes serve the following purpose. Firstly, they list and summaries
important concepts in Category Theory and how they can be expressed in Haskell.
Secondly, the book content is compared to other books I am reading in parallel.

In composing this text I will follow these rules:
- Notes: are for references to other books and papers
- Bold font: is for definitions and questions of challenges
- Italic: If things that still need to be defined appear in text

# 1. Category: The Essence of Composition
________________________________________________________________________________

## 1.1 Arrows as Functions
Here’s the declaration of a function from A to B:
```
f :: A -> B
```
and B to C:
```
g :: B -> C
```
and their composition:
```
g ◦ f :: A -> C
```


## 1.2 Properties of Composition
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

## 1.4 Challenges
**1. Implement, as best as you can, the identity function in your favorite
language.**

**1. Implement, as best as you can, the identity function in your favorite
language.**
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
**2. Implement the composition function. It takes two functions as arguments and returns a function that is their composition.**

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

**3. Write a program that tries to test that your composition function respects identity.**

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

**4. Is the world-wide web a category in any sense? Are links morphisms?**

The world wide web is indeed a category if we consider the objects to be
webpages and for there to be an “arrow” between A and B if there is a way to
get to B from A by clicking on links.

**5. Is Facebook a category, with people as objects and friendships as morphisms?**

No, since friendships are not composable.

**6. When is a directed graph a category?**

If the digraph observes the identity and associativity law by containing self-loops and if `a -> b -> c` then it must follow that `a -> c`.

# 2. Types and Functions
________________________________________________________________________________

## 2.6 Examples of Types
In programming language, types are sets (often bounded by their bit range)!

**Empty set**
: In Haskell written as,
```
absurd :: Void -> a
```
The type Void represents falsity, and the type of the function absurd corresponds to the statement that from falsity follows anything.

> [[SSC]](#SSC), page 7:<br/>
> The empty set $\varnothing := \{\}$ has no elements and is a subset of every other set.


**Singleton set**
: A type that has only one possible value (for example 44). It takes any input through pattern matching with the unit symbol `()`, and returns its values as
```
f44 :: () -> Integer
f44 () = 44
```

> [[CM]](#CM), page 19:<br/>
> A singleton is also called a *point* or *one-element set*, since when it appears in composition, it focuses the preceding mappings to a single point projection.


Mathematically, a function from a set A to a singleton set maps every element of
A to the single element of that singleton set. For every A there is exactly one
such function. Here’s a polymorphic function:
```
unit :: a -> ()
unit _ = ()
```

> [[RWH]](#RWH), page 44:<br/>
> A famous two-element set is the familiar *Bool*, is the simplest common example of a category of *algebraic data type*, meaning it can have more than one value constructor.
> ```
> data Bool = True | False
> ```

Functions to Bool, `f: a->Bool`, are called *predicates*.

## 2.7 Challenges

**1. Define a higher-order function (or a function object) memoize in your favorite
language. This function takes a pure function f as an argument and returns a
function that behaves almost exactly like f, except that it only calls the
original function once for every argument, stores the result internally, and
subsequently returns this stored result every time it’s called with the same
argument. You can tell the memoized function from the original by watching
its performance. For instance, try to memoize a function that takes a long
time to evaluate. You’ll have to wait for the result the first time you call
it, but on subsequent calls, with the same argument, you should get the result
immediately.**

Searching the web provided my plenty examples on how to write a Memoization
function wrapper by hand for specific data types, specifically for Int for
Fibonacci sequence, but I haven't figured out how to write a short
polymorphic wrapper. Digging into it reveals much I have no idea about yet,
such as applying the Yoneda Lemma:
http://conal.net/blog/posts/memoizing-polymorphic-functions-via-unmemoization
Conal implemented this approach in the MemoTrie module, loaded as Data.MemoTrie

More reasons for headaches in Haskell are explained at the beginning of
Chapter 4. on Kleisli Categories page 38

**2. Try to memoize a function from your standard library that you normally use to
produce random numbers. Does it work?**

No, if it would work it would be a random number generator.

**3. Most random number generators can be initialized with a seed. Implement a
function that takes a seed, calls the random number generator with that seed,
and returns the result. Memoize that function. Does it work?**

**4. Which of these C++ functions are pure? Try to memoize them and observe what
happens when you call them multiple times: memoized and not.**

**5. How many different functions are there from Bool to Bool? Can you implement
them all?**

There are $2^2$ possible *endomaps* f: Bool -> Bool (for detailed explanation see [[CM]](#CM), page 34).
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

**6. Draw a picture of a category whose only objects are the types `Void`, `()` (unit) and `Bool`; with arrows corresponding to all possible functions between these types. Label the arrows with the names of the functions.**

<img src="./imgs/challenge_2_7_6.png" alt="Answer to 2.7.6" style="height:200px;"/>


# 3. Categories Great and Small
________________________________________________________________________________

## 3.1 No objects
There is something fishy here

## 3.2 Simple Graphs

*Free Category*: Directed graphs

> Note: This subsection contains the answer for Challenge 1.4.6 on page 10

## 3.3 Orders
> [[SSC]](#SSC), Chapter 1: Goes into far more details on orders than given here.

**Preorder**
: A set, whose elements can be ordered by morphisms according to $<$ and $=$. A more precise definition is given in [[SSC]](#SSC) (Definition 1.25), which clarifies that preorder relations are binary [[SSC]](#SSC) (Definition 1.8): a relation between the sets $X$ and $X$, i.e. a subset $R \subseteq X \times X$. In other words, for a binary operation, the co- and domains are of the same set.

As booleans values `True` and `False` can be associated to $1$ and $0$, the boolean set is a preorder.

**Partial Order**
: A preorder that satisfies an additional condition: if $a \leq b$ and $b \leq a$ then $a=b$.

> [[SSC]](#SSC), Section 1.2.2:</br>
> Definition 1.25: For a *preorder set*, if $a \leq b$ and $b \leq a$, we write $b \cong a$ and say $a$ and $b$ are equivalent.
>
> Remark 1.30: A *preorder* is a *partial order* if we additionally have that $b \cong a$ implies $b = a$.

**Total Order**
:

**Hom-set**
: A set of morphisms from object $a$ to object $b$ in a category $\mathcal{C}$ is called a hom-set and is written as $\mathcal{C}(a,b)$ (or, sometimes, Hom $\mathcal{C}(a,b)$).

## 3.4 Monoid as Set


## 3.5 Monoid as Category

Monoids are everywhere, and are spread throughout this book. The introduction of them in this Section is very loose and create more knowledge gaps than they make insightful connections. Thus I like to give a more rigorous definition of them here.

> [[PC]](#PC), Definition 1.46, page 18:</br>
> A *monoid* $(M, e, \diamond)$ consists of</br>
> (i) a set $M$, called the *carrier*;</br>
> (ii) an element $e \in M$, called the *unit*; and</br>
> (iii) a function $\diamond : M \times M \to M$, called the (binary) *operation*.
>
> These are subject to two conditions:
> (a) (unitality) for any $m \in M$, we have $e \diamond m = m$ and $m \diamond e = m$;</br>
> (b) (associativity) for any $l,m,n \in M$, we have $(l \diamond m) \diamond n = l \diamond (m \diamond n).$


## 3.6 Challenges
**1. Generate a free category from:**
- a) A graph with one node and no edges

<img src="./imgs/challenge_3_6_1_a.png" alt="Answer to 3.6.1.a" style="height:70px;"/>

However I am not quite sure about this answer, because [[CM]](#CM) speaks of interla morphisms on page 30.

- b) A graph with one node and one (directed) edge (hint: this edge can be composed with itself)

<img src="./imgs/challenge_3_6_1_b.png" alt="Answer to 3.6.1.b" style="height:70px;"/>

- c) A graph with two nodes and a single arrow between them

<img src="./imgs/challenge_3_6_1_c.png" alt="Answer to 3.6.1.c" style="height:70px;"/>

- d) A graph with a single node and 26 arrows marked with the
letters of the alphabet: a, b, c ... z.

**2. What kind of order is this?**
- a) A set of sets with the inclusion relation: A is included in B if every element of A is also an element of B.

Our morphisms are subset relations. Every set includes itself, $A \subseteq A$. Inclusion is also composable. $A \subseteq B$ and $B \subseteq C$ implies $A \subseteq C$. This means that we at least have a preorder. If $A \subseteq B$ and $B \subseteq A$ then $A = B$, which means that we at least have a partial order. Not all objects are a subset of each other though. For example {1} and {2,3} are not subsets of each other. This means we don't have a total order and only a partial order.

- b) C++ types with the following subtyping relation: T1 is a sub-type of T2 if a pointer to T1 can be passed to a function that expects a pointer to T2 without triggering a compilation error.


# 4. Kleisli Functions
________________________________________________________________________________

It is quite strange that Kleisli functions are itroduced in the book before, e.g., isomorphisms or other concepts generally introduced beforehand in other books.

In typed functional programming, the Kleisli category is used to model
call-by-value functions with side-effects and computation.

> Note: This section contains suggestions for Challenge 2.7.1


> [[CH]](#CH), page 75:<br/>
> Every *monad* defines a new category, called the *Kleisli category*.

## 4.2 Writer in Haskell
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


## 4.3 Kleisli Categories

For our limited purposes, a Kleisli category has, as objects, the types of the underlying programming language.

“embellishment” corresponds to the notion of an *endofunctor* in a category... something like endomaps but for categories instead of objects in categories (we learn in Sections 7.1 that functors are mappings between categories).

What is exactly the difference between endomaps and endofunctors?

## 4.4 Challenges

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


# 5. Products and Coproducts
________________________________________________________________________________


Need to explain what a universal construction is

## 5.1 Initial Object

Many more notes in:
- [[SSC]](#SSC), Section 6.2.1, page 183
- [[PC]](#PC), Section 2.2.2, page 39
- [[CH]](#CH), Section 1.3, page 13

*Uniqueness up to isomorphism* is explained in, e.g.:
- https://www.math3ma.com/blog/up-to-isomorphism
- https://en.wikipedia.org/wiki/Up_to


## 5.2 Terminal Object

Many more notes in:
- [[CM]](#CM), Article IV.1, page 213
- [[SSC]](#SSC), Section 3.5.1, page 108
- [[PC]](#PC), Section 2.2.1, page 37
- [[CH]](#CH), Section 1.3, page 13


## 5.3 Duality

The duality w.r.t. categories describes the fact, that for any category $\mathcal{C}$ we can define the opposite category $\mathcal{C}^{\text{op}}$ just by reversing all it's morphisms $f: a \to b$ to $f^{\text{op}}: b \to a$ ([[CM]](#CM) denotes it as $f^{-1}$). It follows then that a terminal object is the initial object in the opposite category.

> This is related to *invertible morphisms*, for which you can find an indepth introduction in [[CM]](#CM) starting from Article II, page 40 (and continuing for a long time), which I find clearer than what is described in the next section on *isomorphisms*.


## 5.4 Isomorphisms

> [[CM]](#CM), Section 4.2, page 61:</br>
> "If $f: A \to B$, an *inverse* for $f$ is a [morphism] $g: B \to A$ satisfying both</br>
> $g \circ f = 1_{A}$, and $f \circ g = 1_{B}$</br>
> If $f$ has an inverse, we say $f$ is an isomorphism, or invertible [morphism]."


## 5.5 Products
I find the following definition makes things far more clearer.

> [[PC]](#PC), Definition 2.19, page 40:</br>
> Let $x$ and $y$ be objects in a category $\mathcal{C}$. A *product* of $x$ and $y$ consists of three things: an object, denoted $x \times y$ and two morphisms $\pi_1: x \times y \to x$ and $\pi_2: x \times y \to y$, with the following *universal property*: For any other such three things, i.e. for any object $a$ and morphisms $f: a \to x$ and $g: a \to y$, there is a unique morphism $h: a \to x \times y$ such that the following diagram commutes:
>
> <img src="./imgs/definition_5_5_products.png" alt="Definition of products from 'Programming with Categories'" style="height:150px;"/>
> Figure 5.5.1
>
> Often we just refer to $x \times y$ as the product of $x$ and $y$. We call the morphisms $\pi_1$ and $\pi_2$ *projection maps* and *h* is frequently denoted as $h = \langle f, g \rangle$.
>
> (This definition is basically the same as [[SSC]](#SSC), Definition 3.71, page 110)

So products are about pairs, but they’re about pairs of morphisms, rather than elements.

```
f :: c -> a
g :: c -> b
```
Are injective and like

I also notice that the triangles $\pi_1 \circ h = f$ and $\pi_2 \circ h = g$ are Both *choice problems* as introduced in [[CM]](#CM) Article 2.2, page 45.

Many more notes in:
- [[PC]](#PC), Section 2.2.3, page 40
- [[SSC]](#SSC), Section 3.5.1, page 110

## 5.6 Coproduct

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

## 5.7 Asymmetry

We’ll see later that product behaves like multiplication, with the terminal object playing the role of one; whereas coproduct behaves more like the sum, with the initial object playing the role of zero.

In the category of sets, an isomorphism is the same as a bijection.

## 5.8 Challenges

**1. Show that the terminal object is unique up to unique isomorphism.**

This challenge asks us to proof the proposition known as the *uniqueness of the terminal object*

> [[CM]](#CM), Article IV.1, page 213</br>
> Proposition (Uniqueness of the Terminal Object):</br>
> If $S_1$, $S_2$ are both terminal objects in the category $\mathcal{C}$, then there is exactly one $\mathcal{C}$-map $S_1 \to S_2$, and that map is a $\mathcal{C}$-isomorphism.
>

Proof: By definition, there is for each object in $\mathcal{C}$ exactly one morphism to the terminal object. Thus if we claim that $S_1$ and $S_2$ are both terminal objects of $\mathcal{C}$, then there must be exactly one morphism for $f: S_1 \to S_2$ and $g: S_2 \to S_1$. By definition, the only morphism that has the terminal $S$ object as the domain is it's own isomorphism $1_{S}$. This mean must must mean that $f \circ g = 1_{S_1}$ and $g \circ f = 1_{S_2}$ are the inverse of each other. Thus, the *uniqueness of the terminal object* is also related to the *uniqueness of inverses*.


**2. What is a product of two objects in a poset? Hint: Use the universal construction.**

Thus our two objects $x$ and $y$ are in the *partial order* category, which uses $\leq$ as it's arrows. Drawing the product diagram helps to find the answer,

<img src="./imgs/challenge_5_8_2.png" alt="Product diagram for Challenge 5.8.2" style="height:150px;"/>

it is useful to know that divisibility relation defines partial ordering on positive integers

Thus, at the domains are objects smaller or equal to the codomain. Meaning that the product in a poset is a greatest lower bound.

A short answer is given in [[PC]](#PC), Section 2.2, Example 2.20, page 41.

Look also at  [[SSC]](#SSC), Example 3.72, page 110 on products in **Set** to help make sense of it.


**3. What is a coproduct of two objects in a poset?**

Reversing our reasoning to the previous question we conclude, that the coproduct is the smallest upper bound, the smallest positive integer that is a multiple of both a and b.

**4. Implement the equivalent of Haskell Either as a generic type in your favorite language (other than Haskell).**

Skip.

**5. Show that `Either` is a “better” coproduct than `Int` equipped with two injections:**
```
int i(int n) { return n; }
int j(bool b) { return b ? 0: 1; }
```
**Hint: Define a function `m :: Int -> (Int, Bool)` that factorizes i and j.**

This is the inverse of the example given on page 62.
`Either` is a "better" coproduct, as it is the initial object, and thus we can map it onto `Int` but not vice versa.

**6. Continuing the previous problem: How would you argue that int with the two injections i and j cannot be “better” than Either?**

**7. Still continuing: What about these injections?**

**8. Come up with an inferior candidate for a coproduct of int and bool that cannot be better than Either because it allows multiple acceptable morphisms from it to Either.**


# 6. Simple Algebraic Data Types
________________________________________________________________________________
This section develops our understanding of *products* and *coproducts* (introduced in Sections 5.5 and 5.6) further in the context of data types.

## 6.1 Product Types

## 6.2 Records

## 6.3 Sum Types

To model finite coproducts, one uses *sum types* (the concepts of sum types, coproducts, and tagged union have their origin from different communities but their meaning are tightly related).

In Section 5.3 introduced the fact of categorical duality, meaning that given a category $\mathcal{C}$ we can invert all morphisms to obtain its the opposite category $\mathcal{C}^{\text{op}}$. Have learned about products and coproducts, we realy that they are each others dual. Hence, we can also understand sum types as being the dual of product types.

In Haskell, sum types $x + y$ are created using the constructor `x | y` as shown in Section 5.6.

It turns out that 𝐒𝐞𝐭 is also a (symmetric) monoidal category with respect to coproduct. The role of the binary operation is played by the disjoint sum, and the role of the unit element is played by the initial object. In terms of types, we have Either as the monoidal operator and Void, the uninhabited type, as its neutral element. You can think of Either as plus, and Void as zero.

## 6.4 Algebra of Types

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
Table 6.4.1

| Logic    | Types                           |
| -------- | ------------------------------- |
| false    | `Void`                          |
| true     | `()`                            |
| x $||$ y | `Either x y = Left x | Right y` |
| x && y   | `(a,b)` or `Pair a b`           |
Table 6.4.2

## 6.5 Challenges

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

From Table 6.4.1 we can read that $a+a$ expressed in types is `Either a a`. And the relation $2=1+1$ is given by `Bool`, of which we need to multiply both sides with `a`. In Section 5.5 we learned that in the categorical context, multiplication is a metaphor for taking the set product. Thus we need to show that there are morphisms $\pi_1$ and $\pi_2$ from the set product `[(True, a), (False, a)]` to `Either a a` and `Bool`.


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

# 7. Functors
________________________________________________________________________________

A functor is a mapping between categories. While functions act on elements in objects, *functors from one category to another are structure-preserving maps of objects and morphisms*.

Since functors are morphisms in $\mathbf{Cat}$, the category of categories.
(while morphisms -- and functions in particular -- apply to functors as well... what exactly is the difference between morphisms and functions?)


Many more notes in:
- [[PC]](#PC), Section 3.2, page 66
- [[CH]](#CH), Section 1.2, page 11

## 7.1 Functors in Programming

From now on, when I speak of functors in the context of programming, I will almost always mean endofunctors.

- `Maybe` functor
- `List` functor
- `Reader` functor

### 7.1.4 Typeclasses

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

## 7.3 Functor Composition

The result of `maybeTail` is of a type that’s a composition of two functors, `Maybe` and `[]`, acting on a, as
```
maybeTail :: [a] -> Maybe [a]
maybeTail []     = Nothing
maybeTail (x:xs) = Just xs
```

## 7.4 Challenges

**1. Can we turn the `Maybe` type constructor into a functor by defining: `fmap _ _ = Nothing` which ignores both of its arguments? (Hint: Check the functor laws.)**

So, instead of using `fmap` as defined on page 94, we tweak it a bit. As explained, we can use equational reasoning to proof the functor laws (identity and composition).

Let's start with the shorter one first, proving the identity law for both types in `Maybe`:
```
fmap id Nothing = Nothing      -- using definition of fmap
                = id Nothing   -- using definition of id

fmap id (Just x) = Nothing     -- using definition of fmap
                 = id Nothing  -- using definition of id
```
We see that for the 'Just x' is being mapped onto Nothing instead of to itself.


**2. Prove functor laws for the reader functor. Hint: it’s really simple.**

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
               = g . fmap (f a)       -- using definition of fmap
               = fmap (g fmap (f a))  -- using definition of fmap
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

fmap (g . f) (Cons a as) = Cons ((g . f) a) (fmap (g . f) as)    -- def of fmap
                         = Cons ((g . f) x) (fmap g (fmap f t))  -- induction
                         = Cons (g (f x)) (fmap g (fmap f t))    -- def of comp
                         = fmap g (Cons (f x) (fmap f t))        -- def of fmap
                         = fmap g (fmap f (Cons x t))            -- def of fmap
                         = (fmap g . fmap f) (Cons x t)          -- def of comp
```

# 8. Functoriality
[Custom foo description](#foo)
[Test section link](#4.-kleisli-functions)

[Test subsection link](#4.2-writer-in-haskell)

## 8.1 Bifunctors

Just as one can take the *Cartesian product* $\times$ for every pair of two objects within one category $\mathcal{A}$, we can also take a product of two categories $F: \mathcal{A} \times \mathcal{B} \to \mathcal{C}$, where $F$ is called a *bifunctor* as it has two arguments (instead of one as a functor has). The produc of categories is an important application of bifunctors, but not the only one...


> [[CH]](#CH), Definition 3.7, page 34</br>
> Given two categories $\mathcal{A}$, $\mathcal{B}$ their product category $\mathcal{A} \times \mathcal{B}$ is given by:
> - The objects $a \in \mathcal{A}$ and $b \in \mathcal{B}$ the bifunctor $F$ produces product-pairs $(a,b)$.
> - The arrows $f: a \to a'$ in $\mathcal{A}$ and the arrows $g: b \to b'$ in $\mathcal{B}$ combine to pairs as $(f,g): (a,b) \to (a',b')$.
> - The identity arrwos for $(a,b)$ are the pair $(\text{id}_a, \text{id}_b)$.
> - Composition of arrows happens per component, i.e. when $f,f' \in \mathcal{A}$ and $g,g' \in \mathcal{B}$:</br>
> $(f,g) \circ (f',g') \equiv (f \circ f', g \circ g')$

In Haskell the `Data.Bifunctor` library contains the following typeclass:
```
class Bifunctor f where
    bimap :: (a -> a') -> (b -> b') -> (f a b -> f a' b')
```
with the bifunctor `f` being type constructor that takes two arguments.


Thus, when we have a morphisms in $\mathcal{A}$ as $f: a \to a'$ and a different morphism in $\mathcal{B}$ as $g: b \to b'$ then the Cartesian product needs to be implements in Haskell as an instance of the `Bifunctor` class as
```
instance Bifunctor (,) where
    bimap f g (a, b) = (f a, g b)
```
This is the instance of pair production, the simplest product type. This instance of the `Bifunctor` makes pairs of types, `(,) a b = (a,b)`.

Here, I have given different labels to the three categories involved in the bifunctor mapping. However, as Bartosz states on page 92, we want to stay in the realm where objects are Haskell types and therefore consider only endofunctors. This means that we talk about $\mathcal{C} \times \mathcal{C} \to \mathcal{C}$, does this make sense?

Let’s define a bifunctor in Haskell. In this case all three categories are the same: the category of Haskell types.

Many more notes in:
- [[PC]](#PC), Section 3.4.3, page 83
- [[CH]](#CH), Section 3.3, page 34

## 8.2 Product and Coproduct Bifunctors

Above we have introduced the bifunctor through it's application to form products of categories. But we can of course by duality also use bifunctors to create coproducts of categories.

In In Haskell, this is exemplified by the `Either` type constructor being an instance of `Bifunctor`:
```
instance Bifunctor Either where
    -- this instance gives bimap the type signature:
    -- bimap :: (a -> a') -> (b -> b') -> (Either a b -> Either a' b')
    bimap f _ (Left a) = Left (f a)
    bimap _ g (Right b) = Right (g b)
```


## 8.3 Functorial Algebraic Data Types

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

## 8.5 The `Writer` Functor
Advancing the `Write` introduced in Section 4.2
Compare with Section 7.? for the `Reader` functor

## 8.6 Covariant and Contravariant Functors

## 8.7 Profunctors

## 8.8 The Hom-Functor


To summaries
> [[PC]](#PC), Definition 3.2, page 67</br>
> Let $\mathcal{C}$ and $\mathcal{D}$ be categories.</br>
> - A *contravariant functor* $\mathcal{C} \to \mathcal{D}$ is a functor $\mathcal{C}^{\text{op}} \to \mathcal{D}$.
> - An *endofunctor* on $\mathcal{C}$ is a functor $F: \mathcal{C} \to \mathcal{C}$
> - A *bifunctor* on $\mathcal{C}$ is a functor $\mathcal{C} \times \mathcal{C} \to \mathcal{D}$
> - A *profunctor* on $\mathcal{C}$ is a functor $\mathcal{C} \times \mathcal{C}^{\text{op}} \to \mathbf{Set}$.


## 8.9 Challenges

# Foo

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
