#ifndef LISTEDEDOCUMENTS_HPP
#define LISTEDEDOCUMENTS_HPP

#include <iostream>
#include <memory>
#include <vector>

#include "Document.hpp"
#include "Livre.hpp"

class ListeDeDocuments {
private:
    std::vector<std::shared_ptr<Document>> listeDocs;

public:
    void addD(const std::shared_ptr<Document>& d);
    void afficherTousLesDocuments() const;
    void afficherTousLesLivres() const;
};

#endif
