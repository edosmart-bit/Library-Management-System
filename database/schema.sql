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

-- ==========================================================
-- TABLE: Book Copies
-- ==========================================================

CREATE TABLE book_copies (
    copy_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    barcode VARCHAR(50) NOT NULL UNIQUE,
    status VARCHAR(20) NOT NULL DEFAULT 'Available',

    FOREIGN KEY (book_id)
        REFERENCES books(book_id)
);

-- ==========================================================
-- TABLE: Students
-- ==========================================================

CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    matric_number VARCHAR(30) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20),
    department VARCHAR(100)
);

-- ==========================================================
-- TABLE: Librarians
-- ==========================================================

CREATE TABLE librarians (
    librarian_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20)
);

-- ==========================================================
-- TABLE: Borrow Records
-- ==========================================================

CREATE TABLE borrow_records (
    borrow_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    copy_id INT NOT NULL,
    librarian_id INT NOT NULL,
    borrow_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE,

    FOREIGN KEY (student_id)
        REFERENCES students(student_id),

    FOREIGN KEY (copy_id)
        REFERENCES book_copies(copy_id),

    FOREIGN KEY (librarian_id)
        REFERENCES librarians(librarian_id)
);

-- ==========================================================
-- TABLE: Reservations
-- ==========================================================

CREATE TABLE reservations (
    reservation_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    book_id INT NOT NULL,
    reservation_date DATE NOT NULL,

    FOREIGN KEY (student_id)
        REFERENCES students(student_id),

    FOREIGN KEY (book_id)
        REFERENCES books(book_id)
);

-- ==========================================================
-- TABLE: Fines
-- ==========================================================

CREATE TABLE fines (
    fine_id INT AUTO_INCREMENT PRIMARY KEY,
    borrow_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'Unpaid',

    FOREIGN KEY (borrow_id)
        REFERENCES borrow_records(borrow_id)
);

