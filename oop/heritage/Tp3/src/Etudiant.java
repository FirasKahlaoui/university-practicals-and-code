public class Etudiant extends Person {
    long num_card;

    public Etudiant(String lastname, String firstname, long num_card) {
        super(lastname, firstname);
        this.num_card = num_card;
    }

    public long getNum_card() {
        return num_card;
    }

    public void setNum_card(long num_card) {
        this.num_card = num_card;
    }

    @Override
    public String toString() {
        return "Etudiant [num_card=" + num_card + ", Id=" + getId() + ", lastname=" + getLastname() + ", firstname="
                + getFirstname() + "]";
    }
}
