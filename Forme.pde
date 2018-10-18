
/**
 * @author commenti Lamarque Matteo
 * @version 1.0
 * @brief classe che gestisce le forme
 */

public class Forme {

  public static final int grandezzaQuadrato = 25;

  private Forma[] elementi;


  private int numEl;

  /**
   * @brief costruttore vuoto: inizializza il vettore di elementi e il numero di elementi
   */
  public Forme() {
    elementi = new Forma[1000000];
    numEl = 0;
    inserisciNuova();
  }

  /**
   * @brief inserisci un nuovo elemento nel vettore. Posiziona ogni quadrato della forma(la forma è costituita da più quadrati uniti) in base alle loro forma(linea(4 linee in orizontale), quadrato(4 quadrati che ne formano uno pù grande), "l" normale, "l" rovesciata, ecc.)
   */
  public void inserisciNuova() {
    elementi[numEl] = new Forma();
    numEl++;
    switch (elementi[numEl - 1].getTipo()) {
    case 0:
      elementi[numEl - 1].setPos(100, 0, 0);
      elementi[numEl - 1].setPos(125, 0, 1);
      elementi[numEl - 1].setPos(150, 0, 2);
      elementi[numEl - 1].setPos(175, 0, 3);
      break;
    case 1:
      elementi[numEl - 1].setPos(125, 0, 0);
      elementi[numEl - 1].setPos(150, 0, 1);
      elementi[numEl - 1].setPos(125, 25, 2);
      elementi[numEl - 1].setPos(150, 25, 3);
      break;
    case 2:
      elementi[numEl - 1].setPos(125, 0, 0);
      elementi[numEl - 1].setPos(150, 0, 1);
      elementi[numEl - 1].setPos(150, 25, 2);
      elementi[numEl - 1].setPos(150, 50, 3);
      break;
    case 3:
      elementi[numEl - 1].setPos(125, 0, 0);
      elementi[numEl - 1].setPos(150, 0, 1);
      elementi[numEl - 1].setPos(125, 25, 2);
      elementi[numEl - 1].setPos(125, 50, 3);
      break;
    case 4:
      elementi[numEl - 1].setPos(150, 0, 0);
      elementi[numEl - 1].setPos(150, 25, 1);
      elementi[numEl - 1].setPos(125, 25, 2);
      elementi[numEl - 1].setPos(125, 50, 3);
      break;
    case 5:
      elementi[numEl - 1].setPos(125, 0, 0);
      elementi[numEl - 1].setPos(125, 25, 1);
      elementi[numEl - 1].setPos(150, 25, 2);
      elementi[numEl - 1].setPos(150, 50, 3);
      break;
    case 6:
      elementi[numEl - 1].setPos(125, 0, 0);
      elementi[numEl - 1].setPos(125, 25, 1);
      elementi[numEl - 1].setPos(125, 50, 2);
      elementi[numEl - 1].setPos(150, 25, 3);
      break;
    }
  }

  /**
   * @brief controlla se una colonna è completamente occupata(per controllare se si ha perso), in tal caso ritorna true
   *
   * @return true se la colonna è piena
   */
  public boolean controlloColonna(int colonna) {
    int n = 0;
    String pos = "";
    Forma forma = new Forma();
    for (int i = 0; i < numEl; i++) {
      forma = elementi[i];
      for (int j = 0; j < forma.getNumElQuadrati(); j++) {
        pos = forma.getPos(j);
        String parts[] = pos.split(";");
        int posY = Integer.parseInt(parts[0]);
        if (posY == colonna) {
          n++;
        }
      }
    }
    if (getFormaAttiva()!=null) {
      for (int i = 0; i < getFormaAttiva().getNumElQuadrati(); i++) {
        pos = forma.getPos(i);
        String parts[] = pos.split(";");
        int posX= Integer.parseInt(parts[0]);
        println(posX);
        if (n > 17 && posX==colonna) {
          return true;
        }
      }
    }
    return false;
  }

  /**
   * @param posizioneY nell'asse delle Y
   * @brief elimina una tutti gli elementi(di conseguenza tutta la riga) con y uguale a quella data nel piano cartesiano.
   */
  public void cancellaRiga(int posizioneY) {
    Forma forma = new Forma();
    String pos;
    for (int i = 0; i < numEl; i++) {
      forma = elementi[i];
      for (int j = 0; j < forma.getNumElQuadrati(); j++) {
        pos = forma.getPos(j);
        String parts[] = pos.split(";");
        int posY = Integer.parseInt(parts[1]);
        if (posY == posizioneY) {
          forma.cancellaQuadrato(posizioneY);
        }
      }
    }
  }

