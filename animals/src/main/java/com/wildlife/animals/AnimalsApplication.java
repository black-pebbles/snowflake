package com.wildlife.animals;

import com.wildlife.animals.model.Animal;
import com.wildlife.animals.repository.AnimalRepository;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import java.util.stream.Stream;

@SpringBootApplication
public class AnimalsApplication {

    public static void main(String[] args) {
        SpringApplication.run(AnimalsApplication.class, args);
    }

    @Bean
    ApplicationRunner init(AnimalRepository animalRepository) {
        String[][] animaldata = {
                {"elephant", "gray"},
                {"bear", "black"},
                {"deer", "brown"}
        };

        return args -> {
            Stream.of(animaldata).forEach(array -> {
                Animal animal = new Animal(
                        array[0],
                        array[1]
                );
                animalRepository.save(animal);
            });
            animalRepository.findAll().forEach(System.out::println);
        };
    }
}
