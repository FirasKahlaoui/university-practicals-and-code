public class Professor extends Employe {
    String speciality;

    public Professor(String lastname, String firstname, double salary, String speciality) {
        super(lastname, firstname, salary);
        this.speciality = speciality;
    }

    public String getspeciality() {
        return speciality;
    }

    public void setspeciality(String speciality) {
        this.speciality = speciality;
    }

    @Override
    public String toString() {
        return super.toString() + "Professor [speciality=" + speciality + "]";
    }
    
}
