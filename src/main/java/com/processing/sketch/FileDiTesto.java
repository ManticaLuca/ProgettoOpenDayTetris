package com.processing.sketch;

import processing.core.PApplet;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

/**
 * per intellij
 */
import static processing.core.PApplet.createReader;
import static processing.core.PApplet.split;
import static processing.core.PConstants.TAB;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * @author Mantica Luca
 * @brief la classe gestisce "classifica.txt"
 */


public class FileDiTesto {

    File file;
    /**
     * @brief numero di elementi all'interno del vettore
     */
    private int elementiPresenti;

    /**
     * @brief vettore di oggetti
     */
    private Giocatore vettore[];

    /**
     * @brief numero massimo di elemnti all'interno del vettore
     */
    private final int MAX = 100;

    /**
     * @brief costruttore, inizializzazione vettore
     */
    public FileDiTesto(String path) {
        /**
         * numero elementiPresenti nel vettore
         */
        elementiPresenti = 0;

        /**
         *inserisco dimensione al vettore
         */
        vettore = new Giocatore[MAX];


        file = new File(path + "\\classifica.txt");
        try {
            if (!file.exists()) {
                file.createNewFile();
            }
        } catch (IOException e) {
            e.printStackTrace();
            System.err.println("ERRORE FILE");
        }
    }

    /**
     * @param nome      nome del giocatore
     * @param punteggio punteggio del giocatore
     * @return variabile boolean di controllo successo scrittura
     * @brief inserisce il gioctore nel vettore e nel txt.
     * <p>
     * ciao
     */
    public boolean scriviSuFileESuVettore(String nome, int punteggio) {
        /*
         * dichiaro e setto variabile booleana a false
         */
        boolean scritto = false;

        try {

            /*
             * preparo il file per la scrittura
             */

            FileWriter fw = new FileWriter(file, true);
            BufferedWriter bw = new BufferedWriter(fw);

            /*
             * unisco i parametri, ovvero gli attributi del giocatore in una sola variabile
             */
            String stringa = nome + "," + punteggio;

            /*
             * preparo a scrivere su file
             */
            fw = new FileWriter(file, true);
            bw = new BufferedWriter(fw);

            /*
             * scrivo su file
             */
            bw.write(stringa + "\n");

            /*
             * libero la risorsa
             */
            bw.close();

            /*
             * inserisco nel vettore l'oggetto giocatore
             */
            vettore[elementiPresenti] = new Giocatore(nome, punteggio);

            /*
             * incremento numero di elementiPresenti
             */
            elementiPresenti++;

            /*
             * setto la variabile a true per dire che è avvenuto tutto con successo
             */
            scritto = true;

            /*
             * in caso di errore stampa la scritta ERRORE
             */
        } catch (IOException ex) {
            System.out.println("ERRORE");
        }

        /*
         * returno la variabile
         */
        return scritto;
    }

    /**
     * @return tuttoIlFile variabile contenente il file txt
     * @brief copia il file txt dentro a una variabile string
     */
    public String getFileDiTesto()  {

        /*
         * dichiaro variabile di tipo String per salvare poi in futuro tutto il file
         */
        String tuttoIlFile = "";
        try {
            /*
             * preparo per leggere il file
             */
            BufferedReader reader = new BufferedReader(new FileReader(file.getPath()));
            String line;

            /*
             * leggo la riga
             */
            line = reader.readLine();


            /*
             * salvo ogni riga del file dentro una variabile finchè il file non contiene alcuna riga
             */
            while (line != null) {

                tuttoIlFile = tuttoIlFile + line + ";";
                line = reader.readLine();
            }
        }catch(IOException e){
            e.printStackTrace();
            System.err.println("ERRORE FILE");
        }
        /*
         * returna tutto il file dentro una variabile
         */
        return tuttoIlFile;
    }

    /**
     * @return ordinato variabile booleana per sapere se l'ordinamento è avvenuto
     * @brief ordina il vettore e il txt dal giocatore col punteggio piu alto a quello piu basso
     */
    public boolean ordina() {

        /*
         * variabile booleana per sapere se l'ordinamento è avvenuto
         */
        boolean ordinato = false;

        /*
         * variabile di tipo String dove ci salverò ogni singola riga ad ogni giro
         */
        String line = " ";


        try {

            /*
             * dichiaro per leggere il file classifica.txt
             */
            BufferedReader reader = new BufferedReader(new FileReader(file.getPath()));
            FileWriter fw = new FileWriter(file, true);
            BufferedWriter bw = new BufferedWriter(fw);

            /*
             * eseguo il BubbleSort per ordinare il vettore dal giocatore col punteggio piu alto a quello piu basso
             * setto la variabile booleana a true per dire che è stato ordinato in modo corretto
             */
            for (int i = 0; i < elementiPresenti; i++) {
                for (int j = 0; j < elementiPresenti - 1; j++) {

                    if (vettore[j].getPunteggio() < vettore[j + 1].getPunteggio()) {
                        Giocatore temp = vettore[j];
                        vettore[j] = vettore[j + 1];
                        vettore[j + 1] = temp;
                        ordinato = true;
                    }
                }
            }

            /*
             * cancello il contenuto presente nel file
             */
            fw = new FileWriter(file, false);
            bw = new BufferedWriter(fw);

            /*
             * variabile di tipo String dove salverò poi tutto il file
             */
            String tutto = "";

            /*
             * mi preparo per leggere il file
             */
            fw = new FileWriter(file, true);
            bw = new BufferedWriter(fw);

            /*
             * scrivo sul file il vettore ordinato
             */
            for (int i = 0; i < elementiPresenti; i++) {
                tutto = vettore[i].getNickname() + "," + vettore[i].getPunteggio();

                bw.write(tutto + "\n");
                //bw.close();
            }
            bw.close();
        } catch (IOException ex) {
        }

        /*
         * returno la variabile ordinato
         */
        return ordinato;
    }

    /**
     * @brief visualizza gli elementi all'interno del vettore
     */
    public void visualizza() {
        for (int i = 0; i < elementiPresenti; i++) {
            System.out.println(vettore[i].toString());
        }
    }

//    /**
//     * @brief visualizza completamente il file txt
//     */
//    public void visualizzaClassifica() {
//        String line;
//        try {
//            int i = 0, y = 100, x = 250;
//            BufferedReader reader = createReader(new File(file.getPath()));
//            //prendo la prima linea
//            line = reader.readLine();
//
//            //prendo ogni linea del file e la scrivo incrementando la posizione
//            //continua fino a quando il file è finito
//            while (line != null) {
//                text("alla posizione " + i + ": " + line, x, y);
//                i++;
//                y = y + 20;
//                line = reader.readLine();
//            }
//        }
//
//        //stampa l'errore
//        catch (IOException e) {
//            e.printStackTrace();
//            line = null;
//        }
//        if (line == null) {
//            // Stop reading because of an error or file is empty
//        } else {
//            String[] pieces = split(line, TAB);
//            int x = Integer.parseInt(pieces[0]);
//            int y = Integer.parseInt(pieces[1]);
//            point(x, y);
//        }
//    }

}