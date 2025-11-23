INSERT INTO Membership VALUES (1, 'Basic', 20.00, 30, 'Standard');
INSERT INTO Membership VALUES (2, 'Premium', 45.00, 30, 'Full Access');

INSERT INTO Member VALUES
(1, 1, 'Lorenzo', 'Jackson', 'lj@test.com', '7734749998', '2024-05-10', 'Active'),
(2, 2, 'Sarah', 'Coleman', 'sc@test.com', '5552221111', '2024-04-01', 'Inactive'),
(3, 1, 'Mike', 'Reed', 'mr@test.com', '5551112222', '2024-06-12', 'Active');

INSERT INTO Staff VALUES
(1, 'Alex', 'Turner', 'Strength', '5554441212'),
(2, 'Jenna', 'Stone', 'Yoga', '5553337890');

INSERT INTO Class VALUES
(1, 'Yoga Flow', 'Relaxing yoga class', '14:00', 2, 20),
(2, 'Strength 101', 'Strength training basics', '10:00', 1, 15);

INSERT INTO ClassSession VALUES
(1, 1, 2, '2025-01-20', '14:00', '15:00', 'Room A'),
(2, 2, 1, '2025-01-20', '10:00', '11:00', 'Room B');

INSERT INTO Payment VALUES
(1, 1, 20.00, '2025-01-01', 1, '2025-01-20'),
(2, 3, 20.00, '2025-01-02', 2, '2025-01-20');
