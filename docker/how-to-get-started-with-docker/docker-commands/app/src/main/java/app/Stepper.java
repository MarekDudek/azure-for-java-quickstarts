package app;

import static java.lang.System.err;
import static java.lang.System.out;
import static java.lang.Thread.sleep;

public final class Stepper {

    public static void main(String[] args) {
        out.println("Started");
        for (int i=1; ; i++) {
            try {
                sleep(1_000);
            } catch (final InterruptedException e) {
                err.println("Interrupted: " + e.getMessage());
                break;
            }
            out.println("Step " + i);
        }
        out.println("Stopped");
    }
}
