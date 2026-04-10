public class Employe extends Person {
    double salary;

    public Employe(String lastname, String firstname, double salary) {
        super(lastname, firstname);
        this.salary = salary;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    @Override
    public String toString() {
        return "Employe [salary=" + salary + ", Id=" + getId() + ", lastname=" + getLastname() + ", firstname=" + getFirstname()
                + "]";
    }
}
