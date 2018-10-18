package com.processing.sketch;

import java.util.*;

/**
 * @author Ferrareis Christian
 * @version 1.0
 * @brief Classe che gestisce il colore delle forme
 * <p>
 * Classe colore utilizzata da ProgettoOpenDayTetris, permette di gestire il colore delle forme
 */
public class Colore {


    /**
     * colore RED
     */
    private int r;
    /**
     * colore GREEN
     */
    private int g;
    /**
     * colore BLUE
     */
    private int b;

    /**
     * @brief costruttore vuoto
     */
    public Colore() {
        r = 0;
        g = 0;
        b = 0;
    }

    /**
     * @param c1 R
     * @param c2 G
     * @param c3 B
     * @brief costruttore della classe Colore
     */
    public Colore(int c1, int c2, int c3) {
        r = c1;
        g = c2;
        b = c3;
    }

    /**
     * @param c colore da copiare
     * @brief effettua una copia del colore dato
     */
    public Colore(Colore c) {
        r = c.getR();
        g = c.getG();
        b = c.getB();
    }

    /**
     * @return r il valore di R
     * @brief restituisce il valore di R
     */
    public int getR() {
        return r;
    }

    /**
     * @return r il valore di G
     * @brief restituisce il valore di G
     */
    public int getG() {
        return g;
    }

    /**
     * @return r il valore di B
     * @brief restituisce il valore di B
     */
    public int getB() {
        return b;
    }

    /**
     * @brief genera un colore calcolando valori random di R, G e B e li setta come attributi
     */
    public void calcolaRandom() {
        Random random = new Random();
        r = random.nextInt(254);
        g = random.nextInt(254);
        b = random.nextInt(254);
    }
}