  /**
   * @brief ruota una figura attiva(non ancora arrivata alla fine) tramite la sua forma, il verso e la sua posizione posizione. Ruota quindi ogni quadrato che la costituisce(ogni forma è costituita da più quadrati).
   */
  public void ruotaFiguraAttiva() {
    Forma forma = new Forma(elementi[numEl - 1]);
    println("PRIMA Forma = " + forma.toString());
    println("PRIMA elementi = " + elementi[numEl - 1].toString());

    int Forma = forma.getTipo();
    /*
         * set della forma; 0 linea; 1 quadrato; 2 forma "l" normale; 3 forma
     * "l" rovesciata; 4 forma "z" normale; 5 forma "z" rovesciata; 6 forma
     * "t";
     */
    String pos;
    int posY = -1, posX = -1;
    switch (Forma) {
    case 0:
      pos = forma.getPos(3);
      String parts[] = pos.split(";");
      posY = Integer.parseInt(parts[1]);
      posX = Integer.parseInt(parts[0]);
      if (forma.getVerso() == 1) {
        forma.setVerso(2);
        forma.setPos(posX, posY - 75, 0);
        forma.setPos(posX, posY - 50, 1);
        forma.setPos(posX, posY - 25, 2);
      } else {
        forma.setVerso(1);
        forma.setPos(posX - 75, posY, 0);
        forma.setPos(posX - 50, posY, 1);
        forma.setPos(posX - 25, posY, 2);
      }
      break;
    case 2:
      pos = forma.getPos(2);
      String parts2[] = pos.split(";");
      posY = Integer.parseInt(parts2[1]);
      posX = Integer.parseInt(parts2[0]);
      switch (forma.getVerso()) {
      case 1:
        forma.setVerso(2);
        forma.setPos(posX + 25, posY - 25, 0);
        forma.setPos(posX + 25, posY, 1);
        forma.setPos(posX - 25, posY, 3);
        break;
      case 2:
        forma.setVerso(3);
        forma.setPos(posX + 25, posY + 25, 0);
        forma.setPos(posX, posY + 25, 1);
        forma.setPos(posX, posY - 25, 3);
        break;
      case 3:
        forma.setVerso(4);
        forma.setPos(posX - 25, posY + 25, 0);
        forma.setPos(posX - 25, posY, 1);
        forma.setPos(posX + 25, posY, 3);
        break;
      case 4:
        forma.setVerso(1);
        forma.setPos(posX - 25, posY - 25, 0);
        forma.setPos(posX, posY - 25, 1);
        forma.setPos(posX, posY + 25, 3);
        break;
      }
      break;
    case 3:
      pos = forma.getPos(2);
      String parts3[] = pos.split(";");
      posY = Integer.parseInt(parts3[1]);
      posX = Integer.parseInt(parts3[0]);
      switch (forma.getVerso()) {
      case 1:
        forma.setVerso(2);
        forma.setPos(posX + 25, posY, 0);
        forma.setPos(posX + 25, posY + 25, 1);
        forma.setPos(posX - 25, posY, 3);
        break;
      case 2:
        forma.setVerso(3);
        forma.setPos(posX, posY + 25, 0);
        forma.setPos(posX - 25, posY + 25, 1);
        forma.setPos(posX, posY - 25, 3);
        break;
      case 3:
        forma.setVerso(4);
        forma.setPos(posX - 25, posY, 0);
        forma.setPos(posX - 25, posY - 25, 1);
        forma.setPos(posX + 25, posY, 3);
        break;
      case 4:
        forma.setVerso(1);
        forma.setPos(posX, posY - 25, 0);
        forma.setPos(posX + 25, posY - 25, 1);
        forma.setPos(posX, posY + 25, 3);
        break;
      }
      break;
    case 4:
      pos = forma.getPos(1);
      String parts4[] = pos.split(";");
      posY = Integer.parseInt(parts4[1]);
      posX = Integer.parseInt(parts4[0]);
      if (forma.getVerso() == 1) {
        forma.setVerso(2);
        forma.setPos(posX + 25, posY, 0);
        forma.setPos(posX, posY - 25, 2);
        forma.setPos(posX - 25, posY - 25, 3);
      } else {
        forma.setVerso(1);
        forma.setPos(posX, posY - 25, 0);
        forma.setPos(posX - 25, posY, 2);
        forma.setPos(posX - 25, posY + 25, 3);
      }
      break;
    case 5:
      pos = forma.getPos(1);
      String parts5[] = pos.split(";");
      posY = Integer.parseInt(parts5[1]);
      posX = Integer.parseInt(parts5[0]);
      if (forma.getVerso() == 1) {
        forma.setVerso(2);
        forma.setPos(posX + 25, posY, 0);
        forma.setPos(posX, posY + 25, 2);
        forma.setPos(posX - 25, posY + 25, 3);
      } else {
        forma.setVerso(1);
        forma.setPos(posX, posY - 25, 0);
        forma.setPos(posX + 25, posY, 2);
        forma.setPos(posX + 25, posY + 25, 3);
      }
      break;
    case 6:
      pos = forma.getPos(1);
      String parts6[] = pos.split(";");
      posY = Integer.parseInt(parts6[1]);
      posX = Integer.parseInt(parts6[0]);
      switch (forma.getVerso()) {
      case 1:
        forma.setVerso(2);
        forma.setPos(posX + 25, posY, 0);
        forma.setPos(posX - 25, posY, 2);
        forma.setPos(posX, posY + 25, 3);
        break;
      case 2:
        forma.setVerso(3);
        forma.setPos(posX, posY + 25, 0);
        forma.setPos(posX, posY - 25, 2);
        forma.setPos(posX - 25, posY, 3);
        break;
      case 3:
        forma.setVerso(4);
        forma.setPos(posX - 25, posY, 0);
        forma.setPos(posX + 25, posY, 2);
        forma.setPos(posX, posY - 25, 3);
        break;
      case 4:
        forma.setVerso(1);
        forma.setPos(posX, posY - 25, 0);
        forma.setPos(posX, posY + 25, 2);
        forma.setPos(posX + 25, posY, 3);
        break;
      }
      break;
    }

    boolean[] vettore = new boolean[forma.getNumElQuadrati()];
    for (int i = 0; i < forma.getNumElQuadrati(); i++) {
      pos = forma.getPos(i);
      String parts[] = pos.split(";");
      posX = Integer.parseInt(parts[0]);

      println("forma.posX = " + posX);
      if (posX < 0 || posX > 275) {
        vettore[i] = false;
        break;
      }
      vettore[i]=ricerca(forma.getQuad(i).getPosizioneX(), forma.getQuad(i).getPosizioneY());
    }

    boolean possibile = true;
    for (int k = 0; k < vettore.length; k++) {
      if (!vettore[k]) {
        possibile = false;
        break;
      }
    }
    println("DOPO Forma = " + forma.toString());
    println("DOPO elementi = " + elementi[numEl - 1].toString());

    if (possibile) {
      println("possibile forma.posX = " + posX);
      elementi[numEl - 1] = forma;
    }
  }



