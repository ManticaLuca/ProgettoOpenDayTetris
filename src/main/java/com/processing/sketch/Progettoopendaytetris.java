package com.processing.sketch;

import processing.core.PApplet;


import java.util.Random;
import javax.swing.JOptionPane;

import static javax.swing.JOptionPane.YES_NO_OPTION;
import static javax.swing.JOptionPane.QUESTION_MESSAGE;
import static javax.swing.JOptionPane.YES_OPTION;

import static com.processing.sketch.gameConstants.*;

public class Progettoopendaytetris extends processing.core.PApplet {
    public static void main(String[] args) {
        PApplet.main("com.processing.sketch.Progettoopendaytetris", args);  /////////////per intellij
    }

    /**
     * @file
     * @author Giacomo Orsenigo
     * @version 1.0
     */

    /**
     * @author Giacomo Orsenigo
     * oggetto di classe {@code inputTastiera} per leggere da tastiera
     */
    inputTastiera tastiera = new inputTastiera();

    public static PApplet programmaProcessing;  //////////per intellij

    /**
     * @author Giacomo Orsenigo
     * file su cui scrivere la classifica
     */
    private FileDiTesto file = new FileDiTesto(sketchPath());

    /**
     * @author Giacomo Orsenigo
     * variabile che va a true se il gioco è iniziato
     */
    private boolean giocoPartito = false;



    /**
     * @author Giacomo Orsenigo
     * memorizza le coordinate di un quadrato
     */
    private String parts[];

    /**
     * @author Giacomo Orsenigo
     * tetris
     */
    private tetris game = new tetris();

    /**
     * @author Giacomo Orsenigo
     * tasto premuto
     */
    private int tasto;


    /**
     * @author Giacomo Orsenigo
     * @brief tasto premuto
     * <p>
     * evento che si verifica quando viene premuto un tasto
     * modifica {@code tasto} e {@code giocoPartito}
     * @see inputTastiera#LeggiInput()
     */
    public void keyPressed() {
        if (giocoPartito)
            tasto = tastiera.LeggiInput();
        else
            giocoPartito = true;
    }

    /**
     * @author Giacomo Orsenigo
     * @brief settings
     * <p>
     * ridimensiona la finestra
     */
    public void settings() {
        size(gameConstants.height, gameConstants.width);
    }

    /**
     * @author Giacomo Orsenigo
     * @brief inizializza la finestra e gli attributi
     * <p>
     * crea l'interfaccia grafica e inizializza gli attributi
     * @see #reset()
     */
    public void setup() {
        reset();
        programmaProcessing = this; ///////////////per intellij
    }

    /**
     * @author Giacomo Orsenigo
     * @brief loop
     * <p>
     * funzione loop che visualizza il menù iniziale e disegna la schermata di
     * gioco al primo ciclo e continua a richiamare {@code tetris.faiMossa} finchè il
     * giocatore non perde. A ogni ciclo incrementa {@code tetris.contatore} e azzera {@code tasto}
     * @see #menuIniziale()
     * @see #schermataDiGioco()
     * @see #repaintForme()
     * @see tetris#faiMossa(int)
     */
    public void draw() {
        if (!giocoPartito) {
            menuIniziale(); //Visualizzazione del menu iniziale
        } else {
            schermataDiGioco();
            /*
             * controlla se la variabile gameover Ã¨ true ed in caso positivo
             * termina la partita
             */
            game.faiMossa(tasto);
            repaintForme();
            if (game.isGameOver())
                gameOver();
            //else
        }
        tasto = -1;
        delay(velocitaDiscesa/mossePerTurno);
    }

    /**
     * @author Giacomo Orsenigo
     * @brief reset
     * <p>
     * azzera gli attributi per iniziare una nuova partita. Imposta il nuovo nome al giocatore ({@code game.giocatore.nickname})
     * modifica {@code giocoPartito} e {@code tasto}
     * @see tetris#reset()
     */
    private void reset() {
        game.reset();
        game.getGiocatore().setNome(JOptionPane.showInputDialog(null, "Inserisci il nome", "Nome", QUESTION_MESSAGE));
        if (game.getGiocatore().getNickname() == null) {    //se viene premuto annulla
            System.err.println("Manca il nome");
            System.exit(-1);
        }
        background(0);
        giocoPartito = false;
        tasto = -1;
        loop(); //fa ripartire il loop
    }

