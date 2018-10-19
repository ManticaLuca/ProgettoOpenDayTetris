package com.processing.sketch;

/**
 * per intellij
 */

import static com.processing.sketch.Progettoopendaytetris.programmaProcessing;
import static processing.core.PConstants.*;

public class inputTastiera {


    public int LeggiInput() {
        if (programmaProcessing.keyPressed == true /*&& programmaProcessing.key == CODED*/) {
            switch (Character.toLowerCase(programmaProcessing.keyCode)) {
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
