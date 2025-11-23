import sqlite3

conn = sqlite3.connect("gym.db")
cursor = conn.cursor()


def add_member():
    membership_id = input("Membership ID: ")
    first = input("First name: ")
    last = input("Last name: ")
    email = input("Email: ")
    phone = input("Phone: ")
    start = input("Start date (YYYY-MM-DD): ")
    status = "Active"

    cursor.execute(
        """
        INSERT INTO Member (MembershipID, FirstName, LastName, Email, Phone, StartDate, MembershipStatus)
        VALUES (?, ?, ?, ?, ?, ?, ?)
        """,
        (membership_id, first, last, email, phone, start, status),
    )
    conn.commit()
    print("Member added.")


def update_status():
    member_id = input("Member ID: ")
    new_status = input("New status (Active/Inactive): ")

    cursor.execute(
        "UPDATE Member SET MembershipStatus=? WHERE MemberID=?",
        (new_status, member_id),
    )
    conn.commit()
    print("Status updated.")


def record_payment():
    member_id = input("Member ID: ")
    amount = input("Amount: ")
    date_paid = input("Date paid (YYYY-MM-DD): ")
    class_id = input("Class ID: ")
    date_attended = input("Date attended (YYYY-MM-DD): ")

    cursor.execute(
        """
        INSERT INTO Payment (MemberID, Amount, DatePaid, ClassID, DateAttended)
        VALUES (?, ?, ?, ?, ?)
        """,
        (member_id, amount, date_paid, class_id, date_attended),
    )
    conn.commit()
    print("Payment recorded.")


def add_session():
    class_id = input("Class ID: ")
    staff_id = input("Staff ID: ")
    date = input("Session date (YYYY-MM-DD): ")
    start = input("Start time (HH:MM): ")
    end = input("End time (HH:MM): ")
    room = input("Room: ")

    cursor.execute(
        """
        INSERT INTO ClassSession (ClassID, StaffID, SessionDate, StartTime, EndTime, Room)
        VALUES (?, ?, ?, ?, ?, ?)
        """,
        (class_id, staff_id, date, start, end, room),
    )
    conn.commit()
    print("Session added.")


def view_trainer_sessions():
    staff_id = input("Trainer ID: ")

    cursor.execute(
        """
        SELECT ClassName, SessionDate, StartTime, EndTime, Room
        FROM ClassSession
        JOIN Class ON ClassSession.ClassID = Class.ClassID
        WHERE StaffID = ?
        """,
        (staff_id,),
    )

    rows = cursor.fetchall()

    for row in rows:
        print(row)


def main():
    while True:
        print("\nFlexZone Fitness Interface")
        print("1. Add a new member")
        print("2. Update membership status")
        print("3. Record a payment")
        print("4. Add a class session")
        print("5. View sessions for a trainer")
        print("6. Exit")

        choice = input("Select an option: ")

        if choice == "1":
            add_member()
        elif choice == "2":
            update_status()
        elif choice == "3":
            record_payment()
        elif choice == "4":
            add_session()
        elif choice == "5":
            view_trainer_sessions()
        elif choice == "6":
            break
        else:
            print("Invalid choice")


if __name__ == "__main__":
    main()
