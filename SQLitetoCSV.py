import sqlite3
import csv
import shutil
import os

# # Path to your SQLite database file
sqlite_db_path = r"C:\Users\user\Desktop\database.sqlite"

# Function to export SQLite table to CSV
def sqlite_to_csv(table_name, csv_file):
    # Connect to SQLite database
    conn = sqlite3.connect(sqlite_db_path)
    cursor = conn.cursor()

    # Query SQLite table
    cursor.execute(f"SELECT * FROM Country")

    # Fetch all rows
    rows = cursor.fetchall()

    # Fetch table column names
    cursor.execute(f"PRAGMA table_info({table_name})")
    columns = [col[1] for col in cursor.fetchall()]

    # Write to CSV file
    with open(csv_file, 'w', newline='', encoding='utf-8') as f:
        csv_writer = csv.writer(f)
        # Write header
        csv_writer.writerow(columns)
        # Write rows
        csv_writer.writerows(rows)

    # Close connections
    cursor.close()
    conn.close()

# Example usage:
table_name = 'Country'
csv_file = r"C:\Users\user\Desktop\Country.csv"
sqlite_to_csv(table_name, csv_file)



# Function to export SQLite table to CSV
def sqlite_to_csv(table_name, csv_file):
    # Connect to SQLite database
    conn = sqlite3.connect(sqlite_db_path)
    cursor = conn.cursor()

    # Query SQLite table
    cursor.execute(f"SELECT * FROM League")

    # Fetch all rows
    rows = cursor.fetchall()

    # Fetch table column names
    cursor.execute(f"PRAGMA table_info({table_name})")
    columns = [col[1] for col in cursor.fetchall()]

    # Write to CSV file
    with open(csv_file, 'w', newline='', encoding='utf-8') as f:
        csv_writer = csv.writer(f)
        # Write header
        csv_writer.writerow(columns)
        # Write rows
        csv_writer.writerows(rows)

    # Close connections
    cursor.close()
    conn.close()

# Example usage:
table_name = 'League'
csv_file = r"C:\Users\user\Desktop\League.csv"
sqlite_to_csv(table_name, csv_file)



# Function to export SQLite table to CSV
def sqlite_to_csv(table_name, csv_file):
    # Connect to SQLite database
    conn = sqlite3.connect(sqlite_db_path)
    cursor = conn.cursor()

    # Query SQLite table
    cursor.execute(f"SELECT * FROM Match")

    # Fetch all rows
    rows = cursor.fetchall()

    # Fetch table column names
    cursor.execute(f"PRAGMA table_info({table_name})")
    columns = [col[1] for col in cursor.fetchall()]

    # Write to CSV file
    with open(csv_file, 'w', newline='', encoding='utf-8') as f:
        csv_writer = csv.writer(f)
        # Write header
        csv_writer.writerow(columns)
        # Write rows
        csv_writer.writerows(rows)

    # Close connections
    cursor.close()
    conn.close()

# # Example usage:
table_name = 'Match'
csv_file = r"C:\Users\user\Desktop\Match1.csv"
sqlite_to_csv(table_name, csv_file)



def sqlite_to_csv(table_name, csv_file):
    # Connect to SQLite database
    conn = sqlite3.connect(sqlite_db_path)
    cursor = conn.cursor()

    # Query SQLite table
    cursor.execute(f"SELECT * FROM Player")

    # Fetch all rows
    rows = cursor.fetchall()

    # Fetch table column names
    cursor.execute(f"PRAGMA table_info({table_name})")
    columns = [col[1] for col in cursor.fetchall()]

    # Write to CSV file
    with open(csv_file, 'w', newline='', encoding='utf-8') as f:
        csv_writer = csv.writer(f)
        # Write header
        csv_writer.writerow(columns)
        # Write rows
        csv_writer.writerows(rows)

    # Close connections
    cursor.close()
    conn.close()

# Example usage:
table_name = 'Player'
csv_file = r"C:\Users\user\Desktop\Player.csv"
sqlite_to_csv(table_name, csv_file)



