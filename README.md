# PRT582 Software Project Plan
## Library Management System Testing Strategy

---

## Table of Contents

1. [Cover Page](#cover-page)
2. [Content Page](#content-page)
3. [Background](#background)
4. [Aims and Scope](#aims-and-scope)
5. [Requirements](#requirements)
6. [Agile Testing](#agile-testing)
7. [Conclusion](#conclusion)

---

## Cover Page

**Project Title:** Library Management System Testing Plan  
**Unit:** PRT582 Software Engineering Process and Tools  
**Institution:** Charles Darwin University  
**Semester:** S2 2025  
**Date:** August 2, 2025  
**Project Type:** Group Project (10% of unit assessment)  

---

## Content Page

This document outlines the comprehensive testing strategy for the Django-based Library Management System (TechVidvanLibrary). The plan follows agile testing principles and covers all functional and non-functional testing requirements within the project timeframe.

---

## Background

The Library Management System is a web-based application built using Django framework that facilitates the management of library operations including:

- **User Management:** Staff registration, login, and authentication
- **Book Management:** Adding, viewing, and categorizing books
- **Student Management:** Student registration and profile management
- **Book Operations:** Book issuing, returning, and tracking
- **Dashboard:** Administrative interface for library staff

The system uses SQLite as the database backend and follows the Model-View-Template (MVT) architecture pattern of Django. Key components include:

- **Models:** UserExtend, AddBook, IssueBook, ReturnBook, AddStudent
- **Views:** Authentication, CRUD operations, dashboard management
- **Templates:** HTML interfaces for user interaction
- **Static Files:** CSS styling and images

---

## Aims and Scope

### Aims
- Ensure the Library Management System meets all functional requirements
- Validate system reliability, performance, and security
- Implement comprehensive testing coverage across all system components
- Establish automated testing framework for continuous integration
- Verify user experience and interface usability

### Scope
**In Scope:**
- All Django application components (models, views, templates)
- User authentication and authorization
- Database operations (CRUD operations)
- Web interface functionality
- API endpoints (if applicable)
- Cross-browser compatibility
- Mobile responsiveness

**Out of Scope:**
- Third-party integrations not part of core system
- Production deployment testing
- Load testing beyond basic performance validation
- Security penetration testing (beyond basic validation)

---

## Requirements

### Functional Requirements

#### FR1: User Management
- FR1.1: Staff can register with username, email, phone, and password
- FR1.2: Staff can login with valid credentials
- FR1.3: Username validation (alphanumeric, max 15 characters, unique)
- FR1.4: Session management and logout functionality
- FR1.5: Password security and validation

#### FR2: Book Management
- FR2.1: Staff can add new books with ID, name, subject, and category
- FR2.2: Book information validation and storage
- FR2.3: View all books in the system
- FR2.4: Book categorization and search functionality

#### FR3: Student Management
- FR3.1: Register students with name and student ID
- FR3.2: View student information and profiles
- FR3.3: Student ID validation and uniqueness

#### FR4: Book Operations
- FR4.1: Issue books to students with automatic expiry date (15 days)
- FR4.2: Track issued books with issue date and expiry
- FR4.3: Return book functionality
- FR4.4: View all issued books and their status

#### FR5: Dashboard and Navigation
- FR5.1: Administrative dashboard with overview
- FR5.2: Navigation between different system modules
- FR5.3: Responsive user interface

### Non-Functional Requirements

#### NFR1: Performance
- NFR1.1: Page load time should not exceed 3 seconds
- NFR1.2: Database queries should execute within 1 second
- NFR1.3: System should handle up to 100 concurrent users

#### NFR2: Security
- NFR2.1: Secure password storage (hashing)
- NFR2.2: Session security and timeout
- NFR2.3: SQL injection prevention
- NFR2.4: Cross-Site Scripting (XSS) protection

#### NFR3: Usability
- NFR3.1: Intuitive user interface design
- NFR3.2: Responsive design for different screen sizes
- NFR3.3: Clear error messages and validation feedback

#### NFR4: Reliability
- NFR4.1: 99% uptime during operational hours
- NFR4.2: Data integrity and consistency
- NFR4.3: Graceful error handling

#### NFR5: Compatibility
- NFR5.1: Support for modern web browsers (Chrome, Firefox, Safari, Edge)
- NFR5.2: Mobile device compatibility
- NFR5.3: Cross-platform database compatibility

---

## Agile Testing

Following the Agile Testing Quadrants methodology as provided in the course material, our testing approach is organized into four quadrants:

### Quadrant 1 (Q1): Bottom Left - Automated / Technology-Facing / Supporting the Team

#### Unit Tests
**Objective:** Test individual components in isolation

**Model Testing:**
```python
# Test cases for models.py
- UserExtend model creation and validation
- AddBook model with all field validations
- IssueBook model with automatic date calculations
- ReturnBook model functionality
- AddStudent model validation
```

**Test Implementation:**
- Use Django's built-in TestCase class
- Test model field validations
- Test model methods and properties
- Test model relationships and foreign keys
- Mock external dependencies

**Tools:** Django unittest framework, pytest-django

#### Component Tests
**Objective:** Test integrated components working together

**View Testing:**
- Authentication views (login, signup, logout)
- CRUD operation views
- Session management
- Form processing and validation

**URL Testing:**
- URL routing and pattern matching
- View function mapping
- Parameter passing

### Quadrant 2 (Q2): Top Left - Automated & Manual / Business-Facing / Supporting the Team

#### Functional Tests
**Objective:** Validate business requirements from user perspective

**User Story Testing:**
1. **Staff Registration and Login**
   - As a librarian, I can register an account
   - As a librarian, I can login to access the system
   - As a librarian, I receive appropriate error messages for invalid input

2. **Book Management**
   - As a librarian, I can add new books to the system
   - As a librarian, I can view all books in the library
   - As a librarian, I can categorize books by subject

3. **Student Management**
   - As a librarian, I can register new students
   - As a librarian, I can view student information

4. **Book Operations**
   - As a librarian, I can issue books to students
   - As a librarian, I can set and track book return dates
   - As a librarian, I can process book returns

**Implementation Approach:**
- Use Django's Client class for integration testing
- Create test fixtures for consistent data
- Test complete user workflows
- Validate business logic and rules

#### Examples and Story Tests
**Objective:** Create concrete examples that demonstrate system behavior

**Test Implementation:**
- User story examples with specific scenarios
- Acceptance criteria validation
- Business rule demonstrations
- Feature behavior documentation

#### Prototypes and Simulations
**Objective:** Early validation of concepts and workflows

**Focus Areas:**
- User interface mockups and prototypes
- Workflow simulations
- Stakeholder feedback collection
- Requirement clarification

### Quadrant 3 (Q3): Top Right - Manual / Business-Facing / Critique Product

#### Exploratory Testing

#### Exploratory Testing
**Objective:** Discover unexpected behaviors and edge cases

**Testing Approach:**
- Unscripted testing sessions
- Edge case discovery
- Unexpected user behavior scenarios
- System boundary testing

#### Scenarios and Usability Testing
**Objective:** Validate user experience and interface design

**Manual Testing Scenarios:**
1. **End-to-End User Workflows**
   - Complete library staff onboarding process
   - Full book management lifecycle
   - Student registration to book issuance process

2. **Usability Testing**
   - Interface navigation and intuitiveness
   - Form usability and error handling
   - Mobile responsiveness testing

**Test Execution:**
- Create detailed test scripts
- Document actual vs expected results
- Capture screenshots and videos
- Collect user feedback

#### User Acceptance Testing (UAT)
**Objective:** Validate system meets user expectations and business requirements

**UAT Process:**
- Stakeholder involvement in test case creation
- Business process validation
- Real-world scenario testing
- Sign-off criteria definition

#### Alpha/Beta Testing
**Objective:** Internal and limited external testing

**Alpha Testing:**
- Internal testing by development team
- Feature completeness validation
- User interface consistency
- Data validation accuracy
- Error message clarity

**Beta Testing:**
- Limited release to select users
- Real-world usage feedback
- Performance under actual conditions
- User experience evaluation

### Quadrant 4 (Q4): Bottom Right - Tools / Technology-Facing / Critique Product

#### Performance & Load Testing
**Objective:** Validate system performance under various conditions and loads

**Test Types:**
1. **Load Testing**
   - Concurrent user access (up to 100 users)
   - Database query performance
   - Page load time measurement
   - Response time under normal load

2. **Stress Testing**
   - System behavior under peak load
   - Memory usage monitoring
   - CPU utilization tracking
   - Breaking point identification

3. **Volume Testing**
   - Large dataset handling
   - Database performance with extensive records
   - Storage capacity testing

**Tools:** Django Debug Toolbar, pytest-benchmark, Apache JMeter

#### Security Testing
**Objective:** Ensure system security and data protection

**Test Areas:**
1. **Authentication Security**
   - Password hashing verification
   - Session security testing
   - Unauthorized access prevention

2. **Input Validation**
   - SQL injection prevention
   - XSS vulnerability testing
   - CSRF protection validation

3. **Data Security**
   - Database access control
   - Sensitive data handling
   - Session timeout testing

#### "ility" Testing
**Objective:** Test various non-functional quality attributes

**Quality Attributes Testing:**
1. **Reliability Testing**
   - System uptime and availability
   - Error recovery capabilities
   - Data integrity under failure conditions

2. **Scalability Testing**
   - System performance with increasing load
   - Resource utilization scaling
   - Database scalability assessment

3. **Maintainability Testing**
   - Code quality and structure assessment
   - Documentation completeness
   - Ease of modification and updates

4. **Portability Testing**
   - Cross-platform compatibility
   - Environment migration testing
   - Configuration portability

5. **Accessibility Testing**
   - Web accessibility standards (WCAG)
   - Screen reader compatibility
   - Keyboard navigation support

#### Compatibility Testing
**Objective:** Ensure cross-platform and cross-browser functionality

**Browser Testing:**
- Chrome (latest version)
- Firefox (latest version)
- Safari (latest version)
- Microsoft Edge (latest version)

**Device Testing:**
- Desktop (1920x1080, 1366x768)
- Tablet (iPad, Android tablets)
- Mobile (iOS, Android)

### Testing Schedule and Timeline

**Week 1-2: Setup and Unit Testing**
- Environment setup and test framework configuration
- Model unit tests implementation
- Basic view testing

**Week 3-4: Integration and Functional Testing**
- Component integration testing
- User story validation
- Business logic testing

**Week 5-6: System and Acceptance Testing**
- End-to-end testing
- User acceptance testing
- Performance and security testing

**Week 7-8: Final Testing and Documentation**
- Bug fixes and retesting
- Test documentation completion
- Final system validation

### Test Environment

**Development Environment:**
- Python 3.8+
- Django 3.0+
- SQLite database
- Git version control

**Testing Tools:**
- Django unittest framework
- pytest and pytest-django
- Coverage.py for code coverage
- Django Debug Toolbar
- Browser developer tools

**CI/CD Integration:**
- Automated test execution on code commits
- Code coverage reporting
- Automated deployment to staging environment

### Test Data Management

**Test Data Strategy:**
- Use Django fixtures for consistent test data
- Create factory classes for dynamic test data generation
- Implement database seeding scripts
- Maintain separate test database

**Data Categories:**
- Valid user accounts (staff and students)
- Sample book records
- Historical issue/return records
- Edge case data scenarios

### Defect Management

**Bug Tracking:**
- Use GitHub Issues for bug tracking
- Categorize bugs by severity and priority
- Track bug lifecycle from discovery to resolution

**Bug Classification:**
- **Critical:** System crashes, data loss
- **High:** Major functionality broken
- **Medium:** Minor functionality issues
- **Low:** Cosmetic issues, minor enhancements

---

## Conclusion

This comprehensive testing plan ensures the Library Management System meets all functional and non-functional requirements while maintaining high quality standards. The agile testing approach provides structured coverage across all system components, from individual units to complete user workflows.

**Key Success Metrics:**
- 90%+ code coverage through automated tests
- All critical and high-priority bugs resolved
- User acceptance testing approval
- Performance requirements met
- Security vulnerabilities addressed

**Risk Mitigation:**
- Early testing integration prevents late-stage defects
- Automated testing enables rapid feedback
- Comprehensive documentation ensures test reproducibility
- Regular stakeholder communication maintains alignment

The testing strategy balances thorough validation with practical implementation within the project timeframe, ensuring a robust and reliable library management system ready for production deployment.

**Expected Deliverables:**
- Complete test suite with automated execution
- Test coverage reports
- Performance benchmarking results
- Security assessment documentation
- User acceptance testing sign-off
- Bug tracking and resolution reports

This plan serves as a living document that will be updated throughout the development lifecycle to reflect changes in requirements, discovered issues, and lessons learned during the testing process.
