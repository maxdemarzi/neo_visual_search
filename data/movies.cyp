START n=node(*) MATCH (n)-[r?]-() DELETE r,n;
CREATE (TheMatrix {title:'The Matrix', released:1999, tagline:'Welcome to the Real World'})
CREATE (Keanu {name:'Keanu Reeves', born:1964})
CREATE (Carrie {name:'Carrie-Anne Moss', born:1967})
CREATE (Laurence {name:'Laurence Fishburne', born:1961})
CREATE (Hugo {name:'Hugo Weaving', born:1960})
CREATE (AndyW {name:'Andy Wachowski', born:1967})
CREATE (LanaW {name:'Lana Wachowski', born:1965})
CREATE (JoelS {name:'Joel Silver', born:1952})
CREATE
  (Keanu)-[:ACTED_IN {roles:['Neo']}]->(TheMatrix),
  (Carrie)-[:ACTED_IN {roles:['Trinity']}]->(TheMatrix),
  (Laurence)-[:ACTED_IN {roles:['Morpheus']}]->(TheMatrix),
  (Hugo)-[:ACTED_IN {roles:['Agent Smith']}]->(TheMatrix),
  (AndyW)-[:DIRECTED]->(TheMatrix),
  (LanaW)-[:DIRECTED]->(TheMatrix),
  (JoelS)-[:PRODUCED]->(TheMatrix)

CREATE (Emil {name:"Emil Eifrem", born:1978})
CREATE (Emil)-[:ACTED_IN {roles:["Emil"]}]->(TheMatrix)

CREATE (TheMatrixReloaded {title:'The Matrix Reloaded', released:2003, tagline:'Free your mind'})
CREATE
  (Keanu)-[:ACTED_IN {roles:['Neo']}]->(TheMatrixReloaded),
  (Carrie)-[:ACTED_IN {roles:['Trinity']}]->(TheMatrixReloaded),
  (Laurence)-[:ACTED_IN {roles:['Morpheus']}]->(TheMatrixReloaded),
  (Hugo)-[:ACTED_IN {roles:['Agent Smith']}]->(TheMatrixReloaded),
  (AndyW)-[:DIRECTED]->(TheMatrixReloaded),
  (LanaW)-[:DIRECTED]->(TheMatrixReloaded),
  (JoelS)-[:PRODUCED]->(TheMatrixReloaded)

CREATE (TheMatrixRevolutions {title:'The Matrix Revolutions', released:2003, tagline:'Everything that has a beginning has an end'})
CREATE
  (Keanu)-[:ACTED_IN {roles:['Neo']}]->(TheMatrixRevolutions),
  (Carrie)-[:ACTED_IN {roles:['Trinity']}]->(TheMatrixRevolutions),
  (Laurence)-[:ACTED_IN {roles:['Morpheus']}]->(TheMatrixRevolutions),
  (Hugo)-[:ACTED_IN {roles:['Agent Smith']}]->(TheMatrixRevolutions),
  (AndyW)-[:DIRECTED]->(TheMatrixRevolutions),
  (LanaW)-[:DIRECTED]->(TheMatrixRevolutions),
  (JoelS)-[:PRODUCED]->(TheMatrixRevolutions)

CREATE (TheDevilsAdvocate {title:"The Devil's Advocate", released:1997, tagline:'Evil has its winning ways'})
CREATE (Charlize {name:'Charlize Theron', born:1975})
CREATE (Al {name:'Al Pacino', born:1940})
CREATE (Taylor {name:'Taylor Hackford', born:1944})
CREATE
  (Keanu)-[:ACTED_IN {roles:['Kevin Lomax']}]->(TheDevilsAdvocate),
  (Charlize)-[:ACTED_IN {roles:['Mary Ann Lomax']}]->(TheDevilsAdvocate),
  (Al)-[:ACTED_IN {roles:['John Milton']}]->(TheDevilsAdvocate),
  (Taylor)-[:DIRECTED]->(TheDevilsAdvocate)

