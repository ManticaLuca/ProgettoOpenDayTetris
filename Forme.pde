/**
 * @version 1.0
 * @brief classe che gestisce le forme
 */

public class Forme implements gameConstants{


    private Forma[] elementi;


    private int numEl;

    /**
     * @brief costruttore vuoto: inizializza {@code elementi} e {@code numEl}
    
     * @author Lamarque Matteo
     */
    public Forme() {
        elementi = new Forma[1000000];
        numEl = 0;
        inserisciNuova();
    }

    /**
     * @brief inserisci un nuovo elemento negli {@code elementi}. Posiziona ogni quadrato di {@code forme}({@code forma} è costituito da più quadrati uniti) in base alle loro {@code forma}(linea(4 linee in orizontale), quadrato(4 quadrati che ne formano uno pù grande), "l" normale, "l" rovesciata, ecc.)
         * In riassunto: 0 linea; 1 quadrato; 2 forma "l" normale; 3 forma
         * "l" rovesciata; 4 forma "z" normale; 5 forma "z" rovesciata; 6 forma
         * "t";
     * @author Lamarque Matteo
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
     * @brief controlla se una colonna è completamente occupata(per controllare se si ha perso), in tal caso ritorna "vero"
     * @params colonna da controllare
     * return vero(colonna occupata) o falso(colonna non occupata)
     * @author Lamarque Matteo
     */
    public boolean controlloColonna(int colonna) {
        int n = 0;
        String pos = "";
        Forma forma = new Forma();
        for (int i = 0; i < numEl; i++) {
            forma = elementi[i];
            for (int j = 0; j < 4; j++) {
                pos = forma.getPos(j);
                String parts[] = pos.split(";");
                int posY = Integer.parseInt(parts[0]);
                if (posY == colonna) {
                    n++;
                }
            }
        }
        int posYMax = 500;
        for (int i = 0; i < 4; i++) {
            pos = forma.getPos(i);
            String parts[] = pos.split(";");
            int posY = Integer.parseInt(parts[1]);
            if (posY < posYMax)
                posYMax = posY;
        }
        if (n > 17 || (!elementi[numEl - 1].getAttiva() && posYMax == 0)) {
            return true;
        }
        return false;
    }

    /**
     * @param posizioneY nell'asse delle Y
     * @brief elimina una tutti gli elementi(di conseguenza tutta la riga) con y uguale a quella data nel piano cartesiano. La eliminerà solo quando tutta la riga sarà occupata.
     * @author Lamarque Matteo
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
     * @brief ruota {@code forme} attiva(non ancora arrivata a contatto con le altre {@code forme}) tramite la sua forma, il verso e la sua posizione posizione. Ruota quindi ogni quadrato che la costituisce(ogni forma è costituita da più quadrati).
     
     * @author Lamarque Matteo
     */
    public void ruotaFiguraAttiva() {
        Forma forma = new Forma(elementi[numEl - 1]);
        println("PRIMA Forma = " + forma.toString());
        println("PRIMA elementi = " + elementi[numEl - 1].toString());

        int Forma = forma.getTipo();
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
     * @brief controlla se una riga è completamente occupata dalle figure per poi eliminarla se ritorna "true"
     * return "true" se la riga è completamente occupata, altrimenti "false"
     * @author Lamarque Matteo
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
            for(int i=0;i<numEl;i++){
                println(elementi[i].toString());
            }
            println("DOPO");
            cancellaRiga(riga);
            spostaFormaPassiva(riga);
            for(int i=0;i<numEl;i++){
                println(elementi[i].toString());
            }
            return true;
        }
        return false;
    }

    /**
     * @brief imposta  {@code figure} non attiva nel momento in cui va a contatto con le altre

     * @author Lamarque Matteo
     */
    public void disattivaFormaAttiva() {
        getFormaAttiva().setAttiva(false);
    }

    /**
     * @param posizione(x e y).
     * @return ritorna vero se è occupata e falso se non è occupata
     * @brief controlla se {@code forme} occupa una posizione data.
     * @author Lamarque Matteo
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
     * @brief sposta tutte le {@code forme} passive che hanno come y nel piano cartesiano una y data
     * @author Lamarque Matteo
     */
    public void spostaFormaPassiva(int posY) {
        for (int i = 0; i < numEl; i++) {
            //if (elementi[i].getAttiva() != true) {
            elementi[i].incremento(posY);
            //}
        }
    }

    /**
     * @return {@code numEl}
     * @brief prende {@code numEl}
     * @author Lamarque Matteo
     */
    public int getNumEl() {
        return numEl;
    }

    /**
     * @param posizione
     * @return forma
     * @brief prende {@code forme} dati gli {@code elementi}
     * @author Lamarque Matteo
     */
    public Forma getForma(int i) {
        return elementi[i];
    }

    /**
     * @param posizione da cercare
     * @return false
     * @brief cerca {@code elementi} data la posizione
     * @author Lamarque Matteo
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
     * @brief sposta la {@code forme} a destra
     * @author Lamarque Matteo
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
     * @brief sposta {@code forme} a sinistra
     * @author Lamarque Matteo
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
     * @brief sposta {@code forme} in basso
     * @author Lamarque Matteo
     */
    public boolean spostaAttivaGiu() {
        Forma formaGen = getFormaAttiva();
        int numQaudrati=formaGen.getNumElQuadrati();
        boolean[] vettore = new boolean[numQaudrati];

        for (int j = 0; j < numQaudrati; j++) {
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
     * @brief ottiene la forma attiva in quel momento
     * @return la forma attiva
     * @author Lamarque Matteo
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