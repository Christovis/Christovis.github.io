---
title: Towards Environmental Sustainability with the IETF
type: blog
date: 2021-03-03
imageurl: /assets/preview_ict_for_sustainability.png
imagedsc: Part of the cover of the 2nd issue of the Branch magazine.
authors: Christoph Becker
---

Information and communications technology (ICT) has played an important role in promoting the transition of society, technology, and economy from the industrial to information era. Now, the transformation of society from a information to a post-anthropocenic epoch (or Chthulucene, Capitalocene, whatever floats your boat) through ICT is being widely advocated [[1]](#1), and they are often positioned as one potential means of reducing energy-intensity of daily live [[2]](#2). Reason being is, that ICT can increase the energy efficiency of the global economy, which currently wastes appr. 86% of the produced energy [[3]](#3). For the energy sector specifically, it would enable a distributed and decentralised energy networks of producers, consuming, and prosumers. This would in turn shorten power transmission routes, decrease energy waste, and reduce greenhouse gas (GHG) emissions.

The ICT sector used a iota of energy relative to the total use of societies (in the Global North) in 2011 [[4]](#4). However, the ICT sector itself will pose as a significant burden on the path towards a sustainable society while it dominates the economy and our daily lives. The worst case scenario forecasts a usage of as much as 51% of global electricity production and a contribution of up to 23% to the globally released GHG emissions by ICT in 2030 [[5]](#5). The parts of the ICT that will be consuming most of its energy are wireless telecommunication systems and data centres.

Therefore it is necessary to critically examine separate parts of the Internet and ask not only whether they can be improved with respect to increasing capacity and speed, but also, whether they can minimise environmental damage, which has received far less attention [[6]](#6). As standard developing organisations (SDOs) define the set of (technical) criteria, associated practices and methods that ensure the interoperability of networks and datasets, they play an important role in this process.

| Layer         | Standards                                               | SDOs
| ------------- | -------------                                           | -------------
| 4 Application | XML, HTTP, HTML, IMAP, POP, MIME                        | IETF, IETF, W3C
| 3 Transport   | TCP, UDP, TLS, QUIC                                     | IETF
| 2 Internet    | IPv4, IPv6, ICMP, ECM, Seamoby                          | IETF
| 1 Network     | Ethernet, IEEE 802, 11, ISDNm DSL, WiFi, 3G/4G/5G/6G... | IEEE, ETSI, 3GPP

The International Standardization Organization (ISO), the International Electrotechnical Commission (IEC), Institute of Electrical and Electronics Engineers Standards Association (IEEE-SA) and the United Nations International Telecommunications Union (ITU) are three of the most important standard organisations for the ICT.
For Greening ICT system such as data center and a network infrastructure, several organisations have been promoting international standardisation. ITU-T (International Telecommunication Union-Telecommunication Standardisation Sector) investigates environmental effect of ICT system and discusses its standardisation [6].
The International Telecommunication Union’s Standardization Sector (ITU-T) handles telecommunication protocols.

The 3rd Generation Project Partnership (3GPP) which sets standards for mobile communications.
The European Telecommunications Standards Institute (ETSI) published a standard, ES-203 237, the Green Abstraction Layer, that specified the Green Standard Interface (GSI) for a uniform way for interactions between the energy-aware hardware and the control framework [21]. The proposed GSI intended to provide the functionalities of discovery, control plane retrieving information about the different energy states supported by the data plane, and monitoring, exchanging relevant device parameters. The goal of this standard was to represent an abstraction of the energy-aware capabilities of networking devices to higher-layer protocols.
Other organisations discuss standard protocol and data set for green ICT. ETSI (European Telecommunications Standards Institute) are promoting an international standardisation of a protocol to monitor and control air-conditioning equipment and an electrical device [8]. In Ecma International, members discuss standard data sets for monitoring and controlling the status of a server and air-conditioning equipment [9].

The World Wide Web Consortium (W3C), which sets standards for the web.
In the W3C standard setting organisation the public email archive {\tt public-bde-climate} of the 'BDE-Climate action, environment, resource efficiency and raw materials Community Group' was depreciated in April 2016. Their work continues in the 'Big Data Europe Community Group' and will be used to design and realise the ICT infrastructure needed to benefit from big data technologies, maximising the opportunities of the latest European RTD developments, including multilingual data harvesting, data analytics, and data visualisation. The program for 2018-20 can be found here https://ec.europa.eu/research/participants/data/ref/h2020/wp/2018-2020/main/h2020-wp1820-climate_en.pdf.

The Internet Engineering Task Force (IETF) creates and publishes internet communication protocols.

A clear example of IETF's influence is given by its redesign of the IPv4 communication protocol into the improved version IPv6. The redesign does not only solve the problem of IPv4 address exhaustion, but also reduces energy waste and increases flexibility towards green networking (e.g., [[7]](#7), [[8]](#8), [[9]](#9), [[10]](#10)). In 2010, the IETF set up the Energy Management working group (EMAN, [[11]](#11)) to create a framework standard that enables monitoring, controlling, and managing the energy consumption of networking and network-attached devices while still providing sufficient performance to meet service level objectives with Five years later however, the EMAN working group was shut down and has never been reactivated despite remaining limitations (e.g., it does not address questions regarding electricity producers, and distributors) and the roll-out of new technologies (e.g., IoT and 5G). But other dimensions through which impacts on climate and ecology can be addressed are present in other working groups that are concerned with, e.g., smart energy, smart grid, and the Internet of Things.

The IETF is one of the main Internet governance bodies and it is therefore pressing to ask what its role ought to be, can be, and currently is with respect to climate change.
On the other hand, IETF Eman (Internet Engineering Task Force-Energy Management) studies several MIBs for energy management of network devices in ICT systems for international standardisation actively. These MIBs are based on SNMPs but all drafts by EMAN are caught in the proposal stage (e.g. RFC 7603 which hasn't considered security issues of SNMPs, as the reviewr writes "This necessarily extends to monitoring, and there is certainly a *lot* of information that may be gleaned by an attacker from monitoring power consumption,").


At present, the proposed energy-efficient methods are usually divided into two classes: one is on device-level, which provides the energy-efficient network devices and terminals; the other is on system-level, which organises the usage of devices and terminals energy-efficiently in a network-wide manner. The energy-efficient routing algorithm belongs to system-level energy saving scheme, which aims to find the most energy-efficient route for users and thus reduce energy consumption when transferring traffic along the route.




Now, the ICT sector is in a similar situations and various 'ICT for Sustainability' ([ICT4S](https://conf.researchr.org/series/ict4s)) and Green IT initiatives have cropped up over the years. Thus

And here, it is worthwhile to dwell on the what this space 'elsewhere' is. However, the observation that decreasing a processes resource intensity does not lead to a decrease in overall consumption, has already been described by Stanley Jevons in his 1865 work "The Coal Question". The so called "Jevons paradox" has since then always gone alongside the pursued to increasing efficiency and economic growth. Taking LEDs as an example, 'elsewhere' has come to be a very large space indeed. Their appr. 60% lower environmental impact than fluorescent luminaire [[12]](#12), and more so their impression of 'advanced technology', has motivated application to allsorts, e.g., [digital pregnancy tests](https://twitter.com/Foone/status/1301707401024827392).

### References
<a id="1">[1]</a>
UK Digital Strategy 2017
Department for Digital, Culture, Media & Sport; UK Gov.

<a id="2">[2]</a>
#SMARTER2030 ICT Solutions for 21st Century Challenges (2015)
Global e-Sustainability Initiative

<a id="3">[3]</a>
The energy and emergy of the internet (2011)
Barath Raghavan and Justin Ma

<a id="4">[4]</a>
The Energy Efficiency Benefits and the Economic Imperative of ICT-Enabled Systems (2015)
In: ICT Innovations for Sustainability
Springer International Publishing

<a id="5">[5]</a>
Anders Andrae and Tomas Edler (2015)
On Global Electricity Usage of Communication Technology: Trends to 2030.

<a id="6">[6]</a>
Casamayor, J.L., Su, D. and Ren, Z. (2018)
Comparative life cycle assessment of LED lighting products.
Lighting Research & Technology

<a id="7">[7]</a>
Ran Liu et al. (2019)
Impacts of the digitaltransformation on the environment and sustainability.
Technical report, Oko‑Institut e.V., December2019

<a id="8">[8]</a>
J. Chabarek et al. (2008)
Power Awareness in NetworkDesign and Routing.
The 27th Conference on Computer Communications, IEEE

<a id="9">[9]</a>
Roberto Bruschi et al. (2014)
Green extension of OpenFlow.
The 26th International Teletraffic Congress, IEEE

<a id="10">[10]</a>
Frederic Giroire et al. (2014)
Optimizing rule placement in software‑defined networks for energy‑aware routing.
The Global Communications Conference, IEEE

<a id="11">[11]</a>
Joel Jaeggli (2014)
Energy Management (EMAN) Applicability Statement
