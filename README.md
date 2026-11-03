# FootWorld

FootWorld è un'applicazione web di commercio elettronico per la vendita online di calzature, abbigliamento e accessori. Il sistema offre ai clienti un catalogo consultabile per categoria, un carrello di acquisto e la conferma dell'ordine, e mette a disposizione degli amministratori un'area riservata per la gestione del catalogo e la consultazione degli ordini.

## Indice

1. [Funzionalità](#funzionalità)
2. [Architettura](#architettura)
3. [Struttura del progetto](#struttura-del-progetto)
4. [Sicurezza](#sicurezza)
5. [Tecnologie](#tecnologie)
6. [Requisiti](#requisiti)
7. [Configurazione del database](#configurazione-del-database)
8. [Compilazione e avvio](#compilazione-e-avvio)
9. [Utilizzo](#utilizzo)
10. [Gestione degli errori](#gestione-degli-errori)
11. [Autore](#autore)

## Funzionalità

### Area cliente

- **Registrazione e accesso**: creazione di un account con nome utente, email e password; accesso tramite email e password con gestione della sessione.
- **Catalogo**: consultazione dei prodotti suddivisi nelle categorie Scarpe, Sneakers, Abbigliamento, Accessori e Regali, con una vetrina generale nella pagina iniziale.
- **Dettaglio prodotto**: scheda con immagine, descrizione, prezzo e disponibilità.
- **Carrello**: aggiunta di prodotti con indicazione della quantità, rimozione con richiesta di conferma e calcolo automatico del totale. Il carrello è conservato nella sessione dell'utente.
- **Conferma dell'ordine**: inserimento dei dati di consegna e di pagamento, validazione dei campi, registrazione dell'ordine e svuotamento del carrello. Il pagamento è simulato e i dati della carta non vengono memorizzati.
- **Area personale**: sezione riservata agli utenti autenticati.

### Area amministrativa

L'area amministrativa è riservata agli utenti con privilegi di amministratore e consente di:

- **inserire** nuovi prodotti nel catalogo, con caricamento dell'immagine;
- **modificare** i prodotti esistenti (prezzo, disponibilità, categoria, immagine);
- **visualizzare** l'elenco dei prodotti presenti;
- **eliminare** prodotti dal catalogo;
- **consultare** l'elenco complessivo degli ordini e **filtrarlo** per cliente.

## Architettura

L'applicazione segue il pattern **Model-View-Controller** e si basa su Servlet e JSP:

- **Model** (`model`): classi di dominio (`Prodotto`, `User`, `Ordine`, `Cart`) e oggetti di accesso ai dati (`ProdottoDao`, `UserDao`, `OrdineDAO`), ciascuno con la relativa interfaccia.
- **View** (`webapp`): pagine JSP, fogli di stile CSS e script JavaScript. Intestazione e piè di pagina sono componenti riutilizzabili inclusi in tutte le pagine.
- **Controller** (`control`): servlet che ricevono le richieste, invocano il livello di accesso ai dati e indirizzano verso la vista appropriata.

Gli accessi alle aree protette sono controllati da due **filtri servlet** (`AdminFilter` e `UserFilter`).

## Struttura del progetto

```
FootWorld
├── pom.xml
└── src/main
    ├── java
    │   ├── control                 Servlet e filtri
    │   └── model                   Bean, DAO e carrello
    └── webapp
        ├── CSS                     Fogli di stile
        ├── Javascript              Script lato client
        ├── META-INF/context.xml    Risorsa DataSource di Tomcat
        ├── WEB-INF/web.xml         Configurazione dell'applicazione
        ├── adminPage               Area amministrativa
        ├── categorie               Catalogo e dettaglio prodotto
        ├── common                  Home, login, registrazione, carrello, checkout
        ├── error                   Pagine di errore personalizzate
        ├── footerInfo              Pagine informative
        ├── fragments               Intestazione e piè di pagina
        ├── logo                    Risorse grafiche
        └── userPage                Area personale
```

## Sicurezza

- **Query parametrizzate**: tutte le interrogazioni al database usano `PreparedStatement`, a protezione da attacchi di tipo SQL Injection.
- **Password cifrate**: le password non sono salvate in chiaro, ma come hash SHA-512.
- **Controllo degli accessi**: `AdminFilter` protegge le pagine e le servlet di amministrazione (utenti non autenticati reindirizzati al login, utenti non amministratori respinti con errore 403); `UserFilter` richiede l'autenticazione per l'area personale.
- **Validazione dei dati**: i dati del checkout sono verificati lato server tramite espressioni regolari.

## Tecnologie

| Ambito | Tecnologia |
|---|---|
| Linguaggio | Java 11 |
| Server-side | Servlet 4.0 e JSP |
| Application server | Apache Tomcat 9 |
| Database | MySQL (driver `mysql-connector-j` 8.2.0) |
| Build | Apache Maven |
| Front-end | HTML5, CSS3, JavaScript |

## Requisiti

- JDK 11 o successivo
- Apache Maven (oppure il wrapper `mvnw` incluso nel progetto)
- Apache Tomcat 9
- MySQL in esecuzione sulla porta 3306

## Configurazione del database

L'applicazione utilizza un database MySQL denominato `FootWorld`, raggiungibile all'indirizzo `localhost:3306`. Le tabelle utilizzate sono le seguenti:

| Tabella | Colonne |
|---|---|
| `users` | `username`, `password`, `email`, `admin` |
| `prodotto` | `nome`, `descrizione`, `prezzo`, `disponibilita`, `disponibile`, `categoria`, `imgUrl` |
| `Ordini` | `orderID`, `dataOrdine`, `nomeCliente`, `cognomeCliente`, `cap`, `indirizzoDiConsegna`, `totale`, `stato` |

Le credenziali di accesso al database sono configurate nelle classi del package `model` e nel file `src/main/webapp/META-INF/context.xml`. Prima dell'avvio è necessario verificare che utente e password corrispondano a quelli del proprio server MySQL.

Un utente è riconosciuto come amministratore quando il campo `admin` della tabella `users` ha valore `1`.

## Compilazione e avvio

### Da terminale

1. Avviare MySQL.
2. Compilare il progetto dalla cartella principale:

   ```bash
   mvn clean package
   ```

3. Copiare il file generato nella cartella `webapps` di Tomcat:

   ```bash
   cp target/FootWorld-1.0-SNAPSHOT.war <CARTELLA_TOMCAT>/webapps/
   ```

4. Avviare Tomcat:

   ```bash
   <CARTELLA_TOMCAT>/bin/startup.sh
   ```

5. Aprire il browser all'indirizzo:

   ```
   http://localhost:8080/FootWorld-1.0-SNAPSHOT/
   ```

Per arrestare il server:

```bash
<CARTELLA_TOMCAT>/bin/shutdown.sh
```

Dopo una modifica al codice, prima di ricopiare il nuovo `.war` è necessario rimuovere da `webapps` la vecchia versione, sia il file `.war` sia la cartella estratta.

### Da IntelliJ IDEA

Creare una configurazione **Tomcat Server → Local** che utilizzi l'artifact `FootWorld:war exploded`, impostando il campo *Application context* sul percorso desiderato (ad esempio `/FootWorld`).

## Utilizzo

1. Dalla pagina iniziale, o dal menu, scegliere una categoria e aprire la scheda del prodotto di interesse.
2. Aggiungere i prodotti al carrello, indicando la quantità.
3. Accedere al carrello, verificare il riepilogo e procedere al checkout.
4. Compilare i dati di consegna e di pagamento e confermare l'ordine.

Gli utenti non ancora registrati possono creare un account dalla pagina di accesso. Gli amministratori, dopo l'accesso, vengono indirizzati automaticamente alla pagina di amministrazione.

## Gestione degli errori

Le pagine di errore personalizzate, definite in `WEB-INF/web.xml`, sostituiscono le pagine predefinite del server per i seguenti casi:

| Codice | Situazione |
|---|---|
| 400 | Richiesta non valida |
| 403 | Accesso negato |
| 404 | Risorsa non trovata |
| 500 | Errore interno del server |

## Autore

Antonio Carlino
