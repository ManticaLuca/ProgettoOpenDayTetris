package com.processing.sketch;

/**
 * @author Ferrareis Christian
 * @version 1.0
 * @brief Classe che gestisce i quadrati che costituiscono la forma
 */

public class Quadrato {
    /**
     * numero che rappresenta la coordinata x della posizione del quadrato sul piano
     */
    private int posizioneX;

    /**
     * numero che rappresenta la coordinata y della posizione del quadrato sul piano
     */
    private int posizioneY;

    /**
     * @brief costruttore vuoto che setta le coordinate a 0
     */
    public Quadrato() {
        posizioneX = 0;
        posizioneY = 0;
    }

    /**
     * @param quad oggetto quadrato
     * @brief metodo che copia le coordinate x e y del quadrato che gli viene passato come parametro
     */
    public Quadrato(Quadrato quad) {
        posizioneX = quad.getPosizioneX();
        posizioneY = quad.getPosizioneY();
    }

    /**
     * @param posX numero che rappresenta la coordinata x
     * @brief metodo che permette di modificare la coordinata x del quadrato sul piano
     */
    public void setPosizioneX(int posX) {
        posizioneX = posX;
    }

    /**
     * @param posY numero che rappresenta la coordinata y
     * @brief metodo che permette di modificare la coordinata y del quadrato sul piano
     */
    public void setPosizioneY(int posY) {
        posizioneY = posY;
    }

    /**
     * @return posizioneX numero che rappresenta la coordinata x
     * @brief metodo che restituisce la coordinata x della posizione del quadrato sul piano
     */
    public int getPosizioneX() {
        return posizioneX;
    }

    /**
     * @return posizioneY numero che rappresenta la coordinata y
     * @brief metodo che restituisce la coordinata y della posizione del quadrato sul piano
     */
    public int getPosizioneY() {
        return posizioneY;
    }

    /**
     * @brief metodo che restituisce, sottoforma di stringa, le coordinate della posizione del quadrato sul piano
     */
    public String toString() {
        return "pos(" + posizioneX + "," + posizioneY + ")";
    }
}