
# Database Design

## Project

**Library Management System**

---

# 1. Introduction

This document describes the initial database design for the Library Management System. It outlines the entities, tables, attributes, and relationships required to support the core functionalities of the application.

The goal of the database is to ensure data consistency, minimize redundancy, and provide efficient storage and retrieval of library information.

---

# 2. Database Objectives

The database should be able to:

* Store information about books.
* Store student records.
* Store librarian records.
* Track borrowing and returning of books.
* Manage book reservations.
* Record fines for overdue books.
* Support future Machine Learning features such as borrowing prediction and book recommendation.

---

# 3. Entities

The following entities have been identified during the business analysis phase.

| Entity         | Description                                        |
| -------------- | -------------------------------------------------- |
| Books          | Stores information about all books in the library. |
| Students       | Stores student information.                        |
| Librarians     | Stores librarian information.                      |
| Authors        | Stores book authors.                               |
| Categories     | Stores book categories.                            |
| Borrow Records | Records every borrowing transaction.               |
| Reservations   | Stores book reservation records.                   |
| Fines          | Stores overdue fine information.                   |

---

# 4. Tables and Attributes

## 4.1 Books

| Column           | Data Description           |
| ---------------- | -------------------------- |
| book_id          | Unique identifier          |
| title            | Book title                 |
| isbn             | ISBN number                |
| publication_year | Year published             |
| author_id        | Author reference           |
| category_id      | Category reference         |
| available_copies | Number of available copies |

---

## 4.2 Students

| Column        | Data Description           |
| ------------- | -------------------------- |
| student_id    | Unique identifier          |
| full_name     | Student name               |
| matric_number | School registration number |
| email         | Email address              |
| phone         | Phone number               |
| department    | Student department         |

---

## 4.3 Librarians

| Column       | Data Description  |
| ------------ | ----------------- |
| librarian_id | Unique identifier |
| full_name    | Librarian name    |
| email        | Email             |
| phone        | Phone number      |

---

## 4.4 Authors

| Column      | Data Description   |
| ----------- | ------------------ |
| author_id   | Unique identifier  |
| author_name | Author's full name |

---

## 4.5 Categories

| Column        | Data Description  |
| ------------- | ----------------- |
| category_id   | Unique identifier |
| category_name | Category name     |

---

## 4.6 Borrow Records

| Column       | Data Description           |
| ------------ | -------------------------- |
| borrow_id    | Unique identifier          |
| student_id   | Student borrowing the book |
| book_id      | Borrowed book              |
| librarian_id | Librarian issuing the book |
| borrow_date  | Date borrowed              |
| due_date     | Expected return date       |
| return_date  | Actual return date         |

---

## 4.7 Reservations

| Column           | Data Description           |
| ---------------- | -------------------------- |
| reservation_id   | Unique identifier          |
| student_id       | Student making reservation |
| book_id          | Reserved book              |
| reservation_date | Reservation date           |

---

## 4.8 Fines

| Column    | Data Description         |
| --------- | ------------------------ |
| fine_id   | Unique identifier        |
| borrow_id | Related borrowing record |
| amount    | Fine amount              |
| status    | Paid or Unpaid           |

---

# 5. Entity Relationships

The following relationships exist between the entities:

* One author can write many books.
* One category can contain many books.
* One student can borrow many books over time.
* One librarian can issue many books.
* One book can appear in many borrowing records.
* One borrowing record may generate one fine.
* One student can reserve many books.
* One book can have many reservations.

---

# 6. Entity Relationship Diagram

```text
Authors
   │
   │
   ▼
Books
   │
   ▼
BorrowRecords
▲             ▲
│             │
│             │
Students   Librarians

Categories
     │
     ▼
Books

BorrowRecords
      │
      ▼
Fines

Students
     │
     ▼
Reservations
     ▲
     │
Books
```

---

# 7. Future Improvements

The current database design is an initial version.

Future enhancements may include:

* Multiple copies of the same book.
* Multiple library branches.
* Barcode or QR code integration.
* Digital books (e-books).
* User authentication tables.
* Audit logs.
* Book recommendation data.
* Machine Learning datasets.

---

# 8. Conclusion

This document presents the initial database design for the Library Management System. It serves as the foundation for implementing the database schema in MySQL and will evolve as new requirements are identified during development.
