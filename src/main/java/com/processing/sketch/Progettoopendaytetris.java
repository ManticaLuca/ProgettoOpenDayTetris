package com.processing.sketch;
////banananaa
import processing.core.PApplet;

import javax.swing.*;
import java.util.Random;

import static javax.swing.JOptionPane.YES_NO_OPTION;

public class Progettoopendaytetris extends processing.core.PApplet {
    public static void main(String[] args) {
        PApplet.main("com.processing.sketch.Progettoopendaytetris", args);
    }
/**
 * @file
 * @author Giacomo Orsenigo
 * @version 1.0
 */
    /**
     * giocatore
     */
    private Giocatore giocatore = new Giocatore();

    /**
     * oggetto della classe {@code forme} che contiene tutte le forme del gioco
     */
    private Forme forme = new Forme();

    /**
     * D
     * tempo da aspettare tra una mossa e l'altra (alla fine del loop)
     */
    private int delay = 300;

    /**
     * contatore delle mosse
     */
    private int contatore = 0;

    /**
     * grandezza di ogni quadrato
     */
    private int grandezzaQuadrato;

    /**
     * variabile che va a 1 se il gioco è iniziato
     */
    private boolean giocoPartito = false;

    /**
     * memorizza la forma in movimento
     */
    private Forma formaGen;

    /**
     * memorizza le coordinate di un quadrato
     */
    private String parts[];

    /**
     * vettore che indica la possibilita di spostamento delle forme nelle 4
     * direzioni
     */
    private boolean vettore[];

    /**
     * indica se il giocatore ha perso
     */
    private boolean gameOver = false;


    private char tasto;

    /**
     * @brief inizializza la finestra e gli attributi
     * <p>
     * crea l'interfaccia grafica e inizializza {@code grandezzaQuadrato},
     * {@code myPort}, {@code arduino}, {@code contatoreSeriale} e {@code vettore},
     * collabura con {@code Serial} e {@code USB}
     */

    public void keyPressed() {
        System.out.println("Premutoooo");
        if (giocoPartito)
            tasto = Character.toLowerCase(key);
        else
            giocoPartito = true;
    }

    public void settings() {
        size(500, 500);
    }

    public void setup() {
        reset();
    }
    /**
     * @brief loop
     * <p>
     * funzione loop che visualizza il menù iniziale e disegna la schermata di
     * gioco al primo ciclo e continua a richiamare {@code faiMossa} finchè il
     * giocatore non perde. Incrementa a ogni ciclo {@code contatore} e modifica
     * {@code inizio}
     */
    public void draw() {
        if (contatore == 0) {
            menuIniziale(); //Visualizzazione del menu iniziale
        }
        if (giocoPartito) {
            schermataDiGioco();
            contatore++;

            /**
             * controlla se la variabile gameover Ã¨ true ed in caso positivo
             * termina la partita
             */
            if (!gameOver) {
                faiMossa();
            } else {
                gameOver();
                //else


            }
        }
        delay(delay / 5);
    }

    private void reset() {
        giocatore.setNome(JOptionPane.showInputDialog("Inserisci il nome"));
        grandezzaQuadrato = height / 20;  //Si assegna alla grandezza del quadrato 1/20 della larghezza della finestra
        background(0);
        giocoPartito = false;
        vettore = new boolean[4];  //Inizializzo la grandezza del vettore a 4 poichÃ¨ al massimo ogni figura sarÃ  formata da 4 quadrati
        gameOver = false;
        forme = new Forme();
        contatore = 0;
        loop();
    }

    private void gameOver() {
        FileDiTesto file = new FileDiTesto();
        background(0);
        textSize(75);
        fill(255);
        text("GAME OVER", 40, 250);
        file.scriviSuFileESuVettore(giocatore.getNickname(), giocatore.getPunteggio());
        noLoop();
        delay(200);
        if (JOptionPane.showConfirmDialog(null, "Ricominciare:", "Tetris", YES_NO_OPTION) == 0)
            reset();
        else {
               try{
                   text(file.getFileDiTesto(),100,200);
               }catch(Exception e){}

        }
    }

