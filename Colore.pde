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
     * @author Ferrareis Christian
     */
    private int red;
    /**
     * colore GREEN
     * @author Ferrareis Christian
     */
    private int green;
    /**
     * colore BLUE
     * @author Ferrareis Christian
     */
    private int blue;

    /**
     * @brief costruttore vuoto che porta a 0 {@code red}, {@code green} e {@code blue
     * @author Ferrareis Christian
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
     * @brief costruttore della classe Colore, assegna i valori dati a  {@code red}, {@code green} e {@code blue}
     * @author Ferrareis Christian
     */
    public Colore(int r, int g, int b) {
        red = r;
        green = g;
        blue = b;
    }

    /**
     * @param c colore da copiare
     * @brief effettua una copia del colore passato, va quindi a ad assegnare a {@code red}, {@code green} e {@code blue} i valori rgb del Colore passato
     * @author Ferrareis Christian
     */
    public Colore(Colore c) {
        red = c.getR();
        green = c.getG();
        blue = c.getB();
    }

    /**
     * @return r il valore di red
     * @brief restituisce il valore di {@code red}
     * @author Ferrareis Christian
     */
    public int getR() {
        return red;
    }

    /**
     * @return r il valore di green
     * @brief restituisce il valore di {@code green}
     * @author Ferrareis Christian
     */
    public int getG() {
        return green;
    }

    /**
     * @return r il valore di blue
     * @brief restituisce il valore di {@code blue}
     * @author Ferrareis Christian
     */
    public int getB() {
        return blue;
    }

    /**
     * @brief imposta il colore in base ai parametri, va quindi a modificare {@code red}, {@code green} e {@code blue}
     * @param red rosso
     * @param green verde
     * @param blue blu
     * @author Ferrareis Christian
     */
    public void setColore(int red, int green, int blue) {
        this.blue = blue;
        this.green = green;
        this.red = red;
    }
}
