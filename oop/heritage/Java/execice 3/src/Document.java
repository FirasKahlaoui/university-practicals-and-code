public class Document {
	private int numEnregistrement;
    private String titre;
    public Document() {
    	numEnregistrement=0;
        titre= "";
    }
    public Document(int num,String titre){
        this.numEnregistrement=num;
        this.titre= titre;
    }

	public int getNumEnregistrement() {
		return numEnregistrement;
	}

	public void setNumEnregistrement(int numEnregistrement) {
		this.numEnregistrement = numEnregistrement;
	}

	public String getTitre() {
		return titre;
	}

	public void setTitre(String titre) {
		this.titre = titre;
	}
	@Override
	public String toString() {
		return "Document [numEnregistrement=" + numEnregistrement + ", titre=" + titre + ", getNumEnregistrement()="
				+ getNumEnregistrement() + ", getTitre()=" + getTitre() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + "]";
	}
	
}
