
# Software Requirements Specification (SRS)

## 1. Project Overview

The Library Management System is designed to digitize library operations, replacing manual record-keeping with an efficient, secure, and scalable web application.

---

## 2. Problem Statement

The library currently relies on paper records and spreadsheets, leading to inefficiencies, misplaced records, manual fine calculations, and difficulty generating reports.

---

## 3. Stakeholders

- Library Owner
- Admin
- Librarian
- Student
- Development Team

---

## 4. Actors

- Admin
- Librarian
- Student

---

## 5. Functional Requirements

### Admin
- Login
- Manage books
- Manage students
- Manage librarians
- View reports
- Manage system settings

### Librarian
- Login
- Edit books
- Add books
- Remove books
- Issue books
- Return books
- Search books
- View borrowing history

### Student
- Login
- Search books
- Borrow books
- Reserve books
- View fines
- View borrowing history

---

## 6. Non-Functional Requirements

- Secure authentication
- Reliable database storage
- Scalable
- Responsive web interface
- Maintainable
- Daily backups
- Good error handling

---

## 7. Assumptions

- Single library
- Registered students only
- Due dates for borrowed books
- Fine for overdue books

---

## 8. Constraints

- Python
- MySQL
- GitHub
- Web application
- Open-source tools where possible
- Designed to be extendable with ML