CREATE (AFewGoodMen {title:"A Few Good Men", released:1992, tagline:"In the heart of the nation's capital, in a courthouse of the U.S. government, one man will stop at nothing to keep his honor, and one will stop at nothing to find the truth."})
CREATE (TomC {name:'Tom Cruise', born:1962})
CREATE (JackN {name:'Jack Nicholson', born:1937})
CREATE (DemiM {name:'Demi Moore', born:1962})
CREATE (KevinB {name:'Kevin Bacon', born:1958})
CREATE (KieferS {name:'Kiefer Sutherland', born:1966})
CREATE (NoahW {name:'Noah Wyle', born:1971})
CREATE (CubaG {name:'Cuba Gooding Jr.', born:1968})
CREATE (KevinP {name:'Kevin Pollak', born:1957})
CREATE (JTW {name:'J.T. Walsh', born:1943})
CREATE (JamesM {name:'James Marshall', born:1967})
CREATE (ChristopherG {name:'Christopher Guest', born:1948})
CREATE (RobR {name:'Rob Reiner', born:1947})
CREATE (AaronS {name:'Aaron Sorkin', born:1961})
CREATE
  (TomC)-[:ACTED_IN {roles:['Lt. Daniel Kaffee']}]->(AFewGoodMen),
  (JackN)-[:ACTED_IN {roles:['Col. Nathan R. Jessup']}]->(AFewGoodMen),
  (DemiM)-[:ACTED_IN {roles:['Lt. Cdr. JoAnne Galloway']}]->(AFewGoodMen),
  (KevinB)-[:ACTED_IN {roles:['Capt. Jack Ross']}]->(AFewGoodMen),
  (KieferS)-[:ACTED_IN {roles:['Lt. Jonathan Kendrick']}]->(AFewGoodMen),
  (NoahW)-[:ACTED_IN {roles:['Cpl. Jeffrey Barnes']}]->(AFewGoodMen),
  (CubaG)-[:ACTED_IN {roles:['Cpl. Carl Hammaker']}]->(AFewGoodMen),
  (KevinP)-[:ACTED_IN {roles:['Lt. Sam Weinberg']}]->(AFewGoodMen),
  (JTW)-[:ACTED_IN {roles:['Lt. Col. Matthew Andrew Markinson']}]->(AFewGoodMen),
  (JamesM)-[:ACTED_IN {roles:['Pfc. Louden Downey']}]->(AFewGoodMen),
  (ChristopherG)-[:ACTED_IN {roles:['Dr. Stone']}]->(AFewGoodMen),
  (AaronS)-[:ACTED_IN {roles:['Man in Bar']}]->(AFewGoodMen),
  (RobR)-[:DIRECTED]->(AFewGoodMen),
  (AaronS)-[:WROTE]->(AFewGoodMen)

CREATE (TopGun {title:"Top Gun", released:1986, tagline:'I feel the need, the need for speed.'})
CREATE (KellyM {name:'Kelly McGillis', born:1957})
CREATE (ValK {name:'Val Kilmer', born:1959})
CREATE (AnthonyE {name:'Anthony Edwards', born:1962})
CREATE (TomS {name:'Tom Skerritt', born:1933})
CREATE (MegR {name:'Meg Ryan', born:1961})
CREATE (TonyS {name:'Tony Scott', born:1944})
CREATE (JimC {name:'Jim Cash', born:1941})
CREATE
  (TomC)-[:ACTED_IN {roles:['Maverick']}]->(TopGun),
  (KellyM)-[:ACTED_IN {roles:['Charlie']}]->(TopGun),
  (ValK)-[:ACTED_IN {roles:['Iceman']}]->(TopGun),
  (AnthonyE)-[:ACTED_IN {roles:['Goose']}]->(TopGun),
  (TomS)-[:ACTED_IN {roles:['Viper']}]->(TopGun),
  (MegR)-[:ACTED_IN {roles:['Carole']}]->(TopGun),
  (TonyS)-[:DIRECTED]->(TopGun),
  (JimC)-[:WROTE]->(TopGun)

CREATE (JerryMaguire {title:'Jerry Maguire', released:2000, tagline:'The rest of his life begins now.'})
CREATE (ReneeZ {name:'Renee Zellweger', born:1969})
CREATE (KellyP {name:'Kelly Preston', born:1962})
CREATE (JerryO {name:"Jerry O'Connell", born:1974})
CREATE (JayM {name:'Jay Mohr', born:1970})
CREATE (BonnieH {name:'Bonnie Hunt', born:1961})
CREATE (ReginaK {name:'Regina King', born:1971})
CREATE (JonathanL {name:'Jonathan Lipnicki', born:1990})
CREATE (CameronC {name:'Cameron Crowe', born:1957})
CREATE
  (TomC)-[:ACTED_IN {roles:['Jerry Maguire']}]->(JerryMaguire),
  (CubaG)-[:ACTED_IN {roles:['Rod Tidwell']}]->(JerryMaguire),
  (ReneeZ)-[:ACTED_IN {roles:['Dorothy Boyd']}]->(JerryMaguire),
  (KellyP)-[:ACTED_IN {roles:['Avery Bishop']}]->(JerryMaguire),
  (JerryO)-[:ACTED_IN {roles:['Frank Cushman']}]->(JerryMaguire),
  (JayM)-[:ACTED_IN {roles:['Bob Sugar']}]->(JerryMaguire),
  (BonnieH)-[:ACTED_IN {roles:['Laurel Boyd']}]->(JerryMaguire),
  (ReginaK)-[:ACTED_IN {roles:['Marcee Tidwell']}]->(JerryMaguire),
  (JonathanL)-[:ACTED_IN {roles:['Ray Boyd']}]->(JerryMaguire),
  (CameronC)-[:DIRECTED]->(JerryMaguire),
  (CameronC)-[:PRODUCED]->(JerryMaguire),
  (CameronC)-[:WROTE]->(JerryMaguire)

