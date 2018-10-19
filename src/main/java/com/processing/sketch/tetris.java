package com.processing.sketch;

import javax.swing.*;

import static com.processing.sketch.gameConstants.*;
import static javax.swing.JOptionPane.QUESTION_MESSAGE;

public class tetris {
    /**
     * giocatore
     */
    private Giocatore giocatore = new Giocatore();

    public Giocatore getGiocatore() {
        return giocatore;
    }

    /**
     * oggetto della classe {@code forme} che contiene tutte le forme del gioco
     */
    private Forme forme = new Forme();
    /**
     * contatore delle mosse
     */
    private int contatore = 0;
    /**
     * indica se il giocatore ha perso
     */
    private boolean gameOver = false;


    /**
     * memorizza la forma in movimento
     */
    private Forma formaGen;


    /**
     * @brief fa una mossa
     * <p>
     * ridisegna l'interfaccia e le figure ferme, sposta in basso la figura attiva e, se arriva in fondo, la disattiva
     * Poi legge un valore da tastiera e richiama i metodi per spostare la figura.
     * Controlla se una riga è piena (la riga viene cancellata) o se la colonna è piena (il giocatore ha perso)
     * Modifica {@code formaGen} e {@code gameOver}.
     * @see forme#controlloRigaCompleta(int)
     * @see forme#controlloColonna(int)
     * @see forme#spostaAttivaSinistra()
     * @see forme#spostaAttivaDestra()
     * @see #spostaGiu()
     * @see #spostaInFondo()
     * @see forme#ruotaFiguraAttiva()
     */

    public void reset(){
        giocatore=new Giocatore();
        gameOver = false;
        forme = new Forme();
        contatore = 0;
    }
    public void faiMossa(int tasto) {
        //disegno le figure passive e sposto se possibile verso il basso quella attiva che altrimenti verrÃ  disattivata
        if (contatore == 1 || contatore % mossePerTurno == 0) {
            formaGen = forme.getFormaAttiva();
            spostaGiu();
            checkFormaAttiva();
            checkColonna();
        }
        //repaint();
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
            //inizio dei controlli per le righe e le colonne
            checkRiga();
            checkColonna();
        }
        checkFormaAttiva();
        contatore++;
    }

    /**
     * @brief controllo riga
     * <p>
     * controlla se la riga è completa
     * @see forme#controlloRigaCompleta(int)
     */
    private void checkRiga() {
        boolean controlloRiga = false;
        {
            int i = height - grandezzaQuadrato;
            while (i >= 0) {
                controlloRiga = forme.controlloRigaCompleta(i);
                if (controlloRiga) {
                    //quando la riga Ã¨ completa si modifica il punteggio del giocatore
//                    pushMatrix();
//                    fill(255);
//                    text(giocatore.getPunteggio(), 3 * width / 5 + grandezzaQuadrato, 6 * grandezzaQuadrato + 150);
//                    popMatrix();

                    giocatore.addPunteggio(100);

                    //ridisegno figure spostate dopo aver cancellato la riga completata
                    //repaint();
                } else
                    i -= grandezzaQuadrato;
            }
        }
    }

    public Forme getForme() {
        return forme;
    }

    /**
     * @brief controllo colonna
     * <p>
     * controllo un possibile gameOver in base al riempimento delle varie colonne
     * @see forme#controlloColonna(int)
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
     * @brief aggiunge nuove forme
     * <p>
     * controlla se ci sono forme attive e, in cano negativo ne aggiunge una nuova
     * collabolra con {@code forme.disattivaFormaAttiva()} e {@code forme.getForma(int)}
     * @see forme#inserisciNuova()
     */
    private void checkFormaAttiva() {
        if (forme.getFormaAttiva() == null) {
            forme.inserisciNuova();
            formaGen = forme.getForma(forme.getNumEl() - 1);
        } else if (forme.getFormaAttiva().getNumElQuadrati() == 0) {
            forme.disattivaFormaAttiva();
            forme.inserisciNuova();
            formaGen = forme.getForma(forme.getNumEl() - 1);
        }
    }

    /**
     * @brief sposta una forma in basso
     * <p>
     * sposta una forma in basso e la disattiva se è arrivata in
     * fondo. Collabora con {@code forme.spostaAttivaGiu()}
     * @see forme#spostaAttivaGiu()
     */
    public void spostaGiu() {
        if (!forme.spostaAttivaGiu())
            forme.disattivaFormaAttiva();
    }

    /**
     * @brief sposta una forma in fondo
     * <p>
     * sposta una forma in fondo alla griglia e la disattiva. Aggiunge 20 al punteggio.
     * Collabora con {@code forme.spostaAttivaGiu()}
     * @see forme#spostaAttivaGiu()
     */
    public void spostaInFondo() {
        for (int i = 0; i < 500; i++) {
            giocatore.addPunteggio(10);
            if (!forme.spostaAttivaGiu()) {
                forme.disattivaFormaAttiva();
                break;  //per velocizzare
            }
        }
    }

    public boolean isGameOver() {
        return gameOver;
    }
}
