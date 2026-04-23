#ifndef DICTIONNAIRE_HPP
#define DICTIONNAIRE_HPP

#include "Document.hpp"

class Dictionnaire : public Document {
private:
    std::string langue;
    int nbArticles;

public:
    Dictionnaire();
    Dictionnaire(int num, const std::string& titre, const std::string& langue, int nbArticles);

    const std::string& getLangue() const;
    void setLangue(const std::string& langue);

    int getNbArticles() const;
    void setNbArticles(int nbArticles);

    std::string toString() const override;
};

#endif