CREATE (StandByMe {title:"Stand By Me", released:1995, tagline:"For some, it's the last real taste of innocence, and the first real taste of life. But for everyone, it's the time that memories are made of."})
CREATE (RiverP {name:'River Phoenix', born:1970})
CREATE (CoreyF {name:'Corey Feldman', born:1971})
CREATE (WilW {name:'Wil Wheaton', born:1972})
CREATE (JohnC {name:'John Cusack', born:1966})
CREATE (MarshallB {name:'Marshall Bell', born:1942})
CREATE
  (WilW)-[:ACTED_IN {roles:['Gordie Lachance']}]->(StandByMe),
  (RiverP)-[:ACTED_IN {roles:['Chris Chambers']}]->(StandByMe),
  (JerryO)-[:ACTED_IN {roles:['Vern Tessio']}]->(StandByMe),
  (CoreyF)-[:ACTED_IN {roles:['Teddy Duchamp']}]->(StandByMe),
  (JohnC)-[:ACTED_IN {roles:['Denny Lachance']}]->(StandByMe),
  (KieferS)-[:ACTED_IN {roles:['Ace Merrill']}]->(StandByMe),
  (MarshallB)-[:ACTED_IN {roles:['Mr. Lachance']}]->(StandByMe),
  (RobR)-[:DIRECTED]->(StandByMe)

CREATE (AsGoodAsItGets {title:'As Good as It Gets', released:1997, tagline:'A comedy from the heart that goes for the throat.'})
CREATE (HelenH {name:'Helen Hunt', born:1963})
CREATE (GregK {name:'Greg Kinnear', born:1963})
CREATE (JamesB {name:'James L. Brooks', born:1940})
CREATE
  (JackN)-[:ACTED_IN {roles:['Melvin Udall']}]->(AsGoodAsItGets),
  (HelenH)-[:ACTED_IN {roles:['Carol Connelly']}]->(AsGoodAsItGets),
  (GregK)-[:ACTED_IN {roles:['Simon Bishop']}]->(AsGoodAsItGets),
  (CubaG)-[:ACTED_IN {roles:['Frank Sachs']}]->(AsGoodAsItGets),
  (JamesB)-[:DIRECTED]->(AsGoodAsItGets)

CREATE (WhatDreamsMayCome {title:'What Dreams May Come', released:1998, tagline:'After life there is more. The end is just the beginning.'})
CREATE (AnnabellaS {name:'Annabella Sciorra', born:1960})
CREATE (MaxS {name:'Max von Sydow', born:1929})
CREATE (VincentW {name:'Vincent Ward', born:1956})
CREATE (WernerH {name:'Werner Herzog', born:1942})
CREATE (Robin {name:'Robin Williams', born:1951})
CREATE
  (Robin)-[:ACTED_IN {roles:['Chris Nielsen']}]->(WhatDreamsMayCome),
  (CubaG)-[:ACTED_IN {roles:['Albert Lewis']}]->(WhatDreamsMayCome),
  (AnnabellaS)-[:ACTED_IN {roles:['Simon Bishop']}]->(WhatDreamsMayCome),
  (MaxS)-[:ACTED_IN {roles:['The Tracker']}]->(WhatDreamsMayCome),
  (WernerH)-[:ACTED_IN {roles:['The Face']}]->(WhatDreamsMayCome),
  (VincentW)-[:DIRECTED]->(WhatDreamsMayCome)

CREATE (SnowFallingonCedars {title:'Snow Falling on Cedars', released:1999, tagline:'First loves last. Forever.'})
CREATE (EthanH {name:'Ethan Hawke', born:1970})
CREATE (RickY {name:'Rick Yune', born:1971})
CREATE (ScottH {name:'Scott Hicks', born:1953})
CREATE (JamesC {name:'James Cromwell', born:1940})
CREATE
  (EthanH)-[:ACTED_IN {roles:['Ishmael Chambers']}]->(SnowFallingonCedars),
  (RickY)-[:ACTED_IN {roles:['Kazuo Miyamoto']}]->(SnowFallingonCedars),
  (MaxS)-[:ACTED_IN {roles:['Nels Gudmundsson']}]->(SnowFallingonCedars),
  (JamesC)-[:ACTED_IN {roles:['Judge Fielding']}]->(SnowFallingonCedars),
  (ScottH)-[:DIRECTED]->(SnowFallingonCedars)

CREATE (YouveGotMail {title:"You've Got Mail", released:1998, tagline:'At odds in life... in love on-line.'})
CREATE (ParkerP {name:'Parker Posey', born:1968})
CREATE (DaveC {name:'Dave Chappelle', born:1973})
CREATE (SteveZ {name:'Steve Zahn', born:1967})
CREATE (NoraE {name:'Nora Ephron', born:1941})
CREATE (TomH {name:'Tom Hanks', born:1956})
CREATE
  (TomH)-[:ACTED_IN {roles:['Joe Fox']}]->(YouveGotMail),
  (MegR)-[:ACTED_IN {roles:['Kathleen Kelly']}]->(YouveGotMail),
  (GregK)-[:ACTED_IN {roles:['Frank Navasky']}]->(YouveGotMail),
  (ParkerP)-[:ACTED_IN {roles:['Patricia Eden']}]->(YouveGotMail),
  (DaveC)-[:ACTED_IN {roles:['Kevin Jackson']}]->(YouveGotMail),
  (SteveZ)-[:ACTED_IN {roles:['George Pappas']}]->(YouveGotMail),
  (NoraE)-[:DIRECTED]->(YouveGotMail)

