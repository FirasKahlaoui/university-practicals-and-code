public class Person {
    private static int NextId = 1;
    private final int Id;
    String lastname;
    String firstname;

    public Person(String lastname, String firstname) {
        this.Id = NextId++;
        this.lastname = lastname;
        this.firstname = firstname;
    }

    public int getId() {
        return Id;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    @Override
    public String toString() {
        return "Person [Id=" + Id + ", lastname=" + lastname + ", firstname=" + firstname + "]";
    }
    
}
