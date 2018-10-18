/**
 * @author Orsenigo Giacomo
 * @version 1.0
 */

/**
 * @brief La classe gestisce un giocatore, memorizzando nome e punteggio
 */
public class Giocatore {

    /**
     * nickname
     */
    private String nickname;

    /**
     * punteggio
     */
    private int punteggio;

    /**
     * @brief costruttore vuoto
     *
     * inizializza {@code nickname} e {@code punteggio}
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
     */
    public Giocatore(String nickname, int punteggio) {
        this.nickname = nickname;
        this.punteggio = punteggio;
    }

    /**
     * @brief modifica il {@code nome}
     *
     * @param nome nuovo nome
     */
    public void setNome(String nome) {
        this.nickname = nome;
    }

    /**
     * @brief modifica il {@code punteggio}
     *
     * @param punteggio nuovo punteggio
     */
    public void addPunteggio(int punteggio) {
        this.punteggio += punteggio;
    }

    /**
     * @brief get {@code nickname}
     *
     * @return nickname
     */
    public String getNickname() {
        return nickname;
    }

    /**
     * @brief get {@code punteggio}
     *
     * @return punteggio
     */
    public int getPunteggio() {
        return punteggio;
    }

    /**
     * @brief toString
     *
     * ritorna una stringa che rappresenta il giocatore
     * @return string
     */
    @Override
    public String toString() {
        return "Giocatore{" + "nickname=" + nickname + ", punteggio=" + punteggio + '}';
    }
}