CREATE (SleeplessInSeattle {title:'Sleepless in Seattle', released:1993, tagline:'What if someone you never met, someone you never saw, someone you never knew was the only someone for you?'})
CREATE (RitaW {name:'Rita Wilson', born:1956})
CREATE (BillPull {name:'Bill Pullman', born:1953})
CREATE (VictorG {name:'Victor Garber', born:1949})
CREATE (RosieO {name:"Rosie O'Donnell", born:1962})
CREATE
  (TomH)-[:ACTED_IN {roles:['Sam Baldwin']}]->(SleeplessInSeattle),
  (MegR)-[:ACTED_IN {roles:['Annie Reed']}]->(SleeplessInSeattle),
  (RitaW)-[:ACTED_IN {roles:['Suzy']}]->(SleeplessInSeattle),
  (BillPull)-[:ACTED_IN {roles:['Walter']}]->(SleeplessInSeattle),
  (VictorG)-[:ACTED_IN {roles:['Greg']}]->(SleeplessInSeattle),
  (RosieO)-[:ACTED_IN {roles:['Becky']}]->(SleeplessInSeattle),
  (NoraE)-[:DIRECTED]->(SleeplessInSeattle)

CREATE (JoeVersustheVolcano {title:'Joe Versus the Volcano', released:1990, tagline:'A story of love, lava and burning desire.'})
CREATE (JohnS {name:'John Patrick Stanley', born:1950})
CREATE (Nathan {name:'Nathan Lane', born:1956})
CREATE
  (TomH)-[:ACTED_IN {roles:['Joe Banks']}]->(JoeVersustheVolcano),
  (MegR)-[:ACTED_IN {roles:['DeDe', 'Angelica Graynamore', 'Patricia Graynamore']}]->(JoeVersustheVolcano),
  (Nathan)-[:ACTED_IN {roles:['Baw']}]->(JoeVersustheVolcano),
  (JohnS)-[:DIRECTED]->(JoeVersustheVolcano)

CREATE (WhenHarryMetSally {title:'When Harry Met Sally', released:1998, tagline:'At odds in life... in love on-line.'})
CREATE (BillyC {name:'Billy Crystal', born:1948})
CREATE (CarrieF {name:'Carrie Fisher', born:1956})
CREATE (BrunoK {name:'Bruno Kirby', born:1949})
CREATE
  (BillyC)-[:ACTED_IN {roles:['Harry Burns']}]->(WhenHarryMetSally),
  (MegR)-[:ACTED_IN {roles:['Sally Albright']}]->(WhenHarryMetSally),
  (CarrieF)-[:ACTED_IN {roles:['Marie']}]->(WhenHarryMetSally),
  (BrunoK)-[:ACTED_IN {roles:['Jess']}]->(WhenHarryMetSally),
  (RobR)-[:DIRECTED]->(WhenHarryMetSally),
  (RobR)-[:PRODUCED]->(WhenHarryMetSally),
  (NoraE)-[:PRODUCED]->(WhenHarryMetSally),
  (NoraE)-[:WROTE]->(WhenHarryMetSally)

CREATE (ThatThingYouDo {title:'That Thing You Do', released:1996, tagline:'In every life there comes a time when that thing you dream becomes that thing you do'})
CREATE (LivT {name:'Liv Tyler', born:1977})
CREATE
  (TomH)-[:ACTED_IN {roles:['Mr. White']}]->(ThatThingYouDo),
  (LivT)-[:ACTED_IN {roles:['Faye Dolan']}]->(ThatThingYouDo),
  (Charlize)-[:ACTED_IN {roles:['Tina']}]->(ThatThingYouDo),
  (TomH)-[:DIRECTED]->(ThatThingYouDo)

CREATE (TheReplacements {title:'The Replacements', released:2000, tagline:'Pain heals, Chicks dig scars... Glory lasts forever'})
CREATE (Brooke {name:'Brooke Langton', born:1970})
CREATE (Gene {name:'Gene Hackman', born:1930})
CREATE (Orlando {name:'Orlando Jones', born:1968})
CREATE (Howard {name:'Howard Deutch', born:1950})
CREATE
  (Keanu)-[:ACTED_IN {roles:['Shane Falco']}]->(TheReplacements),
  (Brooke)-[:ACTED_IN {roles:['Annabelle Farrell']}]->(TheReplacements),
  (Gene)-[:ACTED_IN {roles:['Jimmy McGinty']}]->(TheReplacements),
  (Orlando)-[:ACTED_IN {roles:['Clifford Franklin']}]->(TheReplacements),
  (Howard)-[:DIRECTED]->(TheReplacements)

