---
title: Durham Research Methods Conversations - Machine Learning
type: essay
date: 2020-11-25
imageurl: /assets/peview_adventure.jpg
authors: Christoph Becker
---

### ML in Durham
Machine Learning (ML) has, in the last decade become something of a scientific bandwagon. Starting as a theoretical work in the departments of computer science and mathematics, it has since toured through most campus parts of many universities, where its performances have led to new insights and breakthroughs on a wide range of topics. During this week's Research Methods Conversation the focus was on how ML is and can be used by academics and the Universities management, and what ethical and methodological difficult could arise.


Durham University, proud of having one of the leading music departments in the UK, is employing talented scientists that have and are starting to contribute with their ML inspired algorithmic compositions to the advances of their field [^1]. [Ulrik Beierholm](https://www.dur.ac.uk/psychology/staff/profile/?id=14641), of the department of Psychology, explained how he is using reinforcement learning (an area of ML where models are trained to make decisions in an uncertain, complex environment) to model how the nervous system deals with uncertainty. This path of research holds much potential as connections between ML and the cognitive system have been published (e.g. [Yamins, D.L.K. et al. 2014](https://www.pnas.org/content/111/23/8619)), as the algorithm is easier to analyse than a brain.
Another exciting project which was brought up by [Michelle W. De-Gruchy](https://www.dur.ac.uk/archaeology/staff/?id=8883), who works in the department of Archaeology, is her collaboration with the Institute of Data Science to use ML to map soil types on aerial photography or satellite imagery.


### Pitfalls
However, the ML bandwagon found a bigger resonance on stages outside of the universities. As neoliberal policies from 80's have completed the dismantling of public and private monopolies over telecommunications networks and digital technologies, data flows have profoundly intensified ([Bigo, R., Isin, E., Ruppert E. 2017](https://www.routledge.com/Data-Politics-Worlds-Subjects-Rights/Bigo-Isin-Ruppert/p/book/9781138053267)). Shortly thereafter, research into ML has shifted in the 90's from a knowledge- to a data-driven approach to reasoning, which led to Deep Blue winning against Garry Kasparov and transformed data into the new oil of the digital economy. However, seldom do more than a few of nature's secrets give way at one time. In recent years the consumer, business and government sectors who deployed of a plethora of ML based systems on a predominant vision of their rapid responds to data in 'real-time', accessibility, transparency, panoramic, prophetic, and smartness had to realize that it does not solve as many problems as we might have wished.

A common problem of ML models is that they can be tuned and tweaked to near-perfect [performance in the lab](https://www.technologyreview.com/2020/11/12/1011944/artificial-intelligence-replication-crisis-science-big-tech-google-deepmind-facebook-openai/) often fail in real settings. This is typically put down to a mismatch between the data the ML model was trained and tested on and the data it encounters in the world, a problem known as _data shift_. Now another issue, known as _underspecification_ in statistics, has been brought to light by [Google](https://www.technologyreview.com/2020/11/18/1012234/training-machine-learning-broken-real-world-heath-nlp-computer-vision/). In contrast to the data shift, underspecification describes a problem with the way that ML models are currently trained and tested.

As participants shared their thoughts on the dissonance between lab and real world performances of ML models and their ethicopolitical existence, the conversation found itself in a refrain of points made in the conversation on '[Data Science and Social Science Theory](https://researchmethodsconversations.blogspot.com/2020/11/data-science-and-social-science-theory.html)' (e.g. the risks that "pre-existing data sets could reinforce systems of bias and privilege"). The need for a "human in the loop" with expert knowledge was emphasized, while it was also realized that this human is an impossible figure when one considers the entanglement of the expert, algorithm, training and real world data, as detailed in '[Cloud Ethics](https://www.dukeupress.edu/cloud-ethics)' by L. Amoore (2020).

On this topic the important work of [Noura Al Moubayed](https://www.dur.ac.uk/research/directory/staff/?id=14675), from the department of Computer Science, was mentioned. She is working to improve the explainability of ML outcomes. Advances in this direction would open up the _black box_ and improve the interpretability, hence making them more trustworthy.

### Responsibility

[Alexandra Cristea](https://www.dur.ac.uk/research/directory/staff/?id=17167) is working on ethics in ML.

[Harsh Bajpai](https://www.dur.ac.uk/directory/profile/?id=19043) investigates surveillance in digitalization of learning in classroom environments (pupils, teachers, administrators,...) [Surveillance on students raise privacy concerns on Online Education Platforms](https://www.theleaflet.in/surveillance-on-students-raise-privacy-concerns-on-online-education-platforms/#).

"As a consequence, it has perhaps been ballooned to an importance beyond" its actual capabilities [[1]](#1).

## How to
Starting your your own dive into ML is substantially easier with knowledge of Python,
as 99% is done in python with libraries such as PyTorch and TensorFlow, thus skills
in this language are essential (Jonathan Frawley gives a course on it).

There is also the option of creating a [Kaggle](https://www.kaggle.com/) competition
for you scientific problem.

[^1]: Curiously one of the few departments where it has proven very difficult to apply ML in a useful way.

<a id="1">[1]</a>
Shannon, Claude E. (1956).
The Bandwagon.
IRE Transactions on Information Theory, 2(1), 3.
