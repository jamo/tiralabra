#tiralabra
Jarmon tiralabra

Tässä toteutetaan
-----------------
* [Binäärikeko](http://en.wikipedia.org/wiki/Binary_heap)
* [Binomikeko](http://en.wikipedia.org/wiki/Binomial_heap)
* [D-keko](http://en.wikipedia.org/wiki/D-ary_heap)




Testien suoritus
----------------
Tässä oletetaan että koneessa on Ruby, mieluusti 1.9.3 (minulla käytössä 1.9.3-p125)

###Keon käyttäminen ja testien suorittaminen vaatii seuraavien gemien asennuksen:
* rspec
* simplecov

`gem install simplecov rspec`

###Testien suorittaminen 
git repon juuressa oltaessa
`rspec heap/Heap/spec/`
Testien kattavuus tieto näkyy yllä oleen komennon suorittamisen jälkeen.
Lisäksi testien kattavuudesta selkeämpi kuva löytyy heap/Heap/spec/coverage/index.html tiedostosta.
###Benchmarkkien suorittaminen
git repon juuressa oltaessa
`rspec heap/Heap/benchmark`
Tämä tulostaa keon suoritusaikoja erikokoisilla syötteillä.


Status
-------
 *Dokumentit valmiina
 *Keot valmiit
 *100% testattu
 *Dokumentointi valmis

Eli työ taitaa olla kaikenkaikkiaan täysin valmis.