CREATE (RescueDawn {title:'RescueDawn', released:2006, tagline:"Based on the extraordinary true story of one man's fight for freedom"})
CREATE (ChristianB {name:'Christian Bale', born:1974})
CREATE (ZachG {name:'Zach Grenier', born:1954})
CREATE
  (MarshallB)-[:ACTED_IN {roles:['Admiral']}]->(RescueDawn),
  (ChristianB)-[:ACTED_IN {roles:['Dieter Dengler']}]->(RescueDawn),
  (ZachG)-[:ACTED_IN {roles:['Squad Leader']}]->(RescueDawn),
  (SteveZ)-[:ACTED_IN {roles:['Duane']}]->(RescueDawn),
  (WernerH)-[:DIRECTED]->(RescueDawn)

CREATE (TheBirdcage {title:'The Birdcage', released:1996, tagline:'Come as you are'})
CREATE (MikeN {name:'Mike Nichols', born:1931})
CREATE
  (Robin)-[:ACTED_IN {roles:['Armand Goldman']}]->(TheBirdcage),
  (Nathan)-[:ACTED_IN {roles:['Albert Goldman']}]->(TheBirdcage),
  (Gene)-[:ACTED_IN {roles:['Sen. Kevin Keeley']}]->(TheBirdcage),
  (MikeN)-[:DIRECTED]->(TheBirdcage)

CREATE (Unforgiven {title:'Unforgiven', released:1992, tagline:"It's a hell of a thing, killing a man"})
CREATE (RichardH {name:'Richard Harris', born:1930})
CREATE (ClintE {name:'Clint Eastwood', born:1930})
CREATE
  (RichardH)-[:ACTED_IN {roles:['English Bob']}]->(Unforgiven),
  (ClintE)-[:ACTED_IN {roles:['Bill Munny']}]->(Unforgiven),
  (Gene)-[:ACTED_IN {roles:['Little Bill Daggett']}]->(Unforgiven),
  (ClintE)-[:DIRECTED]->(Unforgiven)

CREATE (JohnnyMnemonic {title:'Johnny Mnemonic', released:1995, tagline:'The hottest data on earth. In the coolest head in town'})
CREATE (Takeshi {name:'Takeshi Kitano', born:1947})
CREATE (Dina {name:'Dina Meyer', born:1968})
CREATE (IceT {name:'Ice-T', born:1958})
CREATE (RobertL {name:'Robert Longo', born:1953})
CREATE
  (Keanu)-[:ACTED_IN {roles:['Johnny Mnemonic']}]->(JohnnyMnemonic),
  (Takeshi)-[:ACTED_IN {roles:['Takahashi']}]->(JohnnyMnemonic),
  (Dina)-[:ACTED_IN {roles:['Jane']}]->(JohnnyMnemonic),
  (IceT)-[:ACTED_IN {roles:['J-Bone']}]->(JohnnyMnemonic),
  (RobertL)-[:DIRECTED]->(JohnnyMnemonic)

CREATE (CloudAtlas {title:'Cloud Atlas', released:2012, tagline:'Everything is connected'})
CREATE (HalleB {name:'Halle Berry', born:1966})
CREATE (JimB {name:'Jim Broadbent', born:1949})
CREATE (TomT {name:'Tom Tykwer', born:1965})
CREATE
  (TomH)-[:ACTED_IN {roles:['Zachry', 'Dr. Henry Goose', 'Isaac Sachs', 'Dermot Hoggins']}]->(CloudAtlas),
  (Hugo)-[:ACTED_IN {roles:['Bill Smoke', 'Haskell Moore', 'Tadeusz Kesselring', 'Nurse Noakes', 'Boardman Mephi', 'Old Georgie']}]->(CloudAtlas),
  (HalleB)-[:ACTED_IN {roles:['Luisa Rey', 'Jocasta Ayrs', 'Ovid', 'Meronym']}]->(CloudAtlas),
  (JimB)-[:ACTED_IN {roles:['Vyvyan Ayrs', 'Captain Molyneux', 'Timothy Cavendish']}]->(CloudAtlas),
  (TomT)-[:DIRECTED]->(CloudAtlas),
  (AndyW)-[:DIRECTED]->(CloudAtlas),
  (LanaW)-[:DIRECTED]->(CloudAtlas)

CREATE (TheDaVinciCode {title:'The Da Vinci Code', released:2006, tagline:'Break The Codes'})
CREATE (IanM {name:'Ian McKellen', born:1939})
CREATE (AudreyT {name:'Audrey Tautou', born:1976})
CREATE (PaulB {name:'Paul Bettany', born:1971})
CREATE (RonH {name:'Ron Howard', born:1954})
CREATE
  (TomH)-[:ACTED_IN {roles:['Dr. Robert Langdon']}]->(TheDaVinciCode),
  (IanM)-[:ACTED_IN {roles:['Sir Leight Teabing']}]->(TheDaVinciCode),
  (AudreyT)-[:ACTED_IN {roles:['Sophie Neveu']}]->(TheDaVinciCode),
  (PaulB)-[:ACTED_IN {roles:['Silas']}]->(TheDaVinciCode),
  (RonH)-[:DIRECTED]->(TheDaVinciCode)

