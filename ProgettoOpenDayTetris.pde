import javax.swing.JOptionPane;
import static javax.swing.JOptionPane.YES_NO_OPTION;
import static javax.swing.JOptionPane.QUESTION_MESSAGE;
import static javax.swing.JOptionPane.YES_OPTION;
import static javax.swing.JOptionPane.NO_OPTION;
import static javax.swing.JOptionPane.CLOSED_OPTION;
import java.awt.Color;

/**
 * @file
 * @author Giacomo Orsenigo
 * @version 1.0
 */


FileDiTesto file = new FileDiTesto();
/**
 * giocatore
 */
private Giocatore giocatore = new Giocatore();

/**
 * oggetto della classe {@code forme} che contiene tutte le forme del gioco
 */
private Forme forme = new Forme();

/**
 * D
 * tempo da aspettare tra una mossa e l'altra (alla fine del loop)
 */
private int delay = 300;

/**
 * contatore delle mosse
 */
private int contatore = 0;

/**
 * grandezza di ogni quadrato
 */
private int grandezzaQuadrato;

/**
 * variabile che va a true se il gioco è iniziato
 */
private boolean giocoPartito = false;

/**
 * memorizza la forma in movimento
 */
private Forma formaGen;

/**
 * memorizza le coordinate di un quadrato
 */
private String parts[];

/**
 * indica se il giocatore ha perso
 */
private boolean gameOver = false;


private char tasto;


/**
 *@brief tasto premuto
 *
 * evento che si verifica quando viene premuto un tasto
 * modifica {@code tasto} e {@code giocoPartito}
 */
public void keyPressed() {
  if (giocoPartito)
    tasto = Character.toLowerCase(key);
  else
    giocoPartito = true;
}

/**
 * @brief settings
 *
 * ridimensiona la finestra
 */
public void settings() {
  size(500, 500);
}

/**
 * @brief inizializza la finestra e gli attributi
 *
 * crea l'interfaccia grafica e inizializza gli attributi
 * @see #reset()
 */
public void setup() {
  grandezzaQuadrato = height / 20;  //Si assegna alla grandezza del quadrato 1/20 della larghezza della finestra
  reset();
}

/**
 * @brief loop
 *
 * funzione loop che visualizza il menù iniziale e disegna la schermata di
 * gioco al primo ciclo e continua a richiamare {@code faiMossa} finchè il
 * giocatore non perde. Incrementa a ogni ciclo {@code contatore} e modifica
 * {@code inizio}
 */
public void draw() {
  if (contatore == 0) {
    menuIniziale(); //Visualizzazione del menu iniziale
  }
  if (giocoPartito) {
    schermataDiGioco();
    contatore++;

    /**
     * controlla se la variabile gameover Ã¨ true ed in caso positivo
     * termina la partita
     */
    if (!gameOver) {
      faiMossa();
    } else {
      gameOver();
      //else
    }
  }
  delay(delay / 5);
}

/**
 * @brief reset
 *
 * azzera glia attributi per iniziare una nuova partita.
 * modifica {@code giocatore}, {@code giocoPartito}, {@code gameOver}, {@code forme} e {@code contatore}
 */
private void reset() {
  giocatore=new Giocatore();
  giocatore.setNome(JOptionPane.showInputDialog(null, "Inserisci il nome", "Nome", QUESTION_MESSAGE));
  if (giocatore.getNickname()==null) {    //se viene premuto annulla
    System.err.println("Manca il nome");
    System.exit(-1);
  }
  background(0);
  giocoPartito = false;
  gameOver = false;
  forme = new Forme();
  contatore = 0;
  loop(); //fa ripartire il loop
}

/**
 * @brief game over
 *
 * scrive su file il punteggio e chiede se ricominciare o visuaizzare la classifica (ordinata).
 * collafora con la classe {@code FileDiTesto}
 * @see FileDiTesto#scriviSuFileESuVettore(string, int)
 * @see FileDiTesto#visualizzaClassifica()
 */
private void gameOver() {
  background(0);
  file.scriviSuFileESuVettore(giocatore.getNickname(), giocatore.getPunteggio());
  noLoop();  //ferma il loop
  if (JOptionPane.showConfirmDialog(null, "Ricominciare:", "Tetris", YES_NO_OPTION) == YES_OPTION)
    reset();
  else {
    file.ordina();
    file.visualizzaClassifica();
  }
}

