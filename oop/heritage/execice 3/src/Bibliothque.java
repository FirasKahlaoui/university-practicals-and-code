package EX3;
public class Bibliothque {
    public static void main(String[] args) {

        System.out.println("===== TEST CLASSE DOCUMENT =====");
        Document doc1 = new Document();
        System.out.println("Document par défaut : " + doc1);

        Document doc2 = new Document(100, "Document Général");
        System.out.println("Document paramétré : " + doc2);

        doc2.setNumEnregistrement(101);
        doc2.setTitre("Document Modifié");
        System.out.println("Après modification : " + doc2);
        System.out.println("Numéro : " + doc2.getNumEnregistrement());
        System.out.println("Titre : " + doc2.getTitre());


        System.out.println("\n===== TEST CLASSE LIVRE =====");
        Livre livre1 = new Livre();
        System.out.println("Livre par défaut : " + livre1);

        Livre livre2 = new Livre(1, "Le Petit Prince", "Antoine de Saint-Exupéry", 96);
        System.out.println("Livre paramétré : " + livre2);

        livre2.setAuteur("Auteur Modifié");
        livre2.setNbPages(120);
        livre2.setNumEnregistrement(2);
        livre2.setTitre("Titre Modifié");
        System.out.println("Après modification : " + livre2);
        System.out.println("Auteur : " + livre2.getAuteur());
        System.out.println("Nombre de pages : " + livre2.getNbPages());
        System.out.println("Numéro : " + livre2.getNumEnregistrement());
        System.out.println("Titre : " + livre2.getTitre());


        System.out.println("\n===== TEST CLASSE DICTIONNAIRE =====");
        Dictionnaire dict1 = new Dictionnaire();
        System.out.println("Dictionnaire par défaut : " + dict1);

        Dictionnaire dict2 = new Dictionnaire(10, "Larousse", "Français", 50000);
        System.out.println("Dictionnaire paramétré : " + dict2);

        dict2.setLangue("Anglais");
        dict2.setNbArticles(60000);
        dict2.setNumEnregistrement(11);
        dict2.setTitre("Oxford");
        System.out.println("Après modification : " + dict2);
        System.out.println("Langue : " + dict2.getLangue());
        System.out.println("Nombre d'articles : " + dict2.getNbArticles());
        System.out.println("Numéro : " + dict2.getNumEnregistrement());
        System.out.println("Titre : " + dict2.getTitre());


        System.out.println("\n===== TEST CLASSE LISTEDEDOCUMENTS =====");
        ListeDeDocuments liste = new ListeDeDocuments();

        liste.addD(doc1);
        liste.addD(doc2);
        liste.addD(livre1);
        liste.addD(livre2);
        liste.addD(dict1);
        liste.addD(dict2);

        System.out.println("\n--- Tous les documents ---");
        liste.afficherTousLesDocuments();

        System.out.println("\n--- Tous les livres seulement ---");
        liste.afficherTousLesLivres();
    }
}
