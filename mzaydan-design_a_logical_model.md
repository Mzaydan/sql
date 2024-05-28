# Assignment 1: Design a Logical Model

## Question 1
Create a logical model for a small bookstore. 📚

At the minimum it should have employee, order, sales, customer, and book entities (tables). Determine sensible column and table design based on what you know about these concepts. Keep it simple, but work out sensible relationships to keep tables reasonably sized. Include a date table. There are several tools online you can use, I'd recommend [_Draw.io_](https://www.drawio.com/) or [_LucidChart_](https://www.lucidchart.com/pages/).


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Position VARCHAR(50),
    HireDate DATE,
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20)
);


CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20),
    RegistrationDate DATE
);

CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(255),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Price DECIMAL(10, 2),
    SupplierID INT
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    CustomerID INT,
    TotalAmount DECIMAL(10, 2),
    EmployeeID INT 
);



CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    OrderID INT,
    BookID INT,
    Quantity INT,
    SalePrice DECIMAL(10, 2),
    SaleDate DATE
);

CREATE TABLE Genre (
    GenreID INT PRIMARY KEY,
    Name VARCHAR(255),
    Description TEXT
)




CREATE TABLE Dates (
    DateID INT PRIMARY KEY,
    Date DATE,
    Day INT,
    Month INT,
    Year INT,
    Weekday VARCHAR(10),
    Quarter INT
);

CREATE TABLE Customer_purchases (
    CustomerID INT PRIMARY KEY,
    TransactionDate DATE,
    Amount INT,
    quantity INT,
    BookID INT
);

CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(100),
    PhoneNumber VARCHAR(20),
    Email VARCHAR(100),
    Address VARCHAR(255)
);










## Question 2
We want to create employee shifts, splitting up the day into morning and evening. Add this to the ERD.


CREATE TABLE Shifts (
    ShiftID INT PRIMARY KEY,
    EmployeeID INT,
    ShiftType VARCHAR(10),
    StartTime TIME,
    EndTime TIME,
);



## Question 3
The store wants to keep customer addresses. Propose two architectures for the CUSTOMER_ADDRESS table, one that will retain changes, and another that will overwrite. Which is type 1, which is type 2?

_Hint, search type 1 vs type 2 slowly changing dimensions._

Type 1: CREATE TABLE CUSTOMER_ADDRESS (
    AddressID INT PRIMARY KEY,
    CustomerID INT,
    AddressLine VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(100),
    Country VARCHAR(100)
);


Type 2: CREATE TABLE CUSTOMER_ADDRESS (
    AddressID INT PRIMARY KEY,
    CustomerID INT,
    AddressLine1 VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(100),
    Country VARCHAR(100),
    StartDate DATE,
    EndDate DATE,
    IsCurrent BOOLEAN
);



Bonus: Are there privacy implications to this, why or why not?
```
Your answer...
```


Overwriting of Data (Type 1 SCD):   
Updating existing customer addresses with new information may reduce the risk of outdated data being accessed.
However, historical addresses are lost, which may affect historical analysis or auditing.

Retention of Historical Data (Type 2 SCD):
Keeping historical records of customer addresses may contain sensitive information.
Proper security measures are needed to protect this data from unauthorized access.



## Question 4
Review the AdventureWorks Schema [here](https://i.stack.imgur.com/LMu4W.gif)

Highlight at least two differences between it and your ERD. Would you change anything in yours?
```
Your answer...
```

1) AdventureWorks contains a more complex schema with a larger number of tables, relationships, and attributes (very detailed).
2) AdventureWorks covers a wide range of business operations, including sales and marketing, procurement, employee management, manufacturing, and HR-related tasks, etc..


Possible changes: 

To enhance our bookstore database, I suggest adding two new tables: BookReview and SalesReason. The BookReview table will store customer ratings and reviews for books, while the 'SalesReason' table will track reasons behind book purchases. These additions will provide valuable insights into customer preferences and buying motivations, helping us improve our bookstore.

In addition, to delve deeper into our bookstore database, let's consider adding extra columns to existing tables. This will help us gain a better understanding of our data. 

However, I believe that a complex schema like AdventureWorks may not be necessary for a bookstore. We can tailor our database to focus on the specific needs of our bookstore operations, ensuring simplicity and efficiency


# Criteria

[Assignment Rubric](./assignment_rubric.md)

# Submission Information

🚨 **Please review our [Assignment Submission Guide](https://github.com/UofT-DSI/onboarding/blob/main/onboarding_documents/submissions.md)** 🚨 for detailed instructions on how to format, branch, and submit your work. Following these guidelines is crucial for your submissions to be evaluated correctly.

### Submission Parameters:
* Submission Due Date: `June 1, 2024`
* The branch name for your repo should be: `model-design`
* What to submit for this assignment:
    * This markdown (design_a_logical_model.md) should be populated.
    * Two Entity-Relationship Diagrams (preferably in a pdf, jpeg, png format).
* What the pull request link should look like for this assignment: `https://github.com/<your_github_username>/sql/pull/<pr_id>`
    * Open a private window in your browser. Copy and paste the link to your pull request into the address bar. Make sure you can see your pull request properly. This helps the technical facilitator and learning support staff review your submission easily.

Checklist:
- [ ] Create a branch called `model-design`.
- [ ] Ensure that the repository is public.
- [ ] Review [the PR description guidelines](https://github.com/UofT-DSI/onboarding/blob/main/onboarding_documents/submissions.md#guidelines-for-pull-request-descriptions) and adhere to them.
- [ ] Verify that the link is accessible in a private browser window.

If you encounter any difficulties or have questions, please don't hesitate to reach out to our team via our Slack at `#cohort-3-help`. Our Technical Facilitators and Learning Support staff are here to help you navigate any challenges.
