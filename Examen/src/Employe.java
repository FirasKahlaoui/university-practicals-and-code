class Employe{

	private String name;
	private int echelon;
	private double base;
	private double nbHeures; 

    public Employe(){
        this.name = "Firas Kahlaoui";
        this.echelon=0;
        this.base=0;
        this.nbHeures=0;
    }

    public Employe(String name, int echelon, double base, double nbHeures){
        this.name = name;
        this.echelon=echelon;
        this.base=base;
        this.nbHeures=nbHeures;
    }


    public void setName(String name){
        this.name = name ;
    }

    public String getName(){

        return this.name;
    }

    public void setEchelon(int echelon){
        this.echelon= echelon;
    }

    public int getEchelon(){
        return this.echelon;
    }

    public void setBase(double base){
        this.base = base;
    }

    public double getBase(){
        return this.base;
    }

    public void setNbHeures(double nbHeures){
        this.nbHeures = nbHeures;
    }

    public double getNbHeure(){
        return this.nbHeures;
    }

    public void afficher(){
        System.out.println("Name : " + this.name + " Echelon : " + this.echelon + " Base : " + this.base + " Nombre d'heures : " + this.nbHeures);
    }

    public double calculSalaire(){
        return this.base * this.nbHeures;
    }

    public double calculSalaire(double prime){
        return this.base * this.nbHeures + prime;
    }
}