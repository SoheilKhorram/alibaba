import java.util.*;
import java.net.*;
import java.io.*;

class Server {
    public static void main(String[] args) throws IOException {
        System.out.println("Hello main");
        ServerSocket serverSocket = new ServerSocket(4321);
        Vector<User> users = DataBase.UsersFinder();
        while (true) {
            System.out.println("Waiting for client...");
            new ClientHandler(serverSocket.accept(), users).start();
        }
    }
}

class User {
    String userName, password, mail;

    public User(String userName, String password, String mail) {
        this.userName = userName;
        this.password = password;
        this.mail = mail;
    }
}

class ClientHandler extends Thread {
    Socket socket;
    DataOutputStream dos;
    DataInputStream dis;
    Vector<User> users;

    public ClientHandler(Socket socket, Vector<User> users) throws IOException {
        this.socket = socket;
        this.users = users;
        dos = new DataOutputStream(socket.getOutputStream());
        dis = new DataInputStream(socket.getInputStream());
        System.out.println("user created");
    }

    // convert sever message to string
    public String listener() throws IOException {
        System.out.println("listener");
        StringBuilder sb = new StringBuilder();
        int b = dis.read();
        while (b != 0) {
            sb.append((char) b);
            b = dis.read();
        }
        Scanner scanner = new Scanner(sb.toString());
        String command = scanner.nextLine();
        System.out.println("listener2");
        return sb.toString();
    }

    // send the response to server
    public void writer(String write) throws IOException {
        dos.writeBytes(write);
//        dos.flush();
//        dos.close();
//        dis.close();
//        socket.close();
        System.out.println("this write : " + write);
    }

    @Override
    public void run() {
        super.run();
        String command;
        try {
            command = listener();
            System.out.println("command: " + command);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        String[] split = command.split("/");
        for (String s : split)
            System.out.println(s);
        switch (split[0]) {
            case "signin": {
                // if both userName and password are correct the response is 1
                // signin/userName/password
                boolean signedIn = false;
                for (User user : users) {
                    if (user.userName.equals(split[1]) && user.password.equals(split[2])) {
                        System.out.println("signed in");
                        try {
                            writer("1");
                        } catch (IOException e) {
                            throw new RuntimeException(e);
                        }
                        signedIn = true;
                        break;
                    }
                }
                if (!signedIn) {
                    try {
                        System.out.println("not signed in");
                        writer("0");
                    } catch (IOException e) {
                        throw new RuntimeException(e);
                    }
                }
                break;
            }
            case "SignUp": {
                // checks the userName if it's taken, the response is zero and user is not added
                // signup/userName/password/mail
                boolean duplicate = false;
                String userName = split[1];
                for (User user : users) {
                    if (user.userName.equals(userName)) {
                        try {
                            writer("0");
                            System.out.println("duplicate");
                            duplicate = true;
                            break;
                        } catch (IOException e) {
                            throw new RuntimeException(e);
                        }
                    }
                }
                if (!duplicate) {
                    User user = new User(split[1], split[2], split[3]);
                    users.add(user);
                    try {
                        DataBase.AddUser(user);
                        System.out.println(user.userName + "->" + user.password + "->add");
                        writer("1");
                    } catch (IOException e) {
                        throw new RuntimeException(e);
                    }
                }
                break;
            }
            default:
                System.out.println("default");
                break;
        }
    }
}