
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
   * @brief imposta il colore della forma dato il numero rappresentante il tipo: 0 linea azzurra; 1 quadrato giallo; 2 forma "l" arancione; 3 forma "j" blu; 4 forma "z" rosso;
   * 5 forma "s" verde; 6 forma"t" viola;
   */
  public void setColore(int tipo) {
    switch(tipo) {
    case 0:
      red = 51;
      green = 204;
      blue = 255;
      break;
    case 1:
      red = 255;
      green = 255;
      break;
    case 2:
      red = 255;
      green = 153;
      break;
    case 3:
      blue = 255;
      break;
    case 4:
      red = 255;
      break;
    case 5:
      green = 255;
      break;
    case 6:
      red = 204;
      blue = 253;
      break;
    }
  }
}