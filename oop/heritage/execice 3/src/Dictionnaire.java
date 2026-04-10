package EX3;

public class Dictionnaire extends Document{
	private String langue;
	private int nbArticles;
	public Dictionnaire() {
		super();
		this.langue="";
		this.nbArticles=0;
	}
	public Dictionnaire(int num, String titre,String langue, int nbArticles) {
		super(num, titre);
		this.langue=langue;
		this.nbArticles=nbArticles;
	}
	public String getLangue() {
		return langue;
	}
	public void setLangue(String langue) {
		this.langue = langue;
	}
	public int getNbArticles() {
		return nbArticles;
	}
	public void setNbArticles(int nbArticles) {
		this.nbArticles = nbArticles;
	}
	@Override
	public String toString() {
		return "Dictionnaire [langue=" + langue + ", nbArticles=" + nbArticles + ", getLangue()=" + getLangue()
				+ ", getNbArticles()=" + getNbArticles() + ", getNumEnregistrement()=" + getNumEnregistrement()
				+ ", getTitre()=" + getTitre() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
	
	
}