    /**
     * @brief fa una mossa
     * <p>
     * ridisegna l'interfaccia e le figure ferme, sposta in basso la figura attiva e, se arriva in fondo, la disattivaFormaAttiva.
     * Poi legge un valore da seriale e richiama i metodi {@code spostaSinistra()}, {@code spostaDestra()}, {@code spostaGiu()} e {@code ruota()}.
     * Controlla se una riga è piena (la riga viene cancellata) o se la colonna è piena (il giocatore ha perso)
     * Modifica {@code formaGen}, {@code vettore} e {@code gameOver}.
     * Collabora con  {@code forme.getNumElQuadrati()}, {@code forme.getNumEl()}, {@code forma.getAttiva()}, {@code giocatore.getPunteggio()}, {@code forme.ricerca()},
     * {@code forme.spostaFiguraAttiva()}, {@code forme.getForma()}, {@code forma.getPos()}, {@code forma.getColore()}, {@code forme.inserisciNuova()},
     * {@code USB.leggi()}, {@code forme.disattivaFormaAttiva()}, {@code forme.controlloRigaCompleta()} e {@code forme.controlloColonna()}.
     * @see forme#controlloRigaCompleta(int)
     * @see forme#controlloColonna(int)
     * @see #spostaSinistra()
     * @see #spostaDestra()
     * @see #spostaGiu()
     * @see ruota()
     */
    void faiMossa() {
        //disegno le figure passive e sposto se possibile verso il basso quella attiva che altrimenti verrÃ  disattivata

        if (contatore == 1 || contatore % 5 == 0) {
            formaGen = forme.getFormaAttiva();
            spostaGiu();
            checkFormaAttiva();
        }
        repaint();
        System.out.println(tasto);
        switch (tasto) {
            case 'a':
                forme.spostaAttivaSinistra();
                break;
            case 'd':
                forme.spostaAttivaDestra();
                break;
            case 's':
                spostaGiu();
                break;
            case 'w':
                forme.ruotaFiguraAttiva();
                break;
            case ' ':
                spostaInFondo();
                break;
            default:
                break;
        }

        if (contatore % 5 == 0) {
            //inizio dei controlli per le righe e le colonne
            boolean controlloRiga = false;
            {
                int i = height - grandezzaQuadrato;
                while (i >= 0) {
                    controlloRiga = forme.controlloRigaCompleta(i);
                    if (controlloRiga) {
                        //quando la riga Ã¨ completa si modifica il punteggio del giocatore
                        pushMatrix();
                        fill(255);
                        text(giocatore.getPunteggio(), 3 * width / 5 + grandezzaQuadrato, 6 * grandezzaQuadrato + 150);
                        popMatrix();

                        giocatore.setPunteggio(100);

                        //ridisegno figure spostate dopo aver cancellato la riga completata
                        //repaint();
                    } else
                        i -= grandezzaQuadrato;
                }
            }
            //controllo un possibile gameOver in base al riempimento delle varie colonne
            boolean controlloColonna;
            for (int i = 0; i < 3 * width / 5; i += grandezzaQuadrato) {
                controlloColonna = forme.controlloColonna(i);
                if (controlloColonna) {
                    gameOver = true;
                    break;
                }
            }
        }
        checkFormaAttiva();
        tasto = 0;
    }

    private void checkFormaAttiva() {
        if (forme.getFormaAttiva() == null) {
            forme.inserisciNuova();
            formaGen = forme.getForma(forme.getNumEl() - 1);
        }else if( forme.getFormaAttiva().getNumElQuadrati() == 0){
            forme.disattivaFormaAttiva();
            forme.inserisciNuova();
            formaGen = forme.getForma(forme.getNumEl() - 1);
        }
    }

    private void repaint() {
        for (int k = 0; k < forme.getNumEl(); k++) {
            formaGen = forme.getForma(k);
            for (int j = 0; j < formaGen.getNumElQuadrati(); j++) //disegno figura passiva
            {
                parts = formaGen.getPos(j).split(";");
                pushMatrix();
                fill((formaGen.getColore()).getR(), (formaGen.getColore()).getG(), (formaGen.getColore()).getB());
                rect(Float.parseFloat(parts[0]), Float.parseFloat(parts[1]), grandezzaQuadrato, grandezzaQuadrato);
                popMatrix();
            }
        }
    }


    /**
     * @param valoreSeriale valore che rappresenta la direzione ('g' per giù)
     * @brief sposta una forma in basso
     * <p>
     * sposta e ridisegna una forma in basso dopo aver controllato il valore
     * passato come parametro e che sia possibile (posto non occupato da
     * un'altra forma e dentro la finestra). Disattiva la forma se è arrivata in
     * fondo. Modifica {@code parts} e {@code formaGen}
     * @see forme#spostaFiguraAttiva(char)
     */
    public void spostaGiu() {
        if (!forme.spostaAttivaGiu())
            forme.disattivaFormaAttiva();
    }

    public void spostaInFondo() {
        for (int i = 0; i < height / grandezzaQuadrato; i++) {
            if (!forme.spostaAttivaGiu())
                break;  //per velocizzare
        }
        giocatore.setPunteggio(20);
        //repaint();
    }

    /**
     * @return true se il valore letto è 1
     * @brief menù iniziale
     * <p>
     * disegna il menù iniziale e legge un valore da seriale, modifica
     * {@code valoreSeriale} e {@code contatoreSeriale}, collabora con {@code USB}
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
        text("Istruzioni:\npremere\n[a] per spostarsi a sinistra\n[d] per spostartsi a destra\n[s] per scendere\n[w] per ruotare\n[spazio] per scendere in fondo", 50, 320);
    }

    /**
     * @brief disegna la schermata di gioco
     * <p>
     * disegna la schermata di gioco con il nome del giocatore e il punteggio
     */
    public void schermataDiGioco() {

        //uso pushMatrix per non dover risettare i valori di fill
        pushMatrix();
        fill(0);
        rect(0, 0, 3 * width / 5, height);


        fill(255);
        rect(3 * width / 5, 0, 2 * width / 5, height);

        //scrittura dell'interfaccia con utente -punteggio, nickname -

        fill(255, 0, 0);
        textSize(24);
        text(giocatore.getNickname(), 3 * width / 5 + grandezzaQuadrato, 2 * grandezzaQuadrato + 150);
        text("Punteggio", 3 * width / 5 + grandezzaQuadrato, 4 * grandezzaQuadrato + 150);
        text(giocatore.getPunteggio(), 3 * width / 5 + grandezzaQuadrato, 6 * grandezzaQuadrato + 150);
        popMatrix();
    }


}