CREATE (VforVendetta {title:'V for Vendetta', released:2006, tagline:'Freedom! Forever!'})
CREATE (NatalieP {name:'Natalie Portman', born:1981})
CREATE (StephenR {name:'Stephen Rea', born:1946})
CREATE (JohnH {name:'John Hurt', born:1940})
CREATE (BenM {name: 'Ben Miles', born:1967})
CREATE
  (Hugo)-[:ACTED_IN {roles:['V']}]->(VforVendetta),
  (NatalieP)-[:ACTED_IN {roles:['Evey Hammond']}]->(VforVendetta),
  (StephenR)-[:ACTED_IN {roles:['Eric Finch']}]->(VforVendetta),
  (JohnH)-[:ACTED_IN {roles:['High Chancellor Adam Sutler']}]->(VforVendetta),
  (BenM)-[:ACTED_IN {roles:['Dascomb']}]->(VforVendetta),
  (JamesM)-[:DIRECTED]->(VforVendetta),
  (AndyW)-[:PRODUCED]->(VforVendetta),
  (LanaW)-[:PRODUCED]->(VforVendetta),
  (JoelS)-[:PRODUCED]->(VforVendetta),
  (AndyW)-[:WROTE]->(VforVendetta),
  (LanaW)-[:WROTE]->(VforVendetta)

CREATE (SpeedRacer {title:'Speed Racer', released:2008, tagline:'Speed has no limits'})
CREATE (EmileH {name:'Emile Hirsch', born:1985})
CREATE (JohnG {name:'John Goodman', born:1960})
CREATE (SusanS {name:'Susan Sarandon', born:1946})
CREATE (MatthewF {name:'Matthew Fox', born:1966})
CREATE (ChristinaR {name:'Christina Ricci', born:1980})
CREATE (Rain {name:'Rain', born:1982})
CREATE
  (EmileH)-[:ACTED_IN {roles:['Speed Racer']}]->(SpeedRacer),
  (JohnG)-[:ACTED_IN {roles:['Pops']}]->(SpeedRacer),
  (SusanS)-[:ACTED_IN {roles:['Mom']}]->(SpeedRacer),
  (MatthewF)-[:ACTED_IN {roles:['Racer X']}]->(SpeedRacer),
  (ChristinaR)-[:ACTED_IN {roles:['Trixie']}]->(SpeedRacer),
  (Rain)-[:ACTED_IN {roles:['Taejo Togokahn']}]->(SpeedRacer),
  (BenM)-[:ACTED_IN {roles:['Cass Jones']}]->(SpeedRacer),
  (AndyW)-[:DIRECTED]->(SpeedRacer),
  (LanaW)-[:DIRECTED]->(SpeedRacer),
  (AndyW)-[:WROTE]->(SpeedRacer),
  (LanaW)-[:WROTE]->(SpeedRacer),
  (JoelS)-[:PRODUCED]->(SpeedRacer)

CREATE (NinjaAssassin {title:'Ninja Assassin', released:2009, tagline:'Prepare to enter a secret world of assassins'})
CREATE (NaomieH {name:'Naomie Harris'})
CREATE
  (Rain)-[:ACTED_IN {roles:['Raizo']}]->(NinjaAssassin),
  (NaomieH)-[:ACTED_IN {roles:['Mika Coretti']}]->(NinjaAssassin),
  (RickY)-[:ACTED_IN {roles:['Takeshi']}]->(NinjaAssassin),
  (BenM)-[:ACTED_IN {roles:['Ryan Maslow']}]->(NinjaAssassin),
  (JamesM)-[:DIRECTED]->(NinjaAssassin),
  (AndyW)-[:PRODUCED]->(NinjaAssassin),
  (LanaW)-[:PRODUCED]->(NinjaAssassin),
  (JoelS)-[:PRODUCED]->(NinjaAssassin)

CREATE (TheGreenMile {title:'The Green Mile', released:1999, tagline:"Walk a mile you'll never forget."})
CREATE (MichaelD {name:'Michael Clarke Duncan', born:1957})
CREATE (DavidM {name:'David Morse', born:1953})
CREATE (SamR {name:'Sam Rockwell', born:1968})
CREATE (GaryS {name:'Gary Sinise', born:1955})
CREATE (PatriciaC {name:'Patricia Clarkson', born:1959})
CREATE (FrankD {name:'Frank Darabont', born:1959})
CREATE
  (TomH)-[:ACTED_IN {roles:['Paul Edgecomb']}]->(TheGreenMile),
  (MichaelD)-[:ACTED_IN {roles:['John Coffey']}]->(TheGreenMile),
  (DavidM)-[:ACTED_IN {roles:['Brutus "Brutal" Howell']}]->(TheGreenMile),
  (BonnieH)-[:ACTED_IN {roles:['Jan Edgecomb']}]->(TheGreenMile),
  (JamesC)-[:ACTED_IN {roles:['Warden Hal Moores']}]->(TheGreenMile),
  (SamR)-[:ACTED_IN {roles:['"Wild Bill" Wharton']}]->(TheGreenMile),
  (GaryS)-[:ACTED_IN {roles:['Burt Hammersmith']}]->(TheGreenMile),
  (PatriciaC)-[:ACTED_IN {roles:['Melinda Moores']}]->(TheGreenMile),
  (FrankD)-[:DIRECTED]->(TheGreenMile)

