---
title: Durham Research Methods Conversations - Machine Learning
type: essay
date: 2020-11-25
imageurl: /assets/preview_ai.jpg
authors: Christoph Becker
---

Machine Learning (ML) has, in the last decade become something of a scientific bandwagon. Starting as a theoretical work in the departments of computer science and mathematics, it has since toured through most campus parts of many universities, where its performances have led to new insights and breakthroughs on a wide range of topics. During this week's Research Methods Conversation the focus was on how ML is and can be used by academics and the Universities management, and what ethical and methodological difficult could arise.

Durham University, proud of having one of the leading music departments in the UK, is employing talented scientists that have and are starting to contribute with their ML inspired algorithmic compositions to the advances of their field [^1]. [Ulrik Beierholm](https://www.dur.ac.uk/psychology/staff/profile/?id=14641), of the department of Psychology, explained how he is using reinforcement learning (an area of ML where models are trained to make decisions in an uncertain, complex environment) to model how the nervous system deals with uncertainty. This path of research holds much potential as connections between ML and the cognitive system have been published (e.g. [Yamins, D.L.K. et al. 2014](https://www.pnas.org/content/111/23/8619)), as the algorithm is easier to analyse than a brain.
Another exciting project which was brought up by [Michelle W. De-Gruchy](https://www.dur.ac.uk/archaeology/staff/?id=8883), who works in the department of Archaeology, is her collaboration with the Institute of Data Science to use ML to map soil types on aerial photography or satellite imagery.

However, the ML bandwagon found a bigger resonance on stages outside of the universities. As neoliberal policies from 80's have completed the dismantling of public and private monopolies over telecommunications networks and digital technologies, data flows have profoundly intensified ([Bigo, R., Isin, E., Ruppert E. 2017](https://www.routledge.com/Data-Politics-Worlds-Subjects-Rights/Bigo-Isin-Ruppert/p/book/9781138053267)). Shortly thereafter, research into ML has shifted in the 90's from a knowledge- to a data-driven approach to reasoning, which led to Deep Blue winning against Garry Kasparov and transformed data into the new oil of the digital economy. However, seldom do more than a few of nature's secrets give way at one time. In recent years the consumer, business and government sectors who deployed of a plethora of ML based systems on a predominant vision of their rapid responds to data in 'real-time', accessibility, transparency, panoramic, prophetic, and smartness had to realize that it does not solve as many problems as we might have wished.

A common problem of ML models is that they can be tuned and tweaked to near-perfect [performance in the lab](https://www.technologyreview.com/2020/11/12/1011944/artificial-intelligence-replication-crisis-science-big-tech-google-deepmind-facebook-openai/) often fail in real settings. This is typically put down to a mismatch between the data the ML model was trained and tested on and the data it encounters in the world, a problem known as _data shift_. Now another issue, known as _underspecification_ in statistics, has been brought to light by [Google](https://www.technologyreview.com/2020/11/18/1012234/training-machine-learning-broken-real-world-heath-nlp-computer-vision/). In contrast to the data shift, underspecification describes a problem with the way that ML models are currently trained and tested.

As participants shared their thoughts on the dissonance between lab and real world performances of ML models and their ethicopolitical existence, the conversation found itself in a refrain of points made in the conversation on '[Data Science and Social Science Theory](https://researchmethodsconversations.blogspot.com/2020/11/data-science-and-social-science-theory.html)' (e.g. the risks that "pre-existing data sets could reinforce systems of bias and privilege"). The need for a "human in the loop" with expert knowledge was emphasized, while it was also realized that this human is an impossible figure when one considers the entanglement of the expert, algorithm, training and real world data, as detailed in '[Cloud Ethics](https://www.dukeupress.edu/cloud-ethics)' by [L. Amoore](https://www.dur.ac.uk/geography/staff/geogstaffhidden/?id=2710) (2020), who work in the Geography department.

On this topic the important work of [Noura Al Moubayed](https://www.dur.ac.uk/research/directory/staff/?id=14675), from the department of Computer Science, was mentioned. As ML models can be highly non-linear with a gazillion parameters, they form a _black box_ that is impossible to understand. Noura's research focuses on finding tools that could turn a _black_ into a _white box_, which provide explanations of their decision in a human understandable way. Achieving interpretability and transparency in turn are important to ensure algorithmic fairness and identify potential bias.

However, ML models themselves are not the only fermata towards an algorithmic accountability. The opaque, unverifiable and unchallengeable decision-making process of many currently deployed data flows and algorithms across consumer, business, and government sectors have led to the coined term [_black box society_](https://www.hup.harvard.edu/catalog.php?isbn=9780674970847). Many participants in the conversation could immediately think of ways how ML based algorithms could impacts their professional live. The widely reported case of [Amazon's automated hiring system](https://www.theguardian.com/technology/2018/oct/10/amazon-hiring-ai-gender-bias-recruiting-engine) has made the participants wonder how their knowledge thereof would alter the way they would present themselves, putting emphasize on buzzwords the algorithm could weigh positively.

As Covid-19 had us move more of our lives into virtual spaces, Universities have opened new data flow wells to reach their now remote students, that in some cases are not far from [surveillance technology](https://www.wired.co.uk/article/university-covid-learning-student-monitoring). A participant noted, that the ways in which surveillance can crop up in simulated classroom environments and how they are observed and interpreted by students, teachers, and administrators is part of [Harsh Bajpai](https://www.dur.ac.uk/directory/profile/?id=19043)'s research, who is a PhD at Durham Law School. Another participant pushed further and imagined use cases beyond the supporting human decision making but replacing it all together. This would lead to the redundancy of labour which was imagined to impact especially the global South, as it is in the North where most of the computational power, data centres, and advances in learning algorithms reside.

### How to
Starting your your own dive into ML is substantially easier with knowledge of Python,
as 99% is done in python with libraries such as PyTorch and TensorFlow, thus skills
in this language are essential (Jonathan Frawley gives a course on it).

There is also the option of creating a [Kaggle](https://www.kaggle.com/) competition
for [you](you) scientific problem.

"As a consequence, it has perhaps been ballooned to an importance beyond" its actual capabilities [[1]](#1).
This blog expresses the author's views and interpretation of comments made during the conversation. Any errors or omissions are the author's.

[^1]: Curiously one of the few departments where it has proven very difficult to apply ML in a useful way.

<a id="1">[1]</a>
Shannon, Claude E. (1956).
The Bandwagon.
IRE Transactions on Information Theory, 2(1), 3.
