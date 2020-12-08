package app;

import java.io.*;

import static java.lang.System.err;
import static java.lang.System.out;
import static java.lang.Thread.sleep;

public final class StatefulStepper {

    public static void main(String[] args) throws IOException {

        if (args.length != 1) {
            System.err.println("File path required");
            System.exit(1);
        }

        final String path = args[0];
        final File file = new File(path);
        if (!file.exists()) {
            file.createNewFile();
        }
        final BufferedWriter writer = new BufferedWriter(new FileWriter(file));

        out.println("Started");
        for (int i=1; ; i++) {
            try {
                sleep(1_000);
            } catch (final InterruptedException e) {
                err.println("Interrupted: " + e.getMessage());
                writer.flush();
                writer.close();
                break;
            }
            out.println("Step " + i);
            writer.write(Integer.toString(i));
            writer.newLine();
            writer.flush();
        }
        writer.flush();
        writer.close();
        out.println("Stopped");
    }
}
