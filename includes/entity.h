#ifndef ENTITY_H
#define ENTITY_H 

#include <glm/vec3.hpp> 

#include "model.h" 

class Entity {
public:
    Model* model;

    glm::vec3 position = {0.0f, 0.0f, 0.0f};
    glm::vec3 rotation = {0.0f, 0.0f, 0.0f};
    glm::vec3 scale    = {1.0f, 1.0f, 1,0f}; 

    Entity() = default;

};

#endif