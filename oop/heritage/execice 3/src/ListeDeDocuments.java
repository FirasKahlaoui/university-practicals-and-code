package EX3;

import java.util.ArrayList;

public class ListeDeDocuments {
    private ArrayList<Document> listeDocs;

    public ArrayList<Document> getListeDocs() {
		return listeDocs;
	}

	public void setListeDocs(ArrayList<Document> listeDocs) {
		this.listeDocs = listeDocs;
	}

	public ListeDeDocuments() {
        listeDocs = new ArrayList<>();
    }

    public void addD(Document d) {
        listeDocs.add(d);
    }

    public void afficherTousLesDocuments() {
        for (int i = 0; i < listeDocs.size(); i++) {
            Document d = listeDocs.get(i);
            System.out.println(d);
        }
    }
    @Override
	public String toString() {
		return "ListeDeDocuments [listeDocs=" + listeDocs + ", getListeDocs()=" + getListeDocs() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}

	public void afficherTousLesLivres() {
        for (int i = 0; i < listeDocs.size(); i++) {
            Document d = listeDocs.get(i);
            if (d instanceof Livre) {
                System.out.println(d);
            }
        }
    }
}