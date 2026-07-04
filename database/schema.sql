-- ==========================================================
-- Library Management System Database Schema
-- Version: 1.0
-- Author: EdoSmart.AI
-- Description:
-- Initial database schema for the Library Management System.
-- ==========================================================

-- Create Database
CREATE DATABASE IF NOT EXISTS library_management_system;

-- Select Database
USE library_management_system;

-- ==========================================================
-- TABLE: Authors
-- ==========================================================

CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(100) NOT NULL
);

-- ==========================================================
-- TABLE: Categories
-- ==========================================================

CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE
);

-- ==========================================================
-- TABLE: Books
-- ==========================================================

CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    isbn VARCHAR(20) UNIQUE,
    publication_year INT,
    author_id INT NOT NULL,
    category_id INT NOT NULL,

    FOREIGN KEY (author_id)
        REFERENCES authors(author_id),

    FOREIGN KEY (category_id)
        REFERENCES categories(category_id)
);