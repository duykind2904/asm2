package asm2.springweb.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import asm2.springweb.entity.Category;

public interface CategoryRepository extends JpaRepository<Category, Integer>{

}
