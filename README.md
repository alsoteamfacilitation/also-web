# ALSO - Chi siamo

Landing page statica del team ALSO (Agile Lab for Sensemaking & Outcomes) di S&PE Agile Coaching.

Autore: c.baldassarre@accenture.com

Il sito presenta:
- identita e value proposition del team
- facilitatori e contatti
- metodi e template workshop
- gallery clienti con lightbox
- sezione pricing con esempi

## Stack

- HTML5
- CSS3
- JavaScript vanilla

Nessun framework o build step richiesto.

## Struttura progetto

- `index.html`: pagina principale
- `indexfull.html`: versione standalone (single-file) con contenuti embedded, pensata per condivisione offline
- `css/styles.css`: stili globali
- `js/script.js`: interazioni UI (menu mobile, reveal, modali, lightbox)
- `images/`: immagini contenuto, incluse gallery clienti
- `facilitatori-foto/`: foto profili facilitatori
- `scripts/optimize-images.ps1`: script PowerShell per ottimizzazione immagini
- `docs/`: documentazione e archivio materiali

## Quando usare index.html vs indexfull.html

### Uso live (demo/presentazione web)

Usare l'intera folder SharePoint **ALSO - Chi siamo** e partire da `index.html`.

Motivazione:
- `index.html` usa la struttura completa del progetto (CSS, JS, immagini da cartelle)
- e la versione corretta per navigazione web live durante demo

### Uso offline / condivisione rapida

Usare `indexfull.html`.

Sono previste 2 modalita:

1. Condivisione via SharePoint del solo link a `indexfull.html`
	- il contenuto puo aggiornarsi nel tempo se il file viene modificato in repository/share

2. Invio via email del file `indexfull.html`
	- il destinatario riceve uno snapshot scaricato
	- il file non si aggiornera automaticamente mai

## Stato attuale delle due varianti

- `index.html`
	- versione web "modulare" (asset esterni: CSS, JS, immagini da cartelle)
	- adatta a demo live e aggiornamenti frequenti del contenuto

- `indexfull.html`
	- versione "single-file" con immagini embedded in base64
	- ottimizzata per condivisione offline o link singolo SharePoint
	- sezione Template in formato catalogo inline (senza dialog/collapse)

## Perimetro di utilizzo

Condivisione consentita **solo interna tra colleghi Accenture**.

Non usare per:
- condivisioni verso colleghi esterni
- pubblicazione social o canali pubblici

## Avvio locale

Apri direttamente `index.html` nel browser.

In alternativa, usa un server statico locale (consigliato per test piu realistici).

## Manutenzione immagini

Per nuove immagini nelle gallery:
1. ottimizzare prima il file (dimensioni e compressione)
2. salvare nella cartella cliente corretta sotto `images/`
3. aggiornare i riferimenti in `index.html`
4. se l'immagine e usata anche in `indexfull.html`, rigenerare e sostituire il relativo base64

Nota pratica:
- `index.html` legge direttamente i file in `images/` e `facilitatori-foto/`
- `indexfull.html` non legge quei path a runtime: va sincronizzato manualmente quando cambiano le immagini sorgente

Script disponibile: `scripts/optimize-images.ps1`.

### Ambito script `optimize-images.ps1`

Lo script ottimizza solo queste cartelle target:
- `facilitatori-foto/`
- `images/Allianz/`
- `images/Poste/`
- `images/Alumni/`
- `images/S&C Automotive/`

Le altre cartelle in `images/` restano escluse dallo script finche non vengono aggiunte esplicitamente ai target.

## Note

- Font caricati da Google Fonts.
- Il progetto e pensato per uso interno e presentazioni workshop.
