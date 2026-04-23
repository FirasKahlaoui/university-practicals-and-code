#ifndef DOCUMENT_HPP
#define DOCUMENT_HPP

#include <string>

class Document {
private:
    int numEnregistrement;
    std::string titre;

public:
    Document();
    Document(int num, const std::string& titre);
    virtual ~Document() = default;

    int getNumEnregistrement() const;
    void setNumEnregistrement(int numEnregistrement);

    const std::string& getTitre() const;
    void setTitre(const std::string& titre);

    virtual std::string toString() const;
};

#endif
