//
//  ActivitiesMaleIT.swift
//  API
//
//  Created by Valentina Russo on 07/03/23.
//

import Foundation

extension APIService {
    internal static let activitiesMaleIT: [ActivityAPI] = [
        .init(id: 1,
              name: "Mi passi quello?",
              description: """
                Sistemate gli oggetti scelti su un tavolo. Seduti di fronte al bambino, chiedetegli di passarvi un oggetto pronunciandone chiaramente il nome.
                
                Non preoccupatevi se non risponde o se fa fatica, potete aiutarlo indicando l'oggetto in questione o guidando le sue mani direttamente su di esso, puntando sempre più a ridurre l'uso di questi aiuti.
                
                Dopo ogni esercizio riuscito, dategli un rinforzo positivo, anche se lo avete guidato fisicamente.
                
                Infine, prima di ripetere l'esercizio, ripetete il nome dell'oggetto in questione per rafforzare l'associazione. Ricordate di parlare sempre molto chiaramente.
                
                Ripetete questo esercizio più volte, ma ricordate di cambiare l'ordine degli oggetti sul tavolo.
                
                Alla fine della sessione potete premiarlo con caramelle o con un premio più sostanzioso a sua scelta.
                """,
              tips: ["Il numero di oggetti dipende da voi, potete iniziare con 1 o 2 e salire, più oggetti ci sono, più è difficile.",
                     "Evitare oggetti con una pronuncia simile nella stessa sessione.",
                     "Il tavolo dove si svolge l'attività deve essere possibilmente libero da distrazioni e rumori.",
                     "All'inizio è normale che il bambino sia confuso. Iniziate a dargli suggerimenti fisici, guidando la sua mano verso l'oggetto giusto, poi provate a ridurre il supporto passo dopo passo."],
              need: "Oggetti di forma, dimensione e colore diversi. Preferibilmente oggetti che il bambino conosce bene, anche se non ne sa il nome.",
              difficult: .init(receptive: 3, expressive: 1, problemSolving: 1, fineMotory: 1),
              categories: .init(arrayLiteral: .receptive)),
        .init(id: 2,
              name: "Abbinamento degli oggetti",
              description: """
                    Disporre gli oggetti scelti sul tavolo, uno solo per ogni tipo. Seduti di fronte al bambino, passategli uno degli oggetti e chiedetegli chiaramente di abbinarlo a quello identico già presente sul tavolo.
                    
                    Non preoccupatevi se il bambino non risponde o fa fatica, potete aiutarlo indicandogli l'oggetto giusto o guidando le sue mani direttamente su di esso, puntando sempre più a ridurre l'uso di questi ausili.
                    
                     Dopo ogni tentativo riuscito, dategli un rinforzo positivo, anche se lo avete     guidato fisicamente.
                    
                    Continuate a passare al bambino altri oggetti finché non sono tutti accoppiati.
                    
                    Infine, prima di ripetere l'esercizio, cambiate l'ordine degli oggetti sul tavolo. Si consiglia di ripetere questo processo almeno 5 volte.
                    
                    Alla fine della sessione potete premiarlo con caramelle o con una ricompensa più sostanziosa a sua scelta.
                    """,
              tips: ["Il numero di oggetti dipende da voi, potete iniziare con 2 o 3 e salire, più oggetti ci sono, più è difficile.",
                     "Evitare oggetti simili durante la stessa sessione.",
                     "Il tavolo dove si svolge l'attività deve essere possibilmente libero da distrazioni e rumori.",
                     "All'inizio è normale che il bambino sia confuso. Iniziate a dargli suggerimenti fisici, guidando la sua mano verso l'oggetto giusto, poi provate a ridurre il supporto passo dopo passo."],
              need: "Oggetti che variano per forma, dimensione e colore, di cui si hanno 2 copie.",
              difficult: .init(receptive: 1, expressive: 1, problemSolving: 3, fineMotory: 1),
              categories: .init(arrayLiteral: .problemSolving)),
        .init(id: 3,
              name: "Manualità con le mollette",
              description: """
                    Iniziate mettendo i batuffoli di cotone in uno dei due contenitori e posizionandoli sul tavolo. L'obiettivo di questa attività è usare la molletta per trasferire i batuffoli di cotone da un contenitore all'altro.
                    
                    Per iniziare, dite chiaramente al bambino cosa deve fare. Potete anche mostrargli come si fa, facendolo voi per primi.
                    
                    Se il bambino ha difficoltà a tenere correttamente la molletta, aiutatelo posizionando le dita nel modo corretto e tenendogli le mani mentre svolge l'attività. Poi cercate di dargli gradualmente più autonomia.
                    
                    Ogni volta che il bambino riesce a svuotare il contenitore, dategli un rinforzo positivo, anche se lo avete guidato fisicamente.
                    
                    Alla fine della sessione potete ricompensare il bambino con dei dolcetti o con un premio più sostanzioso a sua scelta.
                    """,
              tips: ["Il numero di batuffoli di cotone dipende da voi, potete iniziare con 2 o 3 e aumentare. Più ce ne sono, più sarà difficile mantenere la concentrazione.",
                     "Il tavolo dove si svolge l'attività deve essere possibilmente libero da distrazioni e rumori.",
                     "All'inizio è normale che il bambino sia confuso. Iniziate a dargli suggerimenti fisici, guidando la sua mano e facendo pressione sulla molletta per farla aprire, poi provate a ridurre il supporto passo dopo passo."],
              need: "Due piccoli contenitori, una molletta da bucato e diversi piccoli batuffoli di cotone, meglio se colorati",
              difficult: .init(receptive: 3, expressive: 1, problemSolving: 1, fineMotory: 3),
              categories: .init(arrayLiteral: .fineMotory)),
        .init(id: 4,
              name: "Pregrafismo",
              description: """
                    Per iniziare, è meglio partire dalle singole lettere. Sedetevi a tavola con il vostro bambino e dite chiaramente quale lettera intendete esercitare questa volta.
                    
                    Se il bambino ha difficoltà, non abbiate paura di aiutarlo guidando la sua mano mentre svolge l'attività, poi iniziate a ridurre l'aiuto quando si sentirà più sicuro.
                    
                    Dopo ogni riga di lettere, dategli una ricompensa verbale/fisica, ad esempio con complimenti e/o un cinque.
                    
                    Alla fine della sessione si può premiare il bambino con dolci o con un premio più sostanzioso a sua scelta.
                    """,
              tips: ["Iniziate con le lettere singole, poi, se il bambino è in grado di farlo, passate alle parole brevi.",
                     "Il tavolo dove si svolge l'attività deve essere possibilmente libero da distrazioni e rumori.",
                     "Si consiglia di iniziare con le lettere maiuscole"],
              need: "Qualche foglio di pregrafismo che potete facilmente stampare da internet",
              difficult: .init(receptive: 1, expressive: 1, problemSolving: 6, fineMotory: 12),
              categories: .init(arrayLiteral: .fineMotory)),
        .init(id: 5,
              name: "Categorizzazione",
              description: """
                    Per prima cosa spieghiamo al bambino come svolgere l'attività, illustrando chiaramente le categorie in cui dobbiamo suddividere le immagini.
                    
                    Si inizia con un primo giro in cui si dimostra l'esercizio in prima persona, descrivendo chiaramente cosa si sta facendo, per fargli capire il meccanismo.
                    
                    Quando è il turno del bambino, mostrategli l'immagine successiva e pronunciatene il nome ad alta voce. Se il bambino ha difficoltà, aiutatelo guidando la mano nel punto giusto. È importante prevenire gli errori: se il bambino sbaglia, correggetelo.
                    
                    Quando il bambino sarà più sicuro di sé, potrete iniziare a indicargli la categoria giusta invece di guidare le sue mani. Ma non preoccupatevi se questo non avviene durante le prime sessioni, può richiedere del tempo. Alla fine provate a non dare alcun suggerimento.
                    
                    Alla fine della sessione si può premiare il bambino con dolci o con un premio più sostanzioso a sua scelta.
                    """,
              tips: ["Una volta che il bambino sarà abile in questa attività, si può provare ad allenare anche le abilità linguistiche, se ne ha la capacità. Ad esempio, chiedendo il nome dell'immagine e a quale categoria appartiene.",
                     "Il tavolo dove si svolge l'attività deve essere possibilmente libero da distrazioni e rumori.",
                     "Più sono le categorie, più è difficile. Iniziate con 2 o 3 e poi aggiungetene altre per le sessioni successive.",
                     "È importante che le categorie siano molto diverse tra loro."],
              need: "Alcune immagini/foto che raffigurano cose che possono essere raggruppate in categorie (vestiti, animali, cibo, luoghi, parti del corpo, ecc.).",
              difficult: .init(receptive: 6, expressive: 1, problemSolving: 12, fineMotory: 1),
              categories: .init(arrayLiteral: .problemSolving)),
        .init(id: 6,
              name: "Manualità con i tappi",
              description: """
                    L'obiettivo dell'attività è quello di riuscire a prendere i tappi di bottiglia da un contenitore e inserirli nel foro praticato sul coperchio del secondo contenitore.

                    Posizionare il contenitore con il tappo sul lato sinistro del bambino (destro se è mancino) e l'altro sul lato destro, in una posizione comoda.

                    Per la prima volta potete iniziare a mostrare voi stessi l'attività, spiegandogli cosa fare.

                    Quando è il turno del bambino, se fa fatica, si può iniziare a guidare le sue mani verso i tappi e verso il buco. Potete anche iniziare passandogli i tappi la prima volta.

                    In seguito, cercate di ridurre sempre di più l'aiuto fornito, fino al punto in cui può farlo da solo.
                    Alla fine della sessione si può premiare il bambino con dolci o con un premio più sostanzioso a sua scelta.
                    """,
              tips: ["Questa attività è molto utile anche per allenare la capacità di concentrazione. Se il bambino ha difficoltà a rimanere concentrato, iniziate con un piccolo numero di tappi, anche solo uno. Poi fate l'attività e premiatelo subito dopo. La volta successiva si può aumentare il numero di tappi.",
                     "Il tavolo dove si svolge l'attività deve essere possibilmente libero da distrazioni e rumori."],
              need: "2 piccoli contenitori, di cui uno con un foro sul coperchio abbastanza grande da far passare un tappo di bottiglia, e vari tappi di bottiglia",
              difficult: .init(receptive: 3, expressive: 1, problemSolving: 1, fineMotory: 3),
              categories: .init(arrayLiteral: .problemSolving)),
        .init(id: 7,
              name: "Manualità con le bottiglie",
              description: """
                    Posizionare un contenitore con i tappi sul tavolo, alla sinistra del bambino. L'obiettivo dell'attività è riconoscere quale tappo va su quale bottiglia e avvitarlo al posto giusto.

                    Per la prima volta potete iniziare mostrando voi stessi l'attività, spiegando al bambino cosa fare.
                    Quando è il turno del bambino, passategli una bottiglia. Se ha difficoltà a capire quale tappo usare, potete indicargli o passargli quello corretto. Se necessario, guidate le mani del bambino nel movimento di avvitamento.

                    Alla fine della sessione si può premiare il bambino con dolci o con un premio più sostanzioso a sua scelta.
                    """,
              tips: ["Questa attività è molto utile anche per allenare la capacità di concentrazione. Se il bambino ha difficoltà a rimanere concentrato, iniziate con un numero ridotto di bottiglie, anche solo una. Poi fate l'attività e premiatelo subito dopo. La volta successiva si può aumentare il numero di bottiglie.",
                     "Il tavolo dove si svolge l'attività deve essere possibilmente libero da distrazioni e rumori.",
                     "Utilizzate diversi tipi di bottiglie, ad esempio quelli dei detersivi, dopo averli puliti."],
              need: "Diverse bottiglie di varie dimensioni e i relativi tappi",
              difficult: .init(receptive: 1, expressive: 1, problemSolving: 1, fineMotory: 6),
              categories: .init(arrayLiteral: .fineMotory)),
        .init(id: 8,
              name: "Dividere per forma",
              description: """
                    Per prima cosa spieghiamo al bambino come svolgere l'attività, illustrando chiaramente le categorie in cui dobbiamo dividere le forme.

                    Si inizia con un primo giro in cui si dimostra l’attività, descrivendo chiaramente cosa si sta facendo, per far capire al bambino il meccanismo.

                    Quando è il turno del bambino, mostrategli l'immagine successiva e chiedetegli di collocarla nelle categorie corrette. Se il bambino ha difficoltà, aiutatelo guidando la mano al posto giusto. È importante prevenire gli errori: se il bambino sbaglia, correggetelo.

                    Quando sarà più sicuro di sé, potrete iniziare a indicargli la categoria giusta invece di guidare le sue mani. Ma non preoccupatevi se questo non avviene durante le prime sessioni, potrebbe richiedere del tempo. Alla fine provate a non dare alcun suggerimento.

                    Alla fine della sessione si può premiare il bambino con dolci o con un premio più sostanzioso a sua scelta.
                    """,
              tips: ["All'inizio cercate di evitare forme troppo simili, ad esempio rettangoli e quadrati.", "Più forme ci sono, più sarà difficile."],
              need: "Alcune immagini che ritraggono semplici forme geometriche (cerchio, triangolo, quadrato, ecc.)",
              difficult: .init(receptive: 3, expressive: 1, problemSolving: 6, fineMotory: 1),
              categories: .init(arrayLiteral: .problemSolving)),
        .init(id: 9,
              name: "Manualità coi braccialetti",
              description: """
                    Per iniziare, mostriamo al bambino come svolgere l'attività.

                    Quando è il turno del bambino, se ne ha bisogno, aiutatelo guidando le sue mani. Se il bambino ha difficoltà, potete fare un nodo allo spago per mostrargli dove mettere le mani.

                    Iniziate con una piccola quantità di perline, poi cercate di aumentarne il numero.

                    Alla fine della sessione potete premiarlo con caramelle o con un premio più sostanzioso a sua scelta.
                    """,
              tips: ["Provate a utilizzare questa attività per realizzare dei braccialetti per il bambino, in questo modo potrà sentirsi più gratificato.",
                     "Se il bambino ha difficoltà a rimanere concentrato, diminuite il numero di perline necessarie per ottenere la ricompensa, con l'obiettivo di usare più perline la volta successiva."],
              need: "Uno spago e perline di vari colori, meglio se di grandi dimensioni.",
              difficult: .init(receptive: 3, expressive: 1, problemSolving: 3, fineMotory: 6),
              categories: .init(arrayLiteral: .fineMotory)),
        .init(id: 10,
              name: "Gioco dell'imitazione",
              description: """
                    L'obiettivo di questa attività è far replicare al bambino uno schema di cubi    colorati.

                     Componete una prima figura che il bambino dovrà copiare, iniziate con forme semplici, ad esempio una linea, e concentratevi sui colori.
                    Partite con 2 o 3 colori, in modo che il bambino possa iniziare a capire il compito.

                    Se il bambino ha difficoltà a capire quale colore usare, aiutatelo indicando quello giusto o passandoglielo.

                    Cercate di non permettere errori, se il bambino sceglie il colore sbagliato o sta facendo la forma sbagliata, correggetelo,

                    Alla fine della sessione si può premiare il bambino con dolci o con un premio più sostanzioso a sua scelta.
                    """,
              tips: ["Più sono i colori utilizzati, più sarà impegnativo.",
                     "Se l'attività è troppo semplice per lui, si può provare a cambiare la forma con una più complessa."],
              need: "Cubi colorati",
              difficult: .init(receptive: 3, expressive: 1, problemSolving: 6, fineMotory: 3),
              categories: .init(arrayLiteral: .problemSolving)),
        .init(id: 11,
              name: "Dividere per colore",
              description: """
                    Si inizia mettendo sul tavolo 3 immagini, una per ogni colore scelto (il numero può variare a seconda della difficoltà).

                    Per prima cosa spieghiamo al bambino come svolgere l'attività, illustrando chiaramente come dividere gli oggetti in categorie di colori.

                    Si inizia con un primo giro in cui si dimostra l'esercizio in prima persona, descrivendo chiaramente cosa si sta facendo, per far capire al bambino il meccanismo.

                    Quando è il turno del bambino, mostrategli l'immagine successiva e chiedetegli di collocarla nelle categorie corrette. Se il bambino ha difficoltà, aiutatelo guidando la mano al posto giusto. È importante prevenire gli errori: se il bambino sbaglia, correggetelo.

                    Quando il bambino sarà più sicuro di sé, potrete iniziare a indicargli la categoria giusta invece di guidare le sue mani. Ma non preoccupatevi se questo non avviene durante le prime sessioni, potrebbe richiedere del tempo. Alla fine provate a non dare alcun suggerimento.

                    Alla fine della sessione si può premiare il bambino con dei dolci o con una ricompensa più sostanziosa a sua scelta.
                    """,
              tips: ["Più sono i colori utilizzati, più sarà impegnativo.",
                     "Si può utilizzare questa attività anche per far conoscere al bambino l'oggetto raffigurato nell'immagine, se non sa di cosa si tratta."],
              need: "Alcune immagini che ritraggono oggetti di colori diversi (vestiti, giocattoli, animali, veicoli, ecc.)",
              difficult: .init(receptive: 1, expressive: 1, problemSolving: 6, fineMotory: 1),
              categories: .init(arrayLiteral: .problemSolving)),
        .init(id: 12,
              name: "Scatola delle forme",
              description: """
                    Chiedete al bambino di inserire ogni forma nel foro corrispondente.

                    Prima guidando in modo molto invasivo, poi lasciando gradualmente che il bambino faccia da solo.

                    Alla fine, quando il bambino ha intascato correttamente ogni forma, fornire un rinforzo.
                    """,
              tips: ["Fate attenzione a posizionarvi in modo da poter intervenire comodamente sulla mano del bambino per guidarlo facilmente.",
                     "Se non si dispone di una scatola di forme, si può fare una variante utilizzando un puzzle con pezzi a incastro (non un normale puzzle)."],
              need: "Una scatola delle forme",
              difficult: .init(receptive: 1, expressive: 1, problemSolving: 3, fineMotory: 3),
              categories: .init(arrayLiteral: .problemSolving, .fineMotory)),
        .init(id: 13,
              name: "Le parti del corpo",
              description: """
                    Scegliete 3 parti del corpo che il bambino non riconosce nelle altre persone (ad esempio, spalla, collo e petto). Sedetevi uno di fronte all'altro e spiegate l'obiettivo dell'attività.
                    Dite al bambino, per esempio: "toccami il collo" e guidate la sua mano verso la parte corretta, dandogli dei rinforzi verbali alla fine di ogni ripetizione.
                    Ripetere 10 volte per ogni parte del corpo selezionata, alternando le varie parti del corpo che avete deciso di utilizzare.
                    Cercate di    ridurre gradualmente la    quantità di assistenza fornita. Al termine dell'attività si potrà fornire un rinforzo a sua scelta.
                    """,
              tips: ["Fate attenzione a evitare parti del corpo troppo vicine, soprattutto all'inizio. (ad esempio, naso, bocca e occhi potrebbero essere troppo difficili all'inizio).",
                     "Fate attenzione a non usare sempre la stessa frase per interagire con la parte del corpo. Possiamo variare la parola \"toccare\" con \"indicare\" o \"mostrarmi\" o \"dov'è\", ad esempio.",
                     "Cercate di variare la persona su cui identificare la parte del corpo, magari anche su bambole."],
              need: "",
              difficult: .init(receptive: 6, expressive: 3, problemSolving: 6, fineMotory: 1),
              categories: .init(arrayLiteral: .problemSolving, .receptive)),
        .init(id: 14,
              name: "Manualità fine",
              description: """
                    Posizionare gli elementi separati nei 3 contenitori, da sinistra a destra: i bulloni a sinistra, le rondelle al centro e i dadi a destra.

                    Chiarite cosa deve fare sia verbalmente che con un esempio pratico, e aiutate fisicamente l'operazione prima in modo molto invasivo, poi gradualmente meno.

                    Si possono fornire piccoli rinforzi alla fine di ogni bullone e un rinforzo più sostanzioso alla fine della sessione.
                    """,
              tips: ["Utilizzare dimensioni grandi per facilitare gli spostamenti e ridurre al minimo il rischio di ingestione.",
                     "Non lasciare mai il bambino da solo con i componenti.",
                     "Se l'attività è troppo facile, si può aumentare il numero di bulloni da assemblare o utilizzare misure diverse contemporaneamente."],
              need: "3 contenitori, bulloni grandi, rondella di dimensioni adeguate e dadi per completare il bullone",
              difficult: .init(receptive: 3, expressive: 1, problemSolving: 3, fineMotory: 12),
              categories: .init(arrayLiteral: .fineMotory)),
        .init(id: 15,
              name: "Puzzle cognitivo a 2 pezzi",
              description: """
                    Iniziate a disporre le prime metà sul tavolo alla sinistra del bambino e le altre alla sua destra. Le metà devono essere ben distanziate, senza sovrapporsi, per facilitare il riconoscimento e il movimento.

                    Lo scopo dell’attività è unire le varie metà con quelle giuste. Facendo muovere la metà di destra verso quella a sinistra, guidandola con un dito ed evitando le altre metà che si trovano lungo il percorso.

                    Spiegate al bambino l'attività e mostrategli come svolgerla. Se necessario, aiutatelo con un gesto fisico. Quando si sentirà più sicuro, ridimensionatelo indicando solo la metà destra o senza alcun aiuto.

                    Dopo alcune ripetizioni, cambiate le carte o aggiungetene altre.

                    Alla fine della sessione si può premiare il bambino con dolci o con un premio più sostanzioso a sua scelta.
                    """,
              tips: ["Una variante è quella di mettere tutte le prime metà davanti al bambino, ben distanziate, e accanto a loro un mazzo con le altre metà, in modo che possa concentrarsi su una cosa alla volta."],
              need: "Vari puzzle cognitivi da 2 pezzi (si possono anche realizzare a casa)",
              difficult: .init(receptive: 3, expressive: 1, problemSolving: 3, fineMotory: 3),
              categories: .init(arrayLiteral: .problemSolving)),
        .init(id: 16,
              name: "Manualità con le penne",
              description: """
                    Sedetevi al tavolo, posizionate i tappi a sinistra, le penne al centro e il contenitore per raccogliere le penne complete a destra (opposto se mancini).
                    Il bambino deve raccogliere la penna e il suo cappuccio dai contenitori, unirli e metterli nel contenitore appropriato.

                    Spiegate bene l'attività, potete iniziare a mostrargli cosa fare facendolo voi stessi.
                    Quindi, se necessario, aiutate il bambino con una richiesta fisica completa, per poi ridurla gradualmente.

                    È importante intervenire in caso di errori correggendo il bambino sul posto.

                    Si possono fornire piccoli rinforzi alla fine di ogni ripetizione e grandi rinforzi alla fine della sessione.
                    """,
              tips: ["Possiamo aumentare la difficoltà aumentando il numero di penne e variandone i tipi, mescolando pennarelli, evidenziatori e altri strumenti diversi per colore, dimensione e forma.",
                     "Questa attività è molto utile anche per allenare la capacità di concentrazione. Se il bambino ha difficoltà a rimanere concentrato, iniziate con un numero piccolo di penne, anche solo una. Poi fate l'attività e premiatelo subito dopo. La volta successiva si può aumentare il numero di penne."],
              need: "3 contenitori, penne, pennarelli, evidenziatori etc e i relativi tappi",
              difficult: .init(receptive: 1, expressive: 1, problemSolving: 3, fineMotory: 6),
              categories: .init(arrayLiteral: .fineMotory)),
        .init(id: 17,
              name: "Imitazione coi regoli",
              description: """
                    Innanzitutto, avremo bisogno di immagini che rappresentino i regoli in varie posizioni. Lo scopo dell'attività è che il bambino sovrapponga i regoli alla loro rappresentazione nell'immagine.

                    Iniziate spiegando bene l'attività, fatene prima una dimostrazione e poi sollecitate il bambino fisicamente finché non sarà in grado di farla da solo, ricordando sempre di intervenire in caso di errori.

                    Si possono fornire piccoli rinforzi alla fine di ogni immagine e grandi rinforzi alla fine della sessione.
                    """,
              tips: ["Per rendere l’attività più impegnativa, invece di dover ricalcare la posizione dei regoli si può creare una forma con i regoli che il bambino dovrà replicare su un altro punto del tavolo"],
              need: "Regoli colorati",
              difficult: .init(receptive: 3, expressive: 1, problemSolving: 6, fineMotory: 3),
              categories: .init(arrayLiteral: .problemSolving, .fineMotory)),
        .init(id: 18,
              name: "I colori con le puntine colorate",
              description: """
                    Lo scopo dell'attività è creare strisce di puntine sulla lavagna con un certo schema di colori, come ad esempio rosso-giallo-rosso-giallo. Per rendere l'attività più semplice, mettete il foglio di carta sulla lavagna e disegnate dei piccoli cerchi dove il bambino dovrà mettere le puntine.

                    Come al solito, iniziate spiegando bene l'attività, fatene prima una dimostrazione e poi sollecitate il bambino fisicamente finché non sarà in grado di farla da solo, ricordando sempre di intervenire in caso di errori.

                    Per rendere l'attività più difficile, possiamo cambiare lo schema. Ad esempio, invece di A-B-A-B possiamo passare ad A-A-B o A-B-B o introdurre un nuovo colore.

                    Si possono fornire piccoli rinforzi alla fine di ogni schema riprodotto e grandi rinforzi alla fine della sessione.
                    """,
              tips: ["Se l'attività è troppo complicata, possiamo creare noi stessi una striscia con un motivo semplice e poi farla copiare al bambino."],
              need: "Spille di vari colori, il pannello per le puntine e un foglio di carta",
              difficult: .init(receptive: 3, expressive: 1, problemSolving: 6, fineMotory: 6),
              categories: .init(arrayLiteral: .problemSolving, .fineMotory)),
        .init(id: 19,
              name: "Le forme con i chiodini colorati",
              description: """
                    Lo scopo dell'attività è far copiare al bambino una forma creata con i chiodini.

                    Prima di tutto è necessario creare sulla lavagna una forma che il bambino dovrà replicare. Si può iniziare con forme geometriche di base e poi passare a figure più complesse, come un fiore, un albero, ecc.

                    Iniziate spiegando bene l'attività e poi sollecitate il bambino fisicamente finché non sarà in grado di farlo da solo, ricordando sempre di intervenire in caso di errori.

                    Per aumentare la difficoltà, possiamo aumentare il numero di colori dei chiodini o il numero di chiodini necessari per completare la figura.
                    """,
              tips: ["Non lasciate mai il bambino da solo con i chiodini se c'è il rischio che li ingerisca."],
              need: "Dei chiodini colorati con la relativa lavagnetta",
              difficult: .init(receptive: 3, expressive: 1, problemSolving: 6, fineMotory: 6),
              categories: .init(arrayLiteral: .problemSolving, .fineMotory)),
    ]
}
