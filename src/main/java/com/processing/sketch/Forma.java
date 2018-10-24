package com.processing.sketch;



import java.util.Random;

/**
 * @author Ferrareis Christian
 * @version 1.0
 * @brief Classe che gestisce la forma degli oggetti.
 *
 * Classe colore utilizzata da ProgettoOpenDayTetris, permette di gestire la forma degli oggetti
 */

public class Forma {

    /**
     * @author Ferrareis Christian
     * vettore formato da un'insieme di quadrati
     */
    private Quadrato[] insiemeQuadrati;

    /**
     * @author Ferrareis Christian
     * numero di quadrati utlizzati per la forma dell'oggetto
     */
    private int numElQuadrati;

    /**
     * @author Ferrareis Christian
     * colore dell'oggetto
     */
    private Colore colore;

    /**
     * @author Ferrareis Christian
     * variabile che decide sullo stato di attivazione dell'oggetto
     */
    private boolean attiva;

    /**
     * @author Ferrareis Christian
     * variabile numerica che rappresenta il tipo di forma
     */
    private int forma;

    /**
     * @author Ferrareis Christian
     * variabile numerica che rappresenta il verso di orientamento dell'oggetto, sopra, sotto, destra o sinistra
     */
    private int verso;

    /**
     * @author Ferrareis Christian
     * @brief costruttore vuoto, che crea una forma casuale, le assegna un colore casuale e infine la attiva. Va ad assegnare dei valori gli attributi forma, verso, 
       attiva, colore e numElQuadrati e aggiunge al vettore insiemeQuadrati i quadrati che compongono la forma.
     */
    public Forma() {
        colore = new Colore();
        verso = 1;
        attiva = true;
        numElQuadrati=4;
        /**
         * set della forma; 0 linea; 1 quadrato; 2 forma "l"; 3 forma "j"; 4 forma "z"; 5 forma "s"; 6 forma"t";
         */
        Random random = new Random();
        forma = random.nextInt(7);
        insiemeQuadrati = new Quadrato[numElQuadrati];
        for (int i = 0; i < numElQuadrati; i++) {
            insiemeQuadrati[i] = new Quadrato();
            //numElQuadrati++;
        }
        setColore();
    }

    /**
     * @author Ferrareis Christian
     * @brief imposta il colore (quindi modifica gli attributi red, green, blue della classe colore) della forma tipo: 0 linea azzurra; 1 quadrato giallo; 2 forma "l" arancione; 3 forma "j" blu; 4 forma "z" rosso;
     * 5 forma "s" verde; 6 forma"t" viola.
     */
    public void setColore(){
        switch(forma) {
            case 0:
                colore.setColore(51,204,255);
                break;
            case 1:
                colore.setColore(255,255,0);
                break;
            case 2:
                colore.setColore(255,153,0);
                break;
            case 3:
                colore.setColore(0,0,255);
                break;
            case 4:
                colore.setColore(255,0,0);
                break;
            case 5:
                colore.setColore(0,255,0);
                break;
            case 6:
                colore.setColore(204,0,253);
                break;
        }
    }

    /**
     * @author Ferrareis Christian
     * @param f oggetto forma che gli viene passato
     * @brief costruttore che copia negli attributi colore, attiva, verso, forma e numElQuadrati i parametri della forma che gli viene passata e infine ne crea la forma
     */
    public Forma(Forma f) {
        colore = new Colore(f.colore);
        attiva = f.attiva;
        verso = f.verso;
        forma = f.forma;
        numElQuadrati=f.numElQuadrati;
        /**
         * set della forma; 0 linea; 1 quadrato; 2 forma "l" normale; 3 forma
         * "l" rovesciata; 4 forma "z" normale; 5 forma "z" rovesciata; 6 forma
         * "t";*/


        insiemeQuadrati = new Quadrato[numElQuadrati];
        for (int i = 0; i < numElQuadrati; i++) {
            insiemeQuadrati[i] = new Quadrato(f.getQuad(i));
            //numElQuadrati++;
        }
    }

    /**
     * @author Ferrareis Christian
     * @param pos posizione del quadrato nel vettore
     * @return oggetto quadrato
     * @brief metodo che ritorna il quadrato contenuto nel vettore insiemeQuadrati di cui viene passata la posizione
     */
    public Quadrato getQuad(int pos) {
        return insiemeQuadrati[pos];
    }

    /**
     * @author Ferrareis Christian
     * @param posY coordinata y del quadrato da cancellare
     * @brief metodo per cancellare un quadrato in caso sia presente una riga completa, decrementa l'attributo numElQuadrati e 
       cancella un quadrato dal vettore insiemeQuadrati.
     */
    public void cancellaQuadrato(int posY) {
        int i = 0;
        while (i < numElQuadrati) {
            if (insiemeQuadrati[i].getPosizioneY() == posY) {
                for (int j = i; j < numElQuadrati - 1; j++) {
                    insiemeQuadrati[j] = insiemeQuadrati[j + 1];
                }
                numElQuadrati--;
            } else
                i++;
        }
    }

