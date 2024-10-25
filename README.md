
# User Access Management System

The User Access Management System is a web-based application designed to streamline and secure the process of managing user access to software applications within an organization. The system includes functionalities for user registration, authentication, software management, access requests, and approvals.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Technologies Used](#technologies-used)
- [System Roles](#system-roles)
- [Database Schema](#database-schema)
- [Setup Instructions](#setup-instructions)
- [Demo](#demo)

## Introduction

This User Access Management System enables employees to request access to software, while managers can review and approve or reject these requests. Administrators have additional privileges to create and manage software entries in the system.

### Features

- **User Registration (Sign-Up)**
- **User Authentication (Login)**
- **Software Application Listing and Creation**
- **Access Request Submission**
- **Access Request Approval or Rejection**

## Technologies Used

- **Backend**: Java Servlets, JSP
- **Frontend**: HTML, CSS, JavaScript
- **Database**: PostgreSQL
- **Build Tool**: Maven
- **Application Server**: Apache Tomcat

## System Roles

The system has three main user roles, each with distinct permissions:

1. **Employee**
   - Can sign up, log in, and request access to software applications.
2. **Manager**
   - Can log in, view, approve, or reject access requests.
3. **Admin**
   - Has full privileges, including creating and managing software applications.


### Description of Main Files

- **JSP Pages**:
  - `signup.jsp`: User registration page.
  - `login.jsp`: Login page for all user roles.
  - `createSoftware.jsp`: Admin page to add new software applications.
  - `requestAccess.jsp`: Employee page to request software access.
  - `pendingRequests.jsp`: Manager page to review and approve/reject requests.

- **Servlets**:
  - `SignUpServlet`: Handles user registration.
  - `LoginServlet`: Manages user login and role-based redirection.
  - `SoftwareServlet`: Allows Admins to add software.
  - `RequestServlet`: Enables Employees to request software access.
  - `ApprovalServlet`: Allows Managers to approve or reject requests.

## Database Schema

The PostgreSQL database schema consists of three tables:

1. **users**
   - `id` (Primary Key)
   - `username` (Unique)
   - `password`
   - `role` (Employee, Manager, Admin)

2. **software**
   - `id` (Primary Key)
   - `name`
   - `description`
   - `access_levels` (Read, Write, Admin)

3. **requests**
   - `id` (Primary Key)
   - `user_id` (Foreign Key referencing `users`)
   - `software_id` (Foreign Key referencing `software`)
   - `access_type` (Requested access level)
   - `reason`
   - `status` (Pending, Approved, Rejected)

## Setup Instructions

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-username/User-Access-Management-System.git
   cd User-Access-Management-System
   ```
2. **Download and install Postgres and complete the setup**:
3. **Configure Application Server(Tomcat)**
4. **Build Maven**
   ```bash
     mvn clean install
   ```

5.Run the Application

## Demo
[![Demo Video](https://img.shields.io/badge/Watch-Demo%20Video-blue)](https://drive.google.com/file/d/1geMZWl3JY-joacrieD-KH12L9PRGdypl/view?usp=sharing)






