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
- `css/styles.css`: stili globali
- `js/script.js`: interazioni UI (menu mobile, reveal, modali, lightbox)
- `images/`: immagini contenuto, incluse gallery clienti
- `facilitatori-foto/`: foto profili facilitatori
- `scripts/optimize-images.ps1`: script PowerShell per ottimizzazione immagini
- `docs/`: documentazione e archivio materiali

## Avvio locale

Apri direttamente `index.html` nel browser.

In alternativa, usa un server statico locale (consigliato per test piu realistici).

## Manutenzione immagini

Per nuove immagini nelle gallery:
1. ottimizzare prima il file (dimensioni e compressione)
2. salvare nella cartella cliente corretta sotto `images/`
3. aggiornare i riferimenti in `index.html`

Script disponibile: `scripts/optimize-images.ps1`.

## Note

- Font caricati da Google Fonts.
- Il progetto e pensato per uso interno e presentazioni workshop.
