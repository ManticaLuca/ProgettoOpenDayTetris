/**
 * @author Giacomo Orsenigo
 * @brief la classe gestisce l'input da tastiera
 */
public class inputTastiera {

    /**
     * @return carattere letto
     * @brief legge un carattere da tastiera
     * @author Giacomo Orsenigo
     */
    public int LeggiInput() {
        if (keyPressed == true /*&& programmaProcessing.key == CODED*/) {
            switch (Character.toLowerCase(keyCode)) {
                case LEFT:
                    return 0;
                case RIGHT:
                    return 1;
                case UP:
                    return 2;
                case DOWN:
                    return 3;
                case 'a':
                    return 0;
                case 'd':
                    return 1;
                case 'w':
                    return 2;
                case 's':
                    return 3;
                case 'h':
                    return 5;
                case ' ':
                    return 4;
            }
        }
        return -1;
    }
}