    /**
     * @author Ferrareis Christian
     * @return boolean true se il quadrato è effettivamente presente all'interno del vettore, false se non lo è
     * @brief metodo che controlla se nel vettore insiemeQuadrati è presente il quadrato di cui viene data la posizione x, y, 
     * @par posX coordinata x
     * @par posY coordinata y
     */
    public boolean ricerca(int posX, int posY) {
        for (int i = 0; i < numElQuadrati; i++) {
            if (insiemeQuadrati[i].getPosizioneX() == posX && insiemeQuadrati[i].getPosizioneY() == posY) {
                return true;
            }
        }
        return false;
    }

    /**
     * @author Ferrareis Christian
     * @param i posizione del quadrato nel vettore
     * @return posizione coordinate del quadrato sottoforma di stringa
     * @brief metodo che ritorna, sotto forma di stringa, le coordinate x, y (attributo posizione) del quadrato del vettore insiemeQuadrati di cui viene data la posizione nel vettore
     */
    public String getPos(int i) {
        String posizione = Integer.toString(insiemeQuadrati[i].getPosizioneX()) + ";" + Integer.toString(insiemeQuadrati[i].getPosizioneY());
        return posizione;
    }

    /**
     * @author Ferrareis Christian
     * @return attiva stato di attivazione
     * @brief metodo che ritorna attiva, quindi lo stato di attivazione dell'oggetto forma
     */
    public boolean getAttiva() {
        return attiva;
    }

    /**
     * @author Ferrareis Christian
     * @return forma numero che rappresenta il tipo di forma
     * @brief metodo che ritorna forma, quindi il tipo di forma dell'oggetto forma
     */
    public int getTipo() {
        return forma;
    }

    /**
     * @author Ferrareis Christian
     * @return verso numero che rappresenta il verso dell'oggetto forma
     * @brief metodo che ritorna verso, quindi il verso di orientamento dell'oggetto forma
     */
    public int getVerso() {
        return verso;
    }

    /**
     * @author Ferrareis Christian
     * @return numElQuadrati numero di quadrati
     * @brief metodo che ritorna numElQuadrati, quindi il numero di quadrati utilizzati dall'oggetto forma
     */
    public int getNumElQuadrati() {
        return numElQuadrati;
    }

    /**
     * @author Ferrareis Christian
     * @return colore colore dell'oggetto forma
     * @brief metodo che ritorna colore, quindi il colore dell'oggetto forma
     */
    public Colore getColore() {
        return colore;
    }

    /**
     * @author Ferrareis Christian
     * @param posY posizione y dell'oggetto forma
     * @brief metodo che permette di far arrivare l'oggetto forma sul fondo (modificandone posY), e lo fa incrementando la posizione y di 25, inteso come numero di pixel
     */
    public void incremento(int posY) {
        for (int i = 0; i < numElQuadrati; i++) {
            if (insiemeQuadrati[i].getPosizioneY() < posY) {
                insiemeQuadrati[i].setPosizioneY(insiemeQuadrati[i].getPosizioneY() + 25);
            }
        }
    }

    /**
     * @author Ferrareis Christian
     * @param attiv stato true (attiva) o false (disattivaFormaAttiva)
     * @brief metodo che permette di modificare attiva, quindi lo stato di attivazione l'oggetto forma
     */
    public void setAttiva(boolean attiv) {
        attiva = attiv;
    }

    /**
     * @author Ferrareis Christian
     * @param posX     coordinata x
     * @param posY     coordinata y
     * @param quadrato posizione del quadrato nel vettore
     * @brief metodo che permette di settare la posizione del quadrato (posX e posY) nella zona richiesta tramite coordinate x e y
     */
    public void setPos(int posX, int posY, int quadrato) {
        insiemeQuadrati[quadrato].setPosizioneX(posX);
        insiemeQuadrati[quadrato].setPosizioneY(posY);
    }

    /**
     * @author Ferrareis Christian
     * @param verso numero che rappresenta il nuovo verso (sopra, sotto, destra o sinistra)
     * @brief metodo che permette di modificare verso, quindi il verso di orientamento dell'oggetto forma
     */
    public void setVerso(int verso) {
        this.verso = verso;
    }

    /**
     * @author Ferrareis Christian
     * @return str posizioni x e y dei quadrati sottoforma di stringa
     * @brief metodo che ritorna, sottoforma di stringa, posX e posY di ogni quadrato nel vettore
     */
    public String toString() {
        String str = "";
        for (int i = 0; i < numElQuadrati; i++)
            str = str + insiemeQuadrati[i].toString() + " ";
        return str;
    }
}
