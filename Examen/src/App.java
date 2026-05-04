public class App {
    public static void main(String[] args) throws Exception {
        Employe emp1 = new Employe("Firas Kahlaoui", 2, 1200, 40);
        Fabricant fab1 = new Fabricant("Ahmed Chaabane", 3, 1500, 35, 150,12);
        emp1.afficher();
        fab1.afficher();
        System.out.println("Salaire de " + emp1.getName() + " : " + emp1.calculSalaire());
        System.out.println("Salaire de " + emp1.getName() + " avec une prime de 150 : " + emp1.calculSalaire(150));
    }
}