def sqlite_to_csv(table_name, csv_file):
    # Connect to SQLite database
    conn = sqlite3.connect(sqlite_db_path)
    cursor = conn.cursor()

    # Query SQLite table
    cursor.execute(f"SELECT * FROM Player_Attributes")

    # Fetch all rows
    rows = cursor.fetchall()

    # Fetch table column names
    cursor.execute(f"PRAGMA table_info({table_name})")
    columns = [col[1] for col in cursor.fetchall()]

    # Write to CSV file
    with open(csv_file, 'w', newline='', encoding='utf-8') as f:
        csv_writer = csv.writer(f)
        # Write header
        csv_writer.writerow(columns)
        # Write rows
        csv_writer.writerows(rows)

    # Close connections
    cursor.close()
    conn.close()

# Example usage:
table_name = 'Player_Attributes'
csv_file = r"C:\Users\user\Desktop\Player_Attributes.csv"
sqlite_to_csv(table_name, csv_file)




def sqlite_to_csv(table_name, csv_file):
    # Connect to SQLite database
    conn = sqlite3.connect(sqlite_db_path)
    cursor = conn.cursor()

    # Query SQLite table
    cursor.execute(f"SELECT * FROM Team")

    # Fetch all rows
    rows = cursor.fetchall()

    # Fetch table column names
    cursor.execute(f"PRAGMA table_info({table_name})")
    columns = [col[1] for col in cursor.fetchall()]

    # Write to CSV file
    with open(csv_file, 'w', newline='', encoding='utf-8') as f:
        csv_writer = csv.writer(f)
        # Write header
        csv_writer.writerow(columns)
        # Write rows
        csv_writer.writerows(rows)

    # Close connections
    cursor.close()
    conn.close()

# Example usage:
table_name = 'Team'
csv_file = r"C:\Users\user\Desktop\Team.csv"
sqlite_to_csv(table_name, csv_file)



def sqlite_to_csv(table_name, csv_file):
    # Connect to SQLite database
    conn = sqlite3.connect(sqlite_db_path)
    cursor = conn.cursor()

    # Query SQLite table
    cursor.execute(f"SELECT * FROM Team_Attributes")

    # Fetch all rows
    rows = cursor.fetchall()

    # Fetch table column names
    cursor.execute(f"PRAGMA table_info({table_name})")
    columns = [col[1] for col in cursor.fetchall()]

    # Write to CSV file
    with open(csv_file, 'w', newline='', encoding='utf-8') as f:
        csv_writer = csv.writer(f)
        # Write header
        csv_writer.writerow(columns)
        # Write rows
        csv_writer.writerows(rows)

    # Close connections
    cursor.close()
    conn.close()

# Example usage:
table_name = 'Team_Attributes'
csv_file = r"C:\Users\user\Desktop\Team_Attributes.csv"
sqlite_to_csv(table_name, csv_file)

#Ending







#Moving files to Mysql-Uploads

def move_file(source_file, destination_dir):
    try:
        # Move the file
        shutil.move(source_file, destination_dir)
        print(f"File moved successfully from {source_file} to {destination_dir}")
    except FileNotFoundError:
        print(f"Error: File {source_file} not found.")
    except PermissionError:
        print(f"Error: Permission denied. Check if you have write access to {destination_dir}.")
    except Exception as e:
        print(f"Error: {e}")

# Example usage:
source_file = r"C:\Users\user\Desktop\Country.csv"  # Replace with your source file path
destination_dir =r"C:\ProgramData\MySQL\MySQL Server 8.0\Uploads" # Replace with your destination directory path

move_file(source_file, destination_dir)




#Example usage:
source_file = r"C:\Users\user\Desktop\League.csv"  # Replace with your source file path
destination_dir =r"C:\ProgramData\MySQL\MySQL Server 8.0\Uploads" # Replace with your destination directory path

move_file(source_file, destination_dir)


source_file = r"C:\Users\user\Desktop\Match.csv"  # Replace with your source file path
destination_dir =r"C:\ProgramData\MySQL\MySQL Server 8.0\Uploads" # Replace with your destination directory path

move_file(source_file, destination_dir)

source_file = r"C:\Users\user\Desktop\Team_Attributes.csv"  # Replace with your source file path
destination_dir =r"C:\ProgramData\MySQL\MySQL Server 8.0\Uploads" # Replace with your destination directory path

move_file(source_file, destination_dir)


source_file = r"C:\Users\user\Desktop\Team.csv"  # Replace with your source file path
destination_dir =r"C:\ProgramData\MySQL\MySQL Server 8.0\Uploads" # Replace with your destination directory path

move_file(source_file, destination_dir)