CREATE (FrostNixon {title:'Frost/Nixon', released:2008, tagline:'400 million people were waiting for the truth.'})
CREATE (FrankL {name:'Frank Langella', born:1938})
CREATE (MichaelS {name:'Michael Sheen', born:1969})
CREATE (OliverP {name:'Oliver Platt', born:1960})
CREATE
  (FrankL)-[:ACTED_IN {roles:['Richard Nixon']}]->(FrostNixon),
  (MichaelS)-[:ACTED_IN {roles:['David Frost']}]->(FrostNixon),
  (KevinB)-[:ACTED_IN {roles:['Jack Brennan']}]->(FrostNixon),
  (OliverP)-[:ACTED_IN {roles:['Bob Zelnick']}]->(FrostNixon),
  (SamR)-[:ACTED_IN {roles:['James Reston, Jr.']}]->(FrostNixon),
  (RonH)-[:DIRECTED]->(FrostNixon)

CREATE (Hoffa {title:'Hoffa', released:1992, tagline:"He didn't want law. He wanted justice."})
CREATE (DannyD {name:'Danny DeVito', born:1944})
CREATE (JohnR {name:'John C. Reilly', born:1965})
CREATE
  (JackN)-[:ACTED_IN {roles:['Hoffa']}]->(Hoffa),
  (DannyD)-[:ACTED_IN {roles:['Robert "Bobby" Ciaro']}]->(Hoffa),
  (JTW)-[:ACTED_IN {roles:['Frank Fitzsimmons']}]->(Hoffa),
  (JohnR)-[:ACTED_IN {roles:['Peter "Pete" Connelly']}]->(Hoffa),
  (DannyD)-[:DIRECTED]->(Hoffa)

CREATE (Apollo13 {title:'Apollo 13', released:1995, tagline:'Houston, we have a problem.'})
CREATE (EdH {name:'Ed Harris', born:1950})
CREATE (BillPax {name:'Bill Paxton', born:1955})
CREATE
  (TomH)-[:ACTED_IN {roles:['Jim Lovell']}]->(Apollo13),
  (KevinB)-[:ACTED_IN {roles:['Jack Swigert']}]->(Apollo13),
  (EdH)-[:ACTED_IN {roles:['Gene Kranz']}]->(Apollo13),
  (BillPax)-[:ACTED_IN {roles:['Fred Haise']}]->(Apollo13),
  (GaryS)-[:ACTED_IN {roles:['Ken Mattingly']}]->(Apollo13),
  (RonH)-[:DIRECTED]->(Apollo13)

CREATE (Twister {title:'Twister', released:1996, tagline:"Don't Breathe. Don't Look Back."})
CREATE (PhilipH {name:'Philip Seymour Hoffman', born:1967})
CREATE (JanB {name:'Jan de Bont', born:1943})
CREATE
  (BillPax)-[:ACTED_IN {roles:['Bill Harding']}]->(Twister),
  (HelenH)-[:ACTED_IN {roles:['Dr. Jo Harding']}]->(Twister),
  (ZachG)-[:ACTED_IN {roles:['Eddie']}]->(Twister),
  (PhilipH)-[:ACTED_IN {roles:['Dustin "Dusty" Davis']}]->(Twister),
  (JanB)-[:DIRECTED]->(Twister)

CREATE (CastAway {title:'Cast Away', released:2000, tagline:'At the edge of the world, his journey begins.'})
CREATE (RobertZ {name:'Robert Zemeckis', born:1951})
CREATE
  (TomH)-[:ACTED_IN {roles:['Chuck Noland']}]->(CastAway),
  (HelenH)-[:ACTED_IN {roles:['Kelly Frears']}]->(CastAway),
  (RobertZ)-[:DIRECTED]->(CastAway)

CREATE (OneFlewOvertheCuckoosNest {title:"One Flew Over the Cuckoo's Nest", released:1975, tagline:"If he's crazy, what does that make you?"})
CREATE (MilosF {name:'Milos Forman', born:1932})
CREATE
  (JackN)-[:ACTED_IN {roles:['Randle McMurphy']}]->(OneFlewOvertheCuckoosNest),
  (DannyD)-[:ACTED_IN {roles:['Martini']}]->(OneFlewOvertheCuckoosNest),
  (MilosF)-[:DIRECTED]->(OneFlewOvertheCuckoosNest)

