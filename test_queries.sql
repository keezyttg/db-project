.headers on
.mode column

-- 1. List all active members
SELECT MemberID, FirstName, LastName, MembershipStatus
FROM Member
WHERE MembershipStatus = 'Active';

-- 2. Show classes with their trainers
SELECT Class.ClassID, ClassName, ScheduleTime, Staff.FirstName AS TrainerFirst, Staff.LastName AS TrainerLast
FROM Class
JOIN Staff ON Class.TrainerID = Staff.StaffID;

-- 3. Show all sessions scheduled for a specific date
SELECT ClassName, SessionDate, StartTime, EndTime, Room
FROM ClassSession
JOIN Class ON ClassSession.ClassID = Class.ClassID
WHERE SessionDate = '2025-01-20';

-- 4. Show payments with member names
SELECT PaymentID, Amount, DatePaid, Member.FirstName, Member.LastName
FROM Payment
JOIN Member ON Payment.MemberID = Member.MemberID;

-- 5. Count members in each membership plan
SELECT PlanName, COUNT(Member.MemberID) AS TotalMembers
FROM Membership
LEFT JOIN Member ON Membership.MembershipID = Member.MembershipID
GROUP BY PlanName;
