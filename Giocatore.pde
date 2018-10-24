/**
 * @author Orsenigo Giacomo
 * @version 1.0
 */

/**
 * @author Giacomo Orsenigo
 * @brief La classe gestisce un giocatore, memorizzando nome e punteggio
 */
public class Giocatore {

    /**
     * nickname
     * @author Giacomo Orsenigo
     */
    private String nickname;

    /**l
     * punteggio
     * @author Giacomo Orsenigo
     */
    private int punteggio;

    /**
     * @brief costruttore vuoto
     *
     * inizializza {@code nickname} e {@code punteggio}
     * @author Giacomo Orsenigo
     */
    public Giocatore() {
        nickname = "";
        punteggio = 0;
    }

    /**
     * @brief costruttore con parametri
     *
     * inizializza {@code nickname} e {@code punteggio}
     * @param nickname
     * @param punteggio
     * @author Giacomo Orsenigo
     */
    public Giocatore(String nickname, int punteggio) {
        this.nickname = nickname;
        this.punteggio = punteggio;
    }

    /**
     * @brief modifica il {@code nome}
     *
     * @param nome nuovo nome
     * @author Giacomo Orsenigo
     */
    public void setNome(String nome) {
        this.nickname = nome;
    }

    /**
     * @brief modifica il {@code punteggio}
     *
     * @param punteggio nuovo punteggio
     * @author Giacomo Orsenigo
     */
    public void addPunteggio(int punteggio) {
        this.punteggio += punteggio;
    }

    /**
     * @brief get {@code nickname}
     *
     * @return nickname
     * @author Giacomo Orsenigo
     */
    public String getNickname() {
        return nickname;
    }

    /**
     * @brief get {@code punteggio}
     *
     * @return punteggio
     * @author Giacomo Orsenigo
     */
    public int getPunteggio() {
        return punteggio;
    }

    /**
     * @brief toString
     *
     * ritorna una stringa che rappresenta il giocatore
     * @return string
     * @author Giacomo Orsenigo
     */
    @Override
    public String toString() {
        return "Giocatore{" + "nickname=" + nickname + ", punteggio=" + punteggio + '}';
    }
}
