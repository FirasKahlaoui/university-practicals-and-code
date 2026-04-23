#include <iostream>
#include <memory>

#include "Dictionnaire.hpp"
#include "ListeDeDocuments.hpp"
#include "Livre.hpp"

int main() {
    std::cout << "===== TEST CLASSE DOCUMENT =====\n";
    auto doc1 = std::make_shared<Document>();
    std::cout << "Document par defaut : " << doc1->toString() << '\n';

    auto doc2 = std::make_shared<Document>(100, "Document General");
    std::cout << "Document parametre : " << doc2->toString() << '\n';

    doc2->setNumEnregistrement(101);
    doc2->setTitre("Document Modifie");
    std::cout << "Apres modification : " << doc2->toString() << '\n';
    std::cout << "Numero : " << doc2->getNumEnregistrement() << '\n';
    std::cout << "Titre : " << doc2->getTitre() << '\n';

    std::cout << "\n===== TEST CLASSE LIVRE =====\n";
    auto livre1 = std::make_shared<Livre>();
    std::cout << "Livre par defaut : " << livre1->toString() << '\n';

    auto livre2 = std::make_shared<Livre>(1, "Le Petit Prince", "Antoine de Saint-Exupery", 96);
    std::cout << "Livre parametre : " << livre2->toString() << '\n';

    livre2->setAuteur("Auteur Modifie");
    livre2->setNbPages(120);
    livre2->setNumEnregistrement(2);
    livre2->setTitre("Titre Modifie");
    std::cout << "Apres modification : " << livre2->toString() << '\n';
    std::cout << "Auteur : " << livre2->getAuteur() << '\n';
    std::cout << "Nombre de pages : " << livre2->getNbPages() << '\n';
    std::cout << "Numero : " << livre2->getNumEnregistrement() << '\n';
    std::cout << "Titre : " << livre2->getTitre() << '\n';

    std::cout << "\n===== TEST CLASSE DICTIONNAIRE =====\n";
    auto dict1 = std::make_shared<Dictionnaire>();
    std::cout << "Dictionnaire par defaut : " << dict1->toString() << '\n';

    auto dict2 = std::make_shared<Dictionnaire>(10, "Larousse", "Francais", 50000);
    std::cout << "Dictionnaire parametre : " << dict2->toString() << '\n';

    dict2->setLangue("Anglais");
    dict2->setNbArticles(60000);
    dict2->setNumEnregistrement(11);
    dict2->setTitre("Oxford");
    std::cout << "Apres modification : " << dict2->toString() << '\n';
    std::cout << "Langue : " << dict2->getLangue() << '\n';
    std::cout << "Nombre d'articles : " << dict2->getNbArticles() << '\n';
    std::cout << "Numero : " << dict2->getNumEnregistrement() << '\n';
    std::cout << "Titre : " << dict2->getTitre() << '\n';

    std::cout << "\n===== TEST CLASSE LISTEDEDOCUMENTS =====\n";
    ListeDeDocuments liste;

    liste.addD(doc1);
    liste.addD(doc2);
    liste.addD(livre1);
    liste.addD(livre2);
    liste.addD(dict1);
    liste.addD(dict2);

    std::cout << "\n--- Tous les documents ---\n";
    liste.afficherTousLesDocuments();

    std::cout << "\n--- Tous les livres seulement ---\n";
    liste.afficherTousLesLivres();

    return 0;
}
