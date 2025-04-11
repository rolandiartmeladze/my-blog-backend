# 📌 Laravel Project - User Management & Blog System

This is a Laravel-based web application that handles user registration, authentication, post creation, password recovery, and data editing. It is built using **Laravel**, **PHP**, **MySQL**, and follows a clean MVC structure.

---

## 🔍 Project Overview

This project is a simple blog and user management system developed using **Laravel Framework**. The main features include:

- 🔐 User Registration & Login
- ✍️ Create & Edit Blog Posts
- 🔄 Password Reset
- 🛠️ Edit User Profile Information
- 🧩 Secure API routes using Laravel Sanctum

---

## 🚀 Getting Started

To run this project locally, make sure the following tools are installed:

### 🛠️ Requirements

- **PHP** (>= 8.1)
- **Composer**
- **MySQL / MariaDB**
- **Node.js & NPM** (for frontend assets, optional)
- **Laravel CLI**
- **Git** (for version control)

---

## ⚙️ Installation Steps

1. **Clone the Repository**
   ```bash
   git clone https://github.com/rolandiartmeladze/my-blog-backend.git
   cd my-blog-backend
    ```
---

2. **Install composer**
    ```bash
    composer install
     ```
---

3.  **Set .env local config**
    ```bash
    cp .env.example .env
    ```
---

4.  **key:generate generate app key**
    ```bash
    php artisan key:generate
     ```

---

5. **run migrations**
    ```bash
    php artisan migrate
     ```

---

6. **Serve this aplication**
    ```bash
    php artisan serve
     ```


## ⚙️ Project Structure

📁 Folder Structure

    -[] /app – Core application files (models, controllers)

    -[] /resources/views – Blade templates

    -[] /routes/web.php – Web routes

    -[] /routes/api.php – API routes

    -[] /database/migrations – Database migration files

