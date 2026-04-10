public class Application {
    public static void main(String[] args) {
        Etudiant e1 = new Etudiant("Smith", "John", 123456);
        Etudiant e2 = new Etudiant("Brown", "Alice", 654321);
        Employe e3 = new Employe("Johnson", "Emily", 40000);
        Employe e4 = new Employe("Davis", "Michael", 45000);
        Professor p1 = new Professor("Doe", "Jane", 50000, "Computer Science");
        Professor p2 = new Professor("Miller", "David", 55000, "Mathematics");
        
        
        System.out.println(e1.toString());
        System.out.println(e2.toString());
        System.out.println(e3.toString());
        System.out.println(e4.toString());
        System.out.println(p1.toString());
        System.out.println(p2.toString());
    }
}
