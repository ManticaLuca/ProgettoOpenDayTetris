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
     * @author Ferrareis Christian
     * colore RED
     */
    private int red;
    /**
     * @author Ferrareis Christian
     * colore GREEN
     */
    private int green;
    /**
     * @author Ferrareis Christian
     * colore BLUE
     */
    private int blue;

    /**
     * @author Ferrareis Christian
     * @brief costruttore vuoto che porta a 0 gli attributi red, green e blue
     */
    public Colore() {
        red = 0;
        green = 0;
        blue = 0;
    }

    /**
     * @author Ferrareis Christian
     * @param r R
     * @param g G
     * @param b B
     * @brief costruttore della classe Colore, assegna i valori dati agli attributi red, green e blue 
     */
    public Colore(int r, int g, int b) {
        red = r;
        green = g;
        blue = b;
    }

    /**
     * @author Ferrareis Christian
     * @param c colore da copiare
     * @brief effettua una copia del colore passato, va quindi a ad assegnare agli attributi red, green e blue i valori rgb del Colore passato
     */
    public Colore(Colore c) {
        red = c.getR();
        green = c.getG();
        blue = c.getB();
    }

    /**
     * @author Ferrareis Christian
     * @return r il valore di R
     * @brief restituisce il valore di R
     */
    public int getR() {
        return red;
    }

    /**
     * @author Ferrareis Christian
     * @return r il valore di G
     * @brief restituisce il valore di G
     */
    public int getG() {
        return green;
    }

    /**
     * @author Ferrareis Christian
     * @return r il valore di B
     * @brief restituisce il valore di B
     */
    public int getB() {
        return blue;
    }

    /**
     * @author Ferrareis Christian
     * @brief imposta il colore in base ai parametri, va quindi a modificare gli attributi
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
