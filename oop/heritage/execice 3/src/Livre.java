package EX3;

public class Livre extends Document{
	private String auteur;
	private int nbPages;
	public Livre() {
		super();
		this.auteur="";
		this.nbPages=0;
	}
	public Livre(int num, String titre, String auteur, int nbPages) {
		super(num, titre);
		this.auteur=auteur;
		this.nbPages=nbPages;
	}
	public String getAuteur() {
		return auteur;
	}
	public void setAuteur(String auteur) {
		this.auteur = auteur;
	}
	public int getNbPages() {
		return nbPages;
	}
	public void setNbPages(int nbPages) {
		this.nbPages = nbPages;
	}
	String x = super.toString()	;@Override
	public String toString() {
		return "Livre [auteur=" + auteur + ", nbPages=" + nbPages + ", getAuteur()=" + getAuteur() + ", getNbPages()="
				+ getNbPages() + ", getNumEnregistrement()=" + getNumEnregistrement() + ", getTitre()=" + getTitre()
				+ ", toString()=" + x + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ "]";
	}
	
	
}
