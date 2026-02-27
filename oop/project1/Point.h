#ifndef POINT_H
#define POINT_H

class Point {
private:
    char name;
    double x;
    double y;

public:
    Point();
    Point(char name, double x, double y);

    void display() const;
    void translate(double dx, double dy);
    Point midpoint(const Point& other) const;
    Point symmetric() const;
    double distance(const Point& other) const;
    bool compare(const Point& other) const;
};

#endif
