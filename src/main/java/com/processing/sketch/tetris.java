package com.processing.sketch;


import static com.processing.sketch.gameConstants.*;

/**
 * @author Giacomo Orsenigo
 * @brief la classe gestisce il gioco teris
 */
public class tetris {

    /**
     * @author Giacomo Orsenigo
     * giocatore
     */
    private Giocatore giocatore = new Giocatore();

    /**
     * @author Giacomo Orsenigo
     * oggetto della classe {@code Forme} che contiene tutte le forme del gioco
     */
    private Forme forme = new Forme();

    /**
     * @author Giacomo Orsenigo
     * contatore delle mosse
     */
    private int contatore = 0;

    /**
     * @author Giacomo Orsenigo
     * indica se il giocatore ha perso
     */
    private boolean gameOver = false;

    /**
     * @author Giacomo Orsenigo
     * @brief reset
     *
     * reimposta gli attributi {@code giocatore}, {@code gameOver}, {@code forme} e {@code contatore}
     */
    public void reset() {
        giocatore = new Giocatore();
        gameOver = false;
        forme = new Forme();
        contatore = 0;
    }

    /**
     * @author Giacomo Orsenigo
     * @brief fa una mossa
     * <p>
     * ridisegna l'interfaccia e le figure ferme, sposta in basso la figura attiva e, se arriva in fondo, la disattiva
     * Poi, in base al parametro {@code tasto}, richiama i metodi per spostare la figura.
     * Controlla se una riga è piena (la riga viene cancellata) o se la colonna è piena (il giocatore ha perso)
     * Incrementa {@code giocatore.punteggio}
     * @param tasto numero che rappresenta il tasto premuto
     * @see #checkRiga()
     * @see #checkColonna()
     * @see #checkFormaAttiva()
     * @see Forme#spostaAttivaSinistra()
     * @see Forme#spostaAttivaDestra()
     * @see #spostaGiu()
     * @see #spostaInFondo()
     * @see Forme#ruotaFiguraAttiva()
     */
    public void faiMossa(int tasto) {
        //disegno le figure passive e sposto se possibile verso il basso quella attiva che altrimenti verrÃ  disattivata
        if (contatore == 1 || contatore % mossePerTurno == 0) {
            spostaGiu();
            checkFormaAttiva();
            checkColonna();
        }
        System.out.println(tasto);
        switch (tasto) {
            case 0:
                forme.spostaAttivaSinistra();
                break;
            case 1:
                forme.spostaAttivaDestra();
                break;
            case 3:
                spostaGiu();
                giocatore.addPunteggio(10);
                break;
            case 2:
                forme.ruotaFiguraAttiva();
                break;
            case 4:
                spostaInFondo();
                break;
            default:
                break;
        }

        if (contatore % mossePerTurno == 0) {
            checkColonna();
        }
        checkFormaAttiva();
        contatore++;
    }

    /**
     * @author Giacomo Orsenigo
     * @brief disattiva la forma attiva
     * <p>
     * disattiva la forma attiva e controlla se c'è qualche riga completa
     * @see Forme#disattivaFormaAttiva()
     * @see #checkRiga()
     */
    private void disattivaFormaAttiva() {
        forme.disattivaFormaAttiva();
        checkRiga();
    }

    /**
     * @author Giacomo Orsenigo
     * @brief controllo riga
     * <p>
     * controlla se la riga è completa e, in caso positivo, incrementa {@code giocatore.punteggio}
     * @see Forme#controlloRigaCompleta(int)
     */
    private void checkRiga() {
        boolean controlloRiga = false;
        {
            int i = height - grandezzaQuadrato;
            while (i >= 0) {
                controlloRiga = forme.controlloRigaCompleta(i);
                if (controlloRiga) {
                    giocatore.addPunteggio(100);
                } else
                    i -= grandezzaQuadrato;
            }
        }
    }

    /**
     * @author Giacomo Orsenigo
     * @brief controllo colonna
     * <p>
     * controllo un possibile game over in base al riempimento delle varie colonne
     * modifica l'attributo {@code gameOver}
     * @see Forme#controlloColonna(int)
     */
    private void checkColonna() {
        boolean controlloColonna;
        for (int i = 0; i < 3 * width / 5; i += grandezzaQuadrato) {
            controlloColonna = forme.controlloColonna(i);
            if (controlloColonna) {
                gameOver = true;
                break;
            }
        }
    }


    /**
     * @author Giacomo Orsenigo
     * @brief aggiunge nuove forme
     * <p>
     * controlla se ci sono forme attive e, in cano negativo ne aggiunge una nuova
     * @see Forme#getFormaAttiva()
     * @see Forme#inserisciNuova()
     */
    private void checkFormaAttiva() {
        if (forme.getFormaAttiva() == null) {
            forme.inserisciNuova();
        } else if (forme.getFormaAttiva().getNumElQuadrati() == 0) {
            forme.disattivaFormaAttiva();
            forme.inserisciNuova();
        }
    }

    /**
     * @author Giacomo Orsenigo
     * @brief sposta una forma in basso
     * <p>
     * sposta una forma in basso e la disattiva se è arrivata in
     * fondo.
     * @see Forme#spostaAttivaGiu()
     * @see #disattivaFormaAttiva()
     */
    public void spostaGiu() {
        if (!forme.spostaAttivaGiu())
            disattivaFormaAttiva();
    }

    /**
     * @author Giacomo Orsenigo
     * @brief sposta una forma in fondo
     * <p>
     * sposta una forma in fondo alla griglia e la disattiva. Aggiunge 20 al punteggio.
     * @see Forme#spostaAttivaGiu()
     * @see #disattivaFormaAttiva()
     */
    public void spostaInFondo() {
        for (int i = 0; i < height / grandezzaQuadrato; i++) {
            giocatore.addPunteggio(10);
            if (!forme.spostaAttivaGiu()) {
                disattivaFormaAttiva();
                break;  //per velocizzare
            }
        }
    }

    /**
     * @author Giacomo Orsenigo
     * @brief get {@code gameOver}
     * @return true se il giocatore ha perso, false in caso contrario
     */
    public boolean isGameOver() {
        return gameOver;
    }

    /**
     * @author Giacomo Orsenigo
     * @brief get {@code giocatore}
     * @return giocatore
     */
    public Giocatore getGiocatore() {
        return giocatore;
    }

    /**
     * @author Giacomo Orsenigo
     * @brief get {@code forme}
     * @return forme
     */
    public Forme getForme() {
        return forme;
    }

}
