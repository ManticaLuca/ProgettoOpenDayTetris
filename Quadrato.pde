/**
 * @author Ferrareis Christian
 * @version 1.0
 * @brief Classe che gestisce i quadrati che costituiscono la forma
 */

public class Quadrato {
    /**
     * numero che rappresenta la coordinata x della posizione del quadrato sul piano
     
    * @author Ferrareis Christian
     */
    private int posizioneX;

    /**
     * numero che rappresenta la coordinata y della posizione del quadrato sul piano
    
    * @author Ferrareis Christian
     */
    private int posizioneY;

    /**
     * @brief costruttore vuoto che setta le coordinate {@code posizioneX} e {@code posizioneY} a 0
    * @author Ferrareis Christian
    */
    public Quadrato() {
        posizioneX = 0;
        posizioneY = 0;
    }

    /**
     * @param quad oggetto quadrato
     * @brief metodo che copia le coordinate {@code posizioneX} e {@code posizioneY} del quadrato che gli viene passato come parametro
     * @author Ferrareis Christian
     */
    public Quadrato(Quadrato quad) {
        posizioneX = quad.getPosizioneX();
        posizioneY = quad.getPosizioneY();
    }

    /**
     * @param posX numero che rappresenta la coordinata x
     * @brief metodo che permette di modificare la coordinata {@code posizioneX} del quadrato sul piano
     * @author Ferrareis Christian
     */
    public void setPosizioneX(int posX) {
        posizioneX = posX;
    }

    /**
     * @param posY numero che rappresenta la coordinata y
     * @brief metodo che permette di modificare la coordinata {@code posizioneY} del quadrato sul piano
     * @author Ferrareis Christian
     */
    public void setPosizioneY(int posY) {
        posizioneY = posY;
    }

    /**
     * @return posizioneX numero che rappresenta la coordinata x
     * @brief metodo che restituisce la coordinata {@code posizioneX} della posizione del quadrato sul piano
     * @author Ferrareis Christian
     */
    public int getPosizioneX() {
        return posizioneX;
    }

    /**
     * @return posizioneY numero che rappresenta la coordinata y
     * @brief metodo che restituisce la coordinata {@code posizioneY} della posizione del quadrato sul piano
     * @author Ferrareis Christian
     */
    public int getPosizioneY() {
        return posizioneY;
    }

    /**
     * @brief metodo che restituisce, sottoforma di stringa, le coordinate {@code posizioneX}, {@code posizioneY} della posizione del quadrato sul piano
   
    * @author Ferrareis Christian
     */
    public String toString() {
        return "pos(" + posizioneX + "," + posizioneY + ")";
    }
}
