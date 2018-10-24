package com.processing.sketch;

/**
 * @author Ferrareis Christian
 * @version 1.0
 * @brief Classe che gestisce i quadrati che costituiscono la forma
 */

public class Quadrato {
    /**
    * @author Ferrareis Christian
     * numero che rappresenta la coordinata x della posizione del quadrato sul piano
     */
    private int posizioneX;

    /**
     * @author Ferrareis Christian
     * numero che rappresenta la coordinata y della posizione del quadrato sul piano
     */
    private int posizioneY;

    /**
     * @author Ferrareis Christian
     * @brief costruttore vuoto che setta le coordinate {@code posizioneX} e {@code posizioneY} a 0
     */
    public Quadrato() {
        posizioneX = 0;
        posizioneY = 0;
    }

    /**
     * @author Ferrareis Christian
     * @param quad oggetto quadrato
     * @brief metodo che copia le coordinate {@code posizioneX} e {@code posizioneY} del quadrato che gli viene passato come parametro
     */
    public Quadrato(Quadrato quad) {
        posizioneX = quad.getPosizioneX();
        posizioneY = quad.getPosizioneY();
    }

    /**
     * @author Ferrareis Christian
     * @param posX numero che rappresenta la coordinata x
     * @brief metodo che permette di modificare la coordinata {@code posizioneX} del quadrato sul piano
     */
    public void setPosizioneX(int posX) {
        posizioneX = posX;
    }

    /**
     * @author Ferrareis Christian
     * @param posY numero che rappresenta la coordinata y
     * @brief metodo che permette di modificare la coordinata {@code posizioneY} del quadrato sul piano
     */
    public void setPosizioneY(int posY) {
        posizioneY = posY;
    }

    /**
     * @author Ferrareis Christian
     * @return posizioneX numero che rappresenta la coordinata x
     * @brief metodo che restituisce la coordinata {@code posizioneX} della posizione del quadrato sul piano
     */
    public int getPosizioneX() {
        return posizioneX;
    }

    /**
     * @author Ferrareis Christian
     * @return posizioneY numero che rappresenta la coordinata y
     * @brief metodo che restituisce la coordinata {@code posizioneY} della posizione del quadrato sul piano
     */
    public int getPosizioneY() {
        return posizioneY;
    }

    /**
     * @author Ferrareis Christian
     * @brief metodo che restituisce, sottoforma di stringa, le coordinate {@code posizioneX}, {@code posizioneY} della posizione del quadrato sul piano
     */
    public String toString() {
        return "pos(" + posizioneX + "," + posizioneY + ")";
    }
}
