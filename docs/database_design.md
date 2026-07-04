# Database Design

## Project

**Library Management System**

---

# 1. Introduction

This document describes the database design for the Library Management System. It outlines the entities, tables, attributes, normalization principles, and relationships required to support the core functionalities of the application.

The database is designed to ensure data consistency, reduce redundancy, maintain data integrity, and provide efficient storage and retrieval of library information. This document serves as the foundation for implementing the database schema in MySQL.

---

# 2. Database Objectives

The database should be able to:

* Store information about books.
* Store individual physical copies of books.
* Store student records.
* Store librarian records.
* Track borrowing and returning of books.
* Manage book reservations.
* Record fines for overdue books.
* Support future Machine Learning features such as borrowing prediction and book recommendation.

---

# 3. Entities

The following entities have been identified during the business analysis phase.

| Entity         | Description                                            |
| -------------- | ------------------------------------------------------ |
| Books          | Stores information about book titles.                  |
| Book Copies    | Stores information about each physical copy of a book. |
| Students       | Stores student information.                            |
| Librarians     | Stores librarian information.                          |
| Authors        | Stores book authors.                                   |
| Categories     | Stores book categories.                                |
| Borrow Records | Records every borrowing transaction.                   |
| Reservations   | Stores book reservation records.                       |
| Fines          | Stores overdue fine information.                       |

---

# 4. Tables and Attributes

## 4.1 Books

| Column           | Data Description          |
| ---------------- | ------------------------- |
| book_id          | Unique identifier         |
| title            | Book title                |
| isbn             | ISBN number               |
| publication_year | Year published            |
| author_id        | Reference to the author   |
| category_id      | Reference to the category |

---

## 4.2 Book Copies

| Column  | Data Description                                |
| ------- | ----------------------------------------------- |
| copy_id | Unique identifier for a physical copy           |
| book_id | Reference to the book title                     |
| barcode | Unique barcode or inventory number              |
| status  | Available, Borrowed, Reserved, Damaged, or Lost |

---

## 4.3 Students

| Column        | Data Description           |
| ------------- | -------------------------- |
| student_id    | Unique identifier          |
| full_name     | Student name               |
| matric_number | School registration number |
| email         | Email address              |
| phone         | Phone number               |
| department    | Student department         |

---

## 4.4 Librarians

| Column       | Data Description  |
| ------------ | ----------------- |
| librarian_id | Unique identifier |
| full_name    | Librarian name    |
| email        | Email address     |
| phone        | Phone number      |

---

## 4.5 Authors

| Column      | Data Description   |
| ----------- | ------------------ |
| author_id   | Unique identifier  |
| author_name | Author's full name |

---

## 4.6 Categories

| Column        | Data Description  |
| ------------- | ----------------- |
| category_id   | Unique identifier |
| category_name | Category name     |

---

## 4.7 Borrow Records

| Column       | Data Description           |
| ------------ | -------------------------- |
| borrow_id    | Unique identifier          |
| student_id   | Student borrowing the book |
| copy_id      | Physical copy borrowed     |
| librarian_id | Librarian issuing the book |
| borrow_date  | Date borrowed              |
| due_date     | Expected return date       |
| return_date  | Actual return date         |

---

## 4.8 Reservations

| Column           | Data Description               |
| ---------------- | ------------------------------ |
| reservation_id   | Unique identifier              |
| student_id       | Student making the reservation |
| book_id          | Requested book title           |
| reservation_date | Reservation date               |

---

## 4.9 Fines

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
* One book can have many physical copies.
* One student can borrow many book copies over time.
* One librarian can issue many book copies.
* One book copy can appear in many borrowing records over its lifetime.
* One borrowing record may generate one fine.
* One student can reserve many books.
* One book can have many reservations.

---

# 6. Entity Relationship Diagram 

```text
Authors
   │
   ▼
Books
   │
   ▼
BookCopies
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

# 7. Database Normalization

The database design follows normalization principles to reduce redundancy and improve data consistency.

The design currently targets **Third Normal Form (3NF)**.

The following normalization decisions have been made:

* Each table represents a single business entity.
* Books and physical book copies are stored separately.
* Authors are stored independently from books.
* Categories are stored independently from books.
* Borrowing transactions are stored separately from student and book information.
* Fines are linked to borrowing transactions rather than directly to students or books.
* Relationships between tables will be maintained using primary keys and foreign keys.



---

# 8. Future Improvements

As the project grows, the database may be extended to include:

* Multiple library branches.
* Publisher information.
* Book editions.
* Digital books (e-books).
* User authentication and role management.
* Barcode or QR code scanning.
* Audit logs.
* Notifications and email reminders.
* Machine Learning datasets.
* Recommendation history.

---

# 9. Conclusion

This document presents Version 2 of the database design for the Library Management System.

The design has been improved through normalization by separating book titles from physical book copies. It provides a scalable and maintainable foundation for implementing the database schema in MySQL and will continue to evolve as new project requirements emerge.