  /**
   * @param riga da controllare
   * @brief controlla se una riga è completamente occupata dalle figure
   */
  public boolean controlloRigaCompleta(int riga) {
    int n = 0;
    String pos = "";
    Forma forma;
    for (int i = 0; i < numEl; i++) {
      forma = elementi[i];
      for (int j = 0; j < forma.getNumElQuadrati(); j++) {
        pos = forma.getPos(j);
        String parts[] = pos.split(";");
        int posY = Integer.parseInt(parts[1]);
        if (posY == riga) {
          n++;
        }
      }
    }
    println("riga: "+riga+"n: "+n);
    if (n == 12 /*&& ricerca(475)*/) {
      for (int i=0; i<numEl; i++) {
        println(elementi[i].toString());
      }
      println("DOPO");
      cancellaRiga(riga);
      spostaFormaPassiva(riga);
      for (int i=0; i<numEl; i++) {
        println(elementi[i].toString());
      }
      return true;
    }
    return false;
  }

  /**
   * @brief imposta una figura non attiva nel momento in cui va a contatto con le altre
   */
  public void disattivaFormaAttiva() {
    getFormaAttiva().setAttiva(false);
  }

  /**
   * @param posizione(x e y).
   * @return ritorna vero se è occupata e falso se non è occupata
   * @brief controlla se una forma occupa una posizione data.
   */
  public boolean ricerca(int posX, int posY) {
    for (int i = 0; i < numEl - 1; i++) {
      if (elementi[i].ricerca(posX, posY))
        return false;
    }
    return true;
  }

  /**
   * @param posizione dell'y nel piano cartesiano
   * @brief sposta tutte le forme passive che hanno come y nel piano cartesiano una y data
   */
  public void spostaFormaPassiva(int posY) {
    for (int i = 0; i < numEl; i++) {
      //if (elementi[i].getAttiva() != true) {
      elementi[i].incremento(posY);
      //}
    }
  }

  /**
   * @return numero di elementi
   * @brief prende il numero di elementi
   */
  public int getNumEl() {
    return numEl;
  }

  /**
   * @param posizione
   * @return forma
   * @brief prende la forma data la posizione
   */
  public Forma getForma(int i) {
    return elementi[i];
  }