/**
 * @brief fa una mossa
 * 
 * ridisegna l'interfaccia e le figure ferme, sposta in basso la figura attiva e, se arriva in fondo, la disattiva
 * Poi legge un valore da tastiera e richiama i metodi per spostare la figura.
 * Controlla se una riga è piena (la riga viene cancellata) o se la colonna è piena (il giocatore ha perso)
 * Modifica {@code formaGen} e {@code gameOver}.
 * @see forme#controlloRigaCompleta(int)
 * @see forme#controlloColonna(int)
 * @see forme#spostaAttivaSinistra()
 * @see forme#spostaAttivaDestra()
 * @see #spostaGiu()
 * @see #spostaInFondo()
 * @see forme#ruotaFiguraAttiva()
 */
void faiMossa() {
  //disegno le figure passive e sposto se possibile verso il basso quella attiva che altrimenti verrÃ  disattivata

  if (contatore == 1 || contatore % 5 == 0) {
    formaGen = forme.getFormaAttiva();
    spostaGiu();
    checkFormaAttiva();
    checkColonna();
  }
  repaint();
  System.out.println(tasto);
  switch (tasto) {
  case 'a':
    forme.spostaAttivaSinistra();
    break;
  case 'd':
    forme.spostaAttivaDestra();
    break;
  case 's':
    spostaGiu();
    giocatore.addPunteggio(10);
    break;
  case 'w':
    forme.ruotaFiguraAttiva();
    break;
  case ' ':
    spostaInFondo();
    break;
  default:
    break;
  }

  if (contatore % 5 == 0) {
    //inizio dei controlli per le righe e le colonne
    checkRiga();
    checkColonna();
  }
  checkFormaAttiva();
  tasto = 0;
}

/**
 * @brief controllo riga
 *
 * controlla se la riga è completa
 * @see forme#controlloRigaCompleta(int)
 */
private void checkRiga() {
  boolean controlloRiga = false;
  {
    int i = height - grandezzaQuadrato;
    while (i >= 0) {
      controlloRiga = forme.controlloRigaCompleta(i);
      if (controlloRiga) {
        //quando la riga Ã¨ completa si modifica il punteggio del giocatore
        pushMatrix();
        fill(255);
        text(giocatore.getPunteggio(), 3 * width / 5 + grandezzaQuadrato, 6 * grandezzaQuadrato + 150);
        popMatrix();

        giocatore.addPunteggio(100);

        //ridisegno figure spostate dopo aver cancellato la riga completata
        //repaint();
      } else
        i -= grandezzaQuadrato;
    }
  }
}

/**
 * @brief controllo colonna
 *
 * controllo un possibile gameOver in base al riempimento delle varie colonne
 * @see forme#controlloColonna(int)
 */
private void checkColonna() {
  boolean controlloColonna;
  for (int i = 0; i < 3 * width / 5; i += grandezzaQuadrato) {
    controlloColonna = forme.controlloColonna(i);
    if (controlloColonna) {
      gameOver = true;
      break;
    }
  }
}

/**
 * @brief aggiunge nuove forme
 *
 * controlla se ci sono forme attive e, in cano negativo ne aggiunge una nuova
 * collabolra con {@code forme.disattivaFormaAttiva()} e {@code forme.getForma(int)}
 * @see forme#inserisciNuova()
 */
private void checkFormaAttiva() {
  if (forme.getFormaAttiva() == null) {
    forme.inserisciNuova();
    formaGen = forme.getForma(forme.getNumEl() - 1);
  } else if ( forme.getFormaAttiva().getNumElQuadrati() == 0) {
    forme.disattivaFormaAttiva();
    forme.inserisciNuova();
    formaGen = forme.getForma(forme.getNumEl() - 1);
  }
}

/**
 * @brief ridisegna
 *
 * ridisegna la finestra di gioco
 */
