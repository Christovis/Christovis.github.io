---
title: BIGBANG - Für ein transparenteres und rechenschaftspflichtiges Internet
type: blog
date: 2022-02-21
imageurl: /assets/preview_ict_for_sustainability.png
imagedsc: Part of the cover of the 2nd issue of the Branch magazine.
authors: Christoph Becker
---


Jedes Mal, wenn man das Internet benutzt, sei es, um mit Verwandten in Kontakt zu bleiben oder Nachrichten aus aller Welt zu lesen, verlässt du dich auf die Arbeit von Normgremien, um ein schnelles, sicheres und genaues Übermitteln von Webseiten, Videos und Telefonsignalen zu garantieren. Es gibt eine Vielzahl von unterschiedlichen regionalen und globalen Normgremien, die Standards und Protokolle für das Internet definieren. Zwei der wichtigsten Normgremien sind die '[Internet Engineering Task Force](https://www.ietf.org/)' (IETF) und das '[World Wide Web Consortium](https://www.w3.org/)' (W3C) die zusammen Standards so wie HTML, JPEG, SSH, oder PGP gesetzt haben.

Genauso wie man nicht über die Kabel, Datenzentren oder Antennen nachdenken muss, die das Browsen im Internet ermöglichen, entfaltet sich der enorme Einfluss von Normgremien auf z. B., die Fähigkeit privater Nutzer ihre eigenen Datenströme zu kontrollieren, oftmals unbemerkt im Hintergrund. Auch wenn einige Normgremien offen für die Teilnahme eines jeden sind, werden sie oft von internationalen Konzernen (so wie Ericsson, Qualcomm, Siemens, Nokia, Huawei) dominiert, die für das Internet verantwortlich sind. Das kontrollieren, ob neue Standards gewisse Kriterien erfüllen (auf z. B., die Gewährleistung der Privatsphäre von Nutzern) oder richtig implementiert werden, wird den von privaten Unternehmen dominierten Normgremien selbst überlassen.

Mit BigBang haben wir uns das Ziel gesetzt, die Machtverhältnisse, Intentionen und Motivationen innerhalb der Normgremien offen zu legen und sie somit transparenter und rechenschaftspflichtiger zu machen. Normgremien so wie IETF und W3C veröffentlicht nicht nur einen großen Teil ihrer Berichte und Dokumente, sondern auch Aufzeichnung von Treffen, Telefonkonferenzen und Mailinglisten auf ihren Webseiten. Diese Archive bieten Forschern eine einzigartige Gelegenheit, die Prämissen von den Entscheidungen, die innerhalb von Normgremien getroffen werden, zu untersuchen. Insbesondere Mailinglisten sind der Ort, an dem sich die vielfältigen Schichten der Normgremien widerspiegeln und Entscheidungsfindungen sichtbar gemacht werden. Des Weiteren besitzen sie die folgenden Vorteile:
- Mailinglisten sind strukturiert: Sie selber besitzen eine standardisierte Struktur, die seit den frühen Anfängen des Internets beihalten wurde. Somit machen Kopfzeilen Metadaten (z. B. Absender und Zeitstempel) leicht zugreifbar, was verschiedene Arten der Klassifizierung und Analyse unterstützt.
- Mailinglisten sind bereichsübergreifend: Eine Vielzahl von unterschiedlichen Fachgruppen tauschen sich innerhalb thematisierter Mailinglisten aus. Dies ermöglicht es Forschern somit, die Interaktion (z. B. Zusammenarbeit und Reibungspunkte) zwischen den Fachgruppen untersuchen.
- Mailinglisten sind relational: Sie liefern Informationen über Beziehungen zwischen Akteuren (z. B. wer adressiert wen), was es Forschern ermöglicht zu sehen, wer an Entscheidungen teilnimmt oder ausgelassen wird.
- Mailinglisten sind mehrdimensional: Indem sie viele verschiedene Facetten besitzen, ermöglichen sie eine Reihe an statistischen Methoden so wie Häufigkeitsverteilung, Diskurs-, Zeitreihen- und Netzwerkanalyse.

Um BigBang zugänglich zu machen, haben wir die weit verbreitete Programmiersprache Python verwendet, eine Befehlszeilenschnittstelle erstellt und Jupyter notebooks geschrieben die Tutorien beinhalten.

Der Anwendungsablauf von BigBang ist in drei Phasen unterteilt. Erstens, muss man angeben auf welche Mailinglisten zugegriffen werden soll. Bigbang enthält alle bestehenden Mailinglisten von [IETF](https://github.com/datactive/bigbang/blob/main/examples/url_collections/mm.ietf.org.txt), [W3C](https://github.com/datactive/bigbang/blob/main/examples/url_collections/W3C.txt), [3GPP](https://github.com/datactive/bigbang/blob/main/examples/url_collections/listserv.3GPP.txt), [ICANN](https://github.com/datactive/bigbang/blob/main/examples/url_collections/mm.icann.org.txt), und [IEEE](https://github.com/datactive/bigbang/blob/main/examples/url_collections/listserv.IEEE.txt). Such die Mailinglisten in du interessiert bis heraus und kopiere sie in eine Textdatei.

Zweitens, müssen die Mailinglisten heruntergeladen werde. Dies kann man entweder manuell in einem Python Programm machen,
```
from bigbang.ingress import W3CMailList,

mlist = W3CMailList.from_url(
    name="public-webauthn",
    url="https://lists.w3.org/Archives/Public/public-webauthn",
)
```
oder durch die Befehlszeilenschnittstelle in dem du eine das folgende in ein Terminal/Konsole eintippst:
```
$ python3 bin/collect_mail.py -f <Dateipfad zu der Textdatei>
public-webauthn: 100%|#######################################################| 17956/17956 [7:58:47<00:00,  1.60s/it]
www-voice:  34%|######################8                                        | 1408/4128 [38:24<1:16:19,  1.68s/it]
```
Da dies ein Zeitaufwendiges verfahren sein kann für große Mailinglisten (für Mailinglisten mit 200k E-Mails dauert es bis zu 111 Stunden) arbeiten wir daran, um die Datensätze in einem leichter zugänglichen Format zu teilen, welches die DSGVO Grundsetze berücksichtigt.

Nachdem alle Mailinglisten heruntergeladen wurden, können sie mit ein Par bereitgestellten Funktionen analysiert werden, z. B., das Zählen der gesendeten Nachrichten per Domänenteil
```
mlist.get_messagescount(
    header_fields=["comments-to"],
    per_address_field="domain",
)
```
oder das Filtern aller Nachrichten mit einer bestimmten Betreffzeile
```
mlist.crop_by_subject(match="EVS SWG Sessions")
```

BigBang hat bereits aktive Entwickler- und Nutzergruppen bestehend aus AkademikerInnen und AktivistInnen der Zivilgesellschaft und wurde für Projekte der Menschenrechtsorganisation [ARTICLE19](https://www.article19.org/), des '[Center for Democracy and Technology](https://cdt.org/)' (CDT), und des '[Centre for Internet & Society](https://cis-india.org/)' (CIS-India) verwendet. Veröffentlichte Resultate beinhalten unter anderem das Untersuchen von Diversitaet von ICANN zu untersuchen und inwieweit Menschenrechte von Netzinfrastrukturanbieter berücksichtigt werden.


### References
<a id="1">[1]</a>
[ICANN Diversity Analysis](https://cis-india.org/internet-governance/blog/icann-diversity-analysis)
Akriti Bopanna, 2018


<a id="2">[2]</a>
[Public interest, private infrastructure: An analysis of the barriers and drivers for adopting human rights standards in the Internet infrastructure industry](https://www.article19.org/wp-content/uploads/2018/06/HRIA-report-UNGP_5.6.pdf)
ARTICLE 19, 2018


<a id="3">[3]</a>
[Human Rights Due Diligence and Internet Infrastructure](https://www.article19.org/wp-content/uploads/2021/06/A19-and-DIHR-pilot-project-outcome-report_FINAL.pdf)
ARTICLE 19, 2021