  /**
   * @param posizione da cercare
   * @return false
   * @brief cerca un elemento data la posizione
   */
  public boolean ricerca(int posY) {
    for (int i = 0; i < elementi[numEl - 1].getNumElQuadrati(); i++) {

      String parts[];
      parts = elementi[numEl - 1].getPos(i).split(";");
      int posizioneY = Integer.parseInt(parts[1]);

      if (posizioneY == posY)
        return true;
    }

    return false;
  }

  /**
   * @brief sposta la figura attiva a destra
   *
   * sposta la figura attiva a destra sopo aver effettuato i controlli
   * @return true se è possibile spostarla, false in caso contrario
   */
  public boolean spostaAttivaDestra() {
    //sposto in base al valore seriale destro
    Forma forma =  getFormaAttiva();
    int numQaudrati=forma.getNumElQuadrati();
    boolean[] vettore = new boolean[numQaudrati];

    for (int j = 0; j < numQaudrati; j++) {
      String[] parts = (getForma(getNumEl() - 1)).getPos(j).split(";");

      if (Integer.parseInt(parts[0]) != 500 * 3 / 5 - grandezzaQuadrato) {
        vettore[j] = ricerca(Integer.parseInt(parts[0]) + grandezzaQuadrato, Integer.parseInt(parts[1]));
      } else {
        vettore[j] = false;
      }
    }

    boolean possibile = true;
    for (int k = 0; k < vettore.length; k++) {
      if (!vettore[k]) {
        possibile = false;
        break;
      }
    }
    if (possibile) {
      for (int i = 0; i < 4; i++) {
        String pos = forma.getPos(i);
        String parts[] = pos.split(";");
        int posY = Integer.parseInt(parts[1]);
        int posX = Integer.parseInt(parts[0]);
        forma.setPos(posX + 25, posY, i);
      }
    }
    return possibile;
  }

  /**
   * @brief sposta la figura attiva a sinistra
   *
   * sposta la figura attiva a sinistra sopo aver effettuato i controlli
   * @return true se è possibile spostarla, false in caso contrario
   */
  public boolean spostaAttivaSinistra() {
    Forma forma = getFormaAttiva();
    //sposto in base al valore seriale sinistro
    int numQaudrati=forma.getNumElQuadrati();
    boolean[] vettore = new boolean[numQaudrati];
    for (int j = 0; j < numQaudrati; j++) {
      String[] parts = forma.getPos(j).split(";");

      if (Integer.parseInt(parts[0]) != 0) {
        vettore[j] = ricerca(Integer.parseInt(parts[0]) - grandezzaQuadrato, Integer.parseInt(parts[1]));
      } else {
        vettore[j] = false;
      }
    }

    boolean possibile = true;
    for (int k = 0; k < vettore.length; k++) {
      if (!vettore[k]) {
        possibile = false;
        break;
      }
    }
    if (possibile)
      for (int i = 0; i < 4; i++) {
        String pos = forma.getPos(i);
        String parts[] = pos.split(";");
        int posY = Integer.parseInt(parts[1]);
        int posX = Integer.parseInt(parts[0]);
        forma.setPos(posX - 25, posY, i);
      }
    return possibile;
  }

  /**
   * @brief sposta la figura attiva in basso
   *
   * sposta la figura attiva in basso sopo aver effettuato i controlli
   * @return true se è possibile spostarla, false in caso contrario
   */
  public boolean spostaAttivaGiu() {
    Forma formaGen = getFormaAttiva();
    int numQuadrati=formaGen.getNumElQuadrati();
    boolean[] vettore = new boolean[numQuadrati];

    for (int j = 0; j < numQuadrati; j++) {
      String[] parts = formaGen.getPos(j).split(";");
      if (Integer.parseInt(parts[1]) != 500 - grandezzaQuadrato) {
        vettore[j] = ricerca(Integer.parseInt(parts[0]), Integer.parseInt(parts[1]) + grandezzaQuadrato);
      } else {
        vettore[j] = false;
      }
    }

    boolean possibile = true;
    for (int k = 0; k < vettore.length; k++) {
      if (!vettore[k]) {
        possibile = false;
        break;
      }
    }
    if (possibile) {
      for (int i = 0; i < 4; i++) {
        String pos = formaGen.getPos(i);
        String parts[] = pos.split(";");
        int posY = Integer.parseInt(parts[1]);
        int posX = Integer.parseInt(parts[0]);
        formaGen.setPos(posX, posY + 25, i);
      }
    }
    return possibile;
  }

  /**
   * @brief restituisce la forma attiva
   *
   * @return la forma attiva
   */
  public Forma getFormaAttiva() {
    Forma attiva = null;
    for (int i = numEl-1; i >=0; i--) {   //parto dal fondo perchè probabilmente sarà l'ultima
      if (elementi[i].getAttiva()) {
        attiva = elementi[i];
        break;      //per velocizzare
      }
    }
    return attiva;
  }
}