CREATE (SomethingsGottaGive {title:"Something's Gotta Give", released:1975})
CREATE (DianeK {name:'Diane Keaton', born:1946})
CREATE (NancyM {name:'Nancy Meyers', born:1949})
CREATE
  (JackN)-[:ACTED_IN {roles:['Harry Sanborn']}]->(SomethingsGottaGive),
  (DianeK)-[:ACTED_IN {roles:['Erica Barry']}]->(SomethingsGottaGive),
  (Keanu)-[:ACTED_IN {roles:['Julian Mercer']}]->(SomethingsGottaGive),
  (NancyM)-[:DIRECTED]->(SomethingsGottaGive),
  (NancyM)-[:PRODUCED]->(SomethingsGottaGive),
  (NancyM)-[:WROTE]->(SomethingsGottaGive)

CREATE (BicentennialMan {title:'Bicentennial Man', released:1999, tagline:"One robot's 200 year journey to become an ordinary man."})
CREATE (ChrisC {name:'Chris Columbus', born:1958})
CREATE
  (Robin)-[:ACTED_IN {roles:['Andrew Marin']}]->(BicentennialMan),
  (OliverP)-[:ACTED_IN {roles:['Rupert Burns']}]->(BicentennialMan),
  (ChrisC)-[:DIRECTED]->(BicentennialMan)

CREATE (CharlieWilsonsWar {title:"Charlie Wilson's War", released:2007, tagline:"A stiff drink. A little mascara. A lot of nerve. Who said they couldn't bring down the Soviet empire."})
CREATE (JuliaR {name:'Julia Roberts', born:1967})
CREATE
  (TomH)-[:ACTED_IN {roles:['Rep. Charlie Wilson']}]->(CharlieWilsonsWar),
  (JuliaR)-[:ACTED_IN {roles:['Joanne Herring']}]->(CharlieWilsonsWar),
  (PhilipH)-[:ACTED_IN {roles:['Gust Avrakotos']}]->(CharlieWilsonsWar),
  (MikeN)-[:DIRECTED]->(CharlieWilsonsWar)

CREATE (ThePolarExpress {title:'The Polar Express', released:2004, tagline:'This Holiday Season… Believe'})
CREATE
  (TomH)-[:ACTED_IN {roles:['Hero Boy', 'Father', 'Conductor', 'Hobo', 'Scrooge', 'Santa Claus']}]->(ThePolarExpress),
  (RobertZ)-[:DIRECTED]->(ThePolarExpress)

CREATE (ALeagueofTheirOwn {title:'A League of Their Own', released:1992, tagline:'Once in a lifetime you get a chance to do something different.'})
CREATE (Madonna {name:'Madonna', born:1954})
CREATE (GeenaD {name:'Geena Davis', born:1956})
CREATE (LoriP {name:'Lori Petty', born:1963})
CREATE (PennyM {name:'Penny Marshall', born:1943})
CREATE
  (TomH)-[:ACTED_IN {roles:['Jimmy Dugan']}]->(ALeagueofTheirOwn),
  (GeenaD)-[:ACTED_IN {roles:['Dottie Hinson']}]->(ALeagueofTheirOwn),
  (LoriP)-[:ACTED_IN {roles:['Kit Keller']}]->(ALeagueofTheirOwn),
  (RosieO)-[:ACTED_IN {roles:['Doris Murphy']}]->(ALeagueofTheirOwn),
  (Madonna)-[:ACTED_IN {roles:['"All the Way" Mae Mordabito']}]->(ALeagueofTheirOwn),
  (BillPax)-[:ACTED_IN {roles:['Bob Hinson']}]->(ALeagueofTheirOwn),
  (PennyM)-[:DIRECTED]->(ALeagueofTheirOwn)

CREATE (PaulBlythe {name:'Paul Blythe'})
CREATE (AngelaScope {name:'Angela Scope'})
CREATE (JessicaThompson {name:'Jessica Thompson'})
CREATE (JamesThompson {name:'James Thompson'})

CREATE
  (JamesThompson)-[:FOLLOWS]->(JessicaThompson),
  (AngelaScope)-[:FOLLOWS]->(JessicaThompson),
  (PaulBlythe)-[:FOLLOWS]->(AngelaScope)

CREATE
  (JessicaThompson)-[:REVIEWED {summary:'An amazing journey', rating:95}]->(CloudAtlas),
  (JessicaThompson)-[:REVIEWED {summary:'Silly, but fun', rating:65}]->(TheReplacements),
  (JamesThompson)-[:REVIEWED {summary:'The coolest football movie ever', rating:100}]->(TheReplacements),
  (AngelaScope)-[:REVIEWED {summary:'Pretty funny at times', rating:62}]->(TheReplacements),
  (JessicaThompson)-[:REVIEWED {summary:'Dark, but compelling', rating:85}]->(Unforgiven),
  (JessicaThompson)-[:REVIEWED {summary:"Slapstick redeemed only by the Robin Williams and Gene Hackman's stellar performances", rating:45}]->(TheBirdcage),
  (JessicaThompson)-[:REVIEWED {summary:'A solid romp', rating:68}]->(TheDaVinciCode),
  (JamesThompson)-[:REVIEWED {summary:'Fun, but a little far fetched', rating:65}]->(TheDaVinciCode)

RETURN ID(TheMatrix);