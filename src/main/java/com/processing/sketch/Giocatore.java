package com.processing.sketch; /**
 * @author Orsenigo Giacomo
 * @version 1.0
 */

/**
 * @author Giacomo Orsenigo
 * @brief La classe gestisce un giocatore, memorizzando nome e punteggio
 */
public class Giocatore {

    /**
     * @author Giacomo Orsenigo
     * nickname
     */
    private String nickname;

    /**
     * @author Giacomo Orsenigo
     * punteggio
     */
    private int punteggio;

    /**
     * @author Giacomo Orsenigo
     * @brief costruttore vuoto
     *
     * inizializza {@code nickname} e {@code punteggio}
     */
    public Giocatore() {
        nickname = "";
        punteggio = 0;
    }

    /**
     * @author Giacomo Orsenigo
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
     * @author Giacomo Orsenigo
     * @brief modifica il {@code nome}
     *
     * @param nome nuovo nome
     */
    public void setNome(String nome) {
        this.nickname = nome;
    }

    /**
     * @author Giacomo Orsenigo
     * @brief modifica il {@code punteggio}
     *
     * @param punteggio nuovo punteggio
     */
    public void addPunteggio(int punteggio) {
        this.punteggio += punteggio;
    }

    /**
     * @author Giacomo Orsenigo
     * @brief get {@code nickname}
     *
     * @return nickname
     */
    public String getNickname() {
        return nickname;
    }

    /**
     * @author Giacomo Orsenigo
     * @brief get {@code punteggio}
     *
     * @return punteggio
     */
    public int getPunteggio() {
        return punteggio;
    }

    /**
     * @author Giacomo Orsenigo
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