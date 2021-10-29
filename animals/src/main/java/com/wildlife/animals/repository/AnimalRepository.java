package com.wildlife.animals.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import com.wildlife.animals.model.Animal;


@RepositoryRestResource
public interface AnimalRepository extends CrudRepository<Animal, Integer> {

}
