CREATE TABLE Membership (
    MembershipID INTEGER PRIMARY KEY,
    PlanName VARCHAR(50),
    MonthlyFee DECIMAL(6,2),
    Duration INTEGER,
    AccessLevel VARCHAR(20)
);

CREATE TABLE Member (
    MemberID INTEGER PRIMARY KEY,
    MembershipID INTEGER,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    StartDate DATE,
    MembershipStatus VARCHAR(20),
    FOREIGN KEY (MembershipID) REFERENCES Membership(MembershipID)
);

CREATE TABLE Staff (
    StaffID INTEGER PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Specialty VARCHAR(50),
    Phone VARCHAR(20)
);

CREATE TABLE Class (
    ClassID INTEGER PRIMARY KEY,
    ClassName VARCHAR(50),
    Description TEXT,
    ScheduleTime TIME,
    TrainerID INTEGER,
    Capacity INTEGER,
    FOREIGN KEY (TrainerID) REFERENCES Staff(StaffID)
);

CREATE TABLE ClassSession (
    SessionID INTEGER PRIMARY KEY,
    ClassID INTEGER,
    StaffID INTEGER,
    SessionDate DATE,
    StartTime TIME,
    EndTime TIME,
    Room VARCHAR(20),
    FOREIGN KEY (ClassID) REFERENCES Class(ClassID),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

CREATE TABLE Payment (
    PaymentID INTEGER PRIMARY KEY,
    MemberID INTEGER,
    Amount DECIMAL(6,2),
    DatePaid DATETIME,
    ClassID INTEGER,
    DateAttended DATE,
    FOREIGN KEY (MemberID) REFERENCES Member(MemberID),
    FOREIGN KEY (ClassID) REFERENCES Class(ClassID)
);
