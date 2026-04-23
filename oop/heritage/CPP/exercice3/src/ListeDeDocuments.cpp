#include "ListeDeDocuments.hpp"

void ListeDeDocuments::addD(const std::shared_ptr<Document>& d) {
    listeDocs.push_back(d);
}

void ListeDeDocuments::afficherTousLesDocuments() const {
    for (const auto& d : listeDocs) {
        std::cout << d->toString() << '\n';
    }
}

void ListeDeDocuments::afficherTousLesLivres() const {
    for (const auto& d : listeDocs) {
        if (dynamic_cast<Livre*>(d.get()) != nullptr) {
            std::cout << d->toString() << '\n';
        }
    }
}
