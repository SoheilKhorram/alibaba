import java.io.*;
import java.util.*;
import java.time.LocalDateTime;

class DataBase {
    HashMap<String, Controller> dataBase = new HashMap<>();
    static DataBase db;

    static String SourceFile = null;

    DataBase(String source) {
        SourceFile = source;
    }

    static public DataBase getDb() {
        if (db == null)
            db = new DataBase("E:\\alibaba\\Server\\DataBase\\Table\\UserTable.txt");
        return db;
    }

    /// Find users from file
    static public Vector<User> UsersFinder() throws IOException {
        Vector<User> users = new Vector<>();
        BufferedReader reader = new BufferedReader(
                new FileReader("E:\\alibaba\\Server\\DataBase\\Table\\UserTable.txt"));
        String line = reader.readLine();
        System.out.print("username: ");
        while (line != null) {
            String[] elements = line.split("/");
            users.add(new User(elements[1], elements[2], elements[3]));
            line = reader.readLine();
        }
        // reader.close();
        for (var item : users) {
            System.out.print(item.userName + "/");
        }
        System.out.print("\n");
        return users;
    }

    // save new user to file
    static public void AddUser(User user) throws IOException {
        int id = getDb().getCount() + 1;
        System.out.println("id: " + id);
        BufferedWriter writer = new BufferedWriter(
                new FileWriter("E:\\alibaba\\Server\\DataBase\\Table\\UserTable.txt", true));
        writer.append((String.valueOf(id)) + "/").append(user.userName).append("/").append(user.password).append("/")
                .append(user.mail).append("\n");
        writer.flush();
    }

    void addDataBase(String str, Controller c) {
        dataBase.put(str, c);
    }

    Controller getController(String str) {
        return dataBase.get(str);
    }

    int getCount() throws IOException {

        int count = 0;

        BufferedReader reader = new BufferedReader(
                new FileReader("D:\\Source\\AliBaba\\alibaba\\Server\\DataBase\\Table\\UserTable.txt"));

        String line = reader.readLine();

        while (line != null) {
            count++;
            line = reader.readLine();
        }

        return count;
    }
}

class Controller {
    File file;
    FileWriter fw;

    public Controller(String str) {
        file = new File(str);
        try {

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    String readFile() throws IOException {
        //

        return null;
    }

    void writeFile(String str, boolean... reset) throws IOException {
        //

        fw.write(str);
        fw.flush();
    }

    String getInfo(String id) throws IOException {
        String[] split = this.readFile().split("\n");
        for (String str : split)

            if (str.equals(id))

                return str;

        return "invalid";
    }
}
