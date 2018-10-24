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
    private int red;
    /**
     * colore GREEN
     */
    private int green;
    /**
     * colore BLUE
     */
    private int blue;

    /**
     * @brief costruttore vuoto
     */
    public Colore() {
        red = 0;
        green = 0;
        blue = 0;
    }

    /**
     * @param r R
     * @param g G
     * @param b B
     * @brief costruttore della classe Colore
     */
    public Colore(int r, int g, int b) {
        red = r;
        green = g;
        blue = b;
    }

    /**
     * @param c colore da copiare
     * @brief effettua una copia del colore dato
     */
    public Colore(Colore c) {
        red = c.getR();
        green = c.getG();
        blue = c.getB();
    }

    /**
     * @return r il valore di R
     * @brief restituisce il valore di R
     */
    public int getR() {
        return red;
    }

    /**
     * @return r il valore di G
     * @brief restituisce il valore di G
     */
    public int getG() {
        return green;
    }

    /**
     * @return r il valore di B
     * @brief restituisce il valore di B
     */
    public int getB() {
        return blue;
    }

    /**
     * @brief imposta il colore in base ai parametri
     * @param red rosso
     * @param green verde
     * @param blue blu
     */
    public void setColore(int red, int green, int blue) {
        this.blue = blue;
        this.green = green;
        this.red = red;
    }
}