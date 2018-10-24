/**
* @author Mantica Luca
* @brief la classe contiene le costanti di gioco
*/
public interface gameConstants {
    
    /**
     * @brief altezza della finestra
     * @author Mantica Luca
     */
   int height=500;
    
    /**
     * @brief larghezza della finestra
     * @author Mantica Luca
     */
    int width=500;

    /**
     * @brief grandezza di ogni quadrato
     * @author Mantica Luca
     */
    int grandezzaQuadrato= height / 20;
    
    /**
     * @brief velocità di discesa delle forme
     * @author Mantica Luca
     */
    int velocitaDiscesa=500;
    
    /**
     * @brief numero di mosse massime per riga
     * @author Mantica Luca
     */
    int mossePerTurno=5;
}