    /**
     * @author Giacomo Orsenigo
     * @brief game over
     * <p>
     * scrive su file il punteggio e chiede se ricominciare o visuaizzare la classifica (ordinata).
     * collafora con la classe {@code FileDiTesto}
     * @see FileDiTesto#scriviSuFileESuVettore(String, int)
     * @see FileDiTesto#getFileDiTesto()
     */
    private void gameOver() {
        background(0);
        file.scriviSuFileESuVettore(game.getGiocatore().getNickname(), game.getGiocatore().getPunteggio());
        noLoop();  //ferma il loop
        if (JOptionPane.showConfirmDialog(null, "Ricominciare:", "Tetris", YES_NO_OPTION) == YES_OPTION)
            reset();
        else {
            file.ordina();
            String classifica = file.getFileDiTesto();
            String[] pos = classifica.split(";");
            for (int i = 0; i < pos.length; i++) {
                text("alla posizione " + i + ": " + pos[i], 100, (i + 1) * 25);
            }
        }
    }


    /**
     * @author Giacomo Orsenigo
     * @brief repaint
     * <p>
     * ridisegna la forme del gioco
     */
    private void repaintForme() {
        for (int k = 0; k < game.getForme().getNumEl(); k++) {
            Forma forma = game.getForme().getForma(k);
            for (int j = 0; j < forma.getNumElQuadrati(); j++) //disegno figura passiva
            {
                parts = forma.getPos(j).split(";");
                pushMatrix();
                fill((forma.getColore()).getR(), (forma.getColore()).getG(), (forma.getColore()).getB());
                rect(Float.parseFloat(parts[0]), Float.parseFloat(parts[1]), grandezzaQuadrato, grandezzaQuadrato, 1);
                popMatrix();
            }
        }
    }


    /**
     * @author Giacomo Orsenigo
     * @brief menù iniziale
     * <p>
     * disegna il menù iniziale e scrive le istruzioni
     */
    public void menuIniziale() {
        textSize(50);
        pushMatrix();

        //disegna l'interfaccia grafica
        Random random = new Random();
        fill(random.nextInt(254) + 1, random.nextInt(254) + 1, random.nextInt(254) + 1);
        text("TETRIS", 150, 120);

        fill(255);
        textSize(20);

        text("Nuova partita", 155, 200);
        text("Premi un tasto per cominciare!", 70, 250);
        popMatrix();

        textSize(15);
        text("Istruzioni:\npremere\n[a o \u2190] per spostarsi a sinistra\n[d o \u2192] per spostartsi a destra\n[s o \u2193] per scendere\n[w o \u2191] per ruotare\n[spazio] per scendere in fondo", 50, 320);
    }

    /**
     * @author Giacomo Orsenigo
     * @brief disegna la schermata di gioco
     * <p>
     * disegna la schermata di gioco con il nome del giocatore e il punteggio
     */
    public void schermataDiGioco() {

        //uso pushMatrix per non dover risettare i valori di fill
        pushMatrix();
        fill(0);
        rect(0, 0, 3 * width / 5, height);


        fill(194, 194, 214);
        rect(3 * width / 5, 0, 2 * width / 5, height);
        stroke(128, 128, 128);
        for (int i = 0; i < height; i += grandezzaQuadrato) {
            line(0, i, 3 * width / 5, i);
        }
        for (int i = 0; i < 3 * width / 5; i += grandezzaQuadrato) {
            line(i, 0, i, height);
        }
        //scrittura dell'interfaccia con utente -punteggio, nickname -

        fill(77, 77, 255);
        textSize(24);
        if (!game.getGiocatore().getNickname().toUpperCase().equals("")) {
            text("Giocatore:", 3 * width / 5 + grandezzaQuadrato, 1 * grandezzaQuadrato + 150);
            text(game.getGiocatore().getNickname().toUpperCase(), 3 * width / 5 + grandezzaQuadrato, 2 * grandezzaQuadrato + 150);
            text("PUNTEGGIO:", 3 * width / 5 + grandezzaQuadrato, 5 * grandezzaQuadrato + 150);
            text("        " + game.getGiocatore().getPunteggio(), 3 * width / 5 + grandezzaQuadrato, 6 * grandezzaQuadrato + 150);
        } else {
            text("Giocatore:", 3 * width / 5 + grandezzaQuadrato, 1 * grandezzaQuadrato + 150);
            text("Sconosciuto", 3 * width / 5 + grandezzaQuadrato, 2 * grandezzaQuadrato + 150);
            text("PUNTEGGIO:", 3 * width / 5 + grandezzaQuadrato, 5 * grandezzaQuadrato + 150);
            text("        " + game.getGiocatore().getPunteggio(), 3 * width / 5 + grandezzaQuadrato, 6 * grandezzaQuadrato + 150);
        }
        popMatrix();
    }

}