private void repaint() {
  for (int k = 0; k < forme.getNumEl(); k++) {
    formaGen = forme.getForma(k);
    for (int j = 0; j < formaGen.getNumElQuadrati(); j++) //disegno figura passiva
    {
      parts = formaGen.getPos(j).split(";");
      pushMatrix();
      fill((formaGen.getColore()).getR(), (formaGen.getColore()).getG(), (formaGen.getColore()).getB());
      rect(Float.parseFloat(parts[0]), Float.parseFloat(parts[1]), grandezzaQuadrato, grandezzaQuadrato, 1);
      popMatrix();
    }
  }
}


/**
 * @brief sposta una forma in basso
 * 
 * sposta una forma in basso e la disattiva se è arrivata in
 * fondo. Collabora con {@code forme.spostaAttivaGiu()}
 * @see forme#spostaAttivaGiu()
 */
public void spostaGiu() {
  if (!forme.spostaAttivaGiu())
    forme.disattivaFormaAttiva();
}
/**
 * @brief sposta una forma in fondo
 * 
 * sposta una forma in fondo alla griglia e la disattiva. Aggiunge 20 al punteggio.
 *Collabora con {@code forme.spostaAttivaGiu()}
 * @see forme#spostaAttivaGiu()
 */
public void spostaInFondo() {
  for (int i = 0; i < 500; i++) {
    giocatore.addPunteggio(10);
    if (!forme.spostaAttivaGiu()) {
      forme.disattivaFormaAttiva();
      break;  //per velocizzare
    }
  }
}

/**
 * @brief menù iniziale
 *
 * disegna il menù iniziale e scrive le istruzioni
 */
public void menuIniziale() {
  textSize(50);
  pushMatrix();

  //disegna l'interfaccia grafica
  Random random = new Random();
  fill(random.nextInt(254) + 1, random.nextInt(254) + 1, random.nextInt(254) + 1);
  text("TETRIS", 150, 120);

  fill(255);
  textSize(20);

  text("Nuova partita", 155, 200);
  text("Premi un tasto per cominciare!", 70, 250);
  popMatrix();

  textSize(15);
  text("Istruzioni:\npremere\n[a] per spostarsi a sinistra\n[d] per spostartsi a destra\n[s] per scendere\n[w] per ruotare\n[spazio] per scendere in fondo", 50, 320);
}

/**
 * @brief disegna la schermata di gioco
 * 
 * disegna la schermata di gioco con il nome del giocatore e il punteggio
 */
public void schermataDiGioco() {

  //uso pushMatrix per non dover risettare i valori di fill
  pushMatrix();
  fill(0);
  rect(0, 0, 3 * width / 5, height);


  fill(194, 194, 214);
  rect(3 * width / 5, 0, 2 * width / 5, height);
  stroke(128, 128, 128);
  for (int i =0; i<height; i+=grandezzaQuadrato) {
    line(0, i, 3 * width / 5, i);
  }
  for (int i =0; i< 3 * width / 5; i+=grandezzaQuadrato) {
    line(i, 0, i, height);
  }
  //scrittura dell'interfaccia con utente -punteggio, nickname -

  fill(77, 77, 255);
  textSize(24);
  if (!giocatore.getNickname().toUpperCase().equals("")) {
    text("Giocatore:", 3 * width / 5 + grandezzaQuadrato, 1 * grandezzaQuadrato + 150);
    text(giocatore.getNickname().toUpperCase(), 3 * width / 5 + grandezzaQuadrato, 2 * grandezzaQuadrato + 150);
    text("PUNTEGGIO:", 3 * width / 5 + grandezzaQuadrato, 5 * grandezzaQuadrato + 150);
    text("        " + giocatore.getPunteggio(), 3 * width / 5 + grandezzaQuadrato, 6 * grandezzaQuadrato + 150);
  } else {
    text("Giocatore:", 3 * width / 5 + grandezzaQuadrato, 1 * grandezzaQuadrato + 150);
    text("Sconosciuto", 3 * width / 5 + grandezzaQuadrato, 2 * grandezzaQuadrato + 150);
    text("PUNTEGGIO:", 3 * width / 5 + grandezzaQuadrato, 5 * grandezzaQuadrato + 150);
    text("        " + giocatore.getPunteggio(), 3 * width / 5 + grandezzaQuadrato, 6 * grandezzaQuadrato + 150);
  }
  popMatrix();
}