#Tiralabra
Jarmon tiralabra

Tässä asiat vain lyhyesti, tarkempi ja lopullinen dokumentaatio löytyy docs kansiosta
###Aihe
Toteutan seuraavat tietorakenteet
* [Binäärikeko](http://en.wikipedia.org/wiki/Binary_heap)
* [Binomikeko](http://en.wikipedia.org/wiki/Binomial_heap)
* [D-keko](http://en.wikipedia.org/wiki/D-ary_heap)

##Testien suoritus

Tässä oletetaan että koneessa on Ruby, mieluusti 1.9.3 (minulla käytössä 1.9.3-p125)
Tämä vaatii vähintään Ruby 1.9 version. Laitoksen koneella oleva 1.8 ei toimi!

###Keon käyttäminen ja testien suorittaminen vaatii seuraavien gemien asennuksen:
* rspec
* simplecov

`gem install simplecov rspec`

###Testien suorittaminen 
git repon juuressa oltaessa
`cd heaps/Heap/` ja `rspec spec/`
Testien kattavuus tieto näkyy yllä oleen komennon suorittamisen jälkeen.
Lisäksi testien kattavuudesta selkeämpi kuva löytyy heap/Heap/spec/coverage/index.html tiedostosta.
###Benchmarkkien suorittaminen
git repon juuressa oltaessa
`cd heap/Heap/` ja `rspec benchmark/`
Tämä tulostaa keon suoritusaikoja erikokoisilla syötteillä.


###Ohjelman testaaminen (IRB)
git reon juuressa oltaessa 
`cd heaps/Heap/src` ja `ruby test.rb`

Status
-------
* Dokumentit valmiina
* Keot valmiit
* 100% testattu
* Dokumentointi valmis

Valmista on. 