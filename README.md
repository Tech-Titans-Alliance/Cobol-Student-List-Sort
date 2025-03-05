# `SORTSTUDENTS` COBOL Program 📚📊

## Description 📝
The `SORTSTUDENTS` COBOL program is designed to read a list of student names and grades from a file, sort the records in ascending order based on the student grades, and then write the sorted records to a new output file. The program utilizes COBOL's `SORT` mechanism with a key (student grade) to organize the data. 🧑‍🎓🔢

## File Input and Output 📂
- **Input File**: `students.dat`  
  The input file should contain student records with their names and grades. Each student record should consist of a 30-character student name and a 2-digit grade.
  
- **Output File**: `sorted_students.dat`  
  The program generates an output file containing the student records sorted by grades in ascending order.

- **Temporary Sorting File**: `SORTWORK`  
  This is a work file used during the sorting process to temporarily hold the student records.

## Program Structure 📐
The program is divided into multiple sections:

### 1. **Identification Division** 🏷️
This section defines the name of the program as `SORTSTUDENTS`.

### 2. **Environment Division** 🌍
This division defines the files used in the program:
- `STUDENT-FILE`: The input file where student records are read from.
- `SORTED-STUDENT-FILE`: The output file where the sorted student records are written.
- `SORT-WORKFILE`: A work file used for sorting the records.

### 3. **Data Division** 📊
The data division defines the structure of the files and the variables used in the program:
- **STUDENT-FILE**: Defines the record structure with two fields—`STUDENT-NAME` (30 characters) and `STUDENT-GRADE` (2 digits).
- **SORT-WORKFILE**: Defines the work record structure used for sorting.
- **SORTED-STUDENT-FILE**: Defines the record structure for the sorted output file.
- **WORKING-STORAGE**: Declares an `EOF-INDICATOR` to indicate the end of the file while reading and writing.

### 4. **Procedure Division** 🛠️
This section contains the logic for reading, sorting, and writing records:
- `READ-STUDENT-RECORDS`: Opens the input file, reads student records until the end of the file is reached, and releases them into the sorting work file.
- `WRITE-SORTED-RECORDS`: Opens the output file and writes the sorted student records to the file.
- The program sorts the data by `STUDENT-GRADE` in ascending order using the `SORT` statement.

## Execution Flow 🔄
1. The program opens the input file (`students.dat`) and reads the records one by one.
2. Each record is moved to the sort work file for sorting.
3. Once all records are read, the program performs a sort on the records based on the student grade.
4. After sorting, the program writes the sorted records to the output file (`sorted_students.dat`).

## Usage 🚀
1. Compile the COBOL program using your COBOL compiler.
2. Ensure that the `students.dat` file is available in the directory.
3. Run the program. The sorted list of students will be saved in the `sorted_students.dat` file.

## Example 📑
- **Input** (`students.dat`):
    ```
    John Doe      85
    Jane Smith    92
    Alex Johnson  75
    Maria Lee     89
    ```

- **Output** (`sorted_students.dat`):
    ```
    Alex Johnson  75
    John Doe      85
    Maria Lee     89
    Jane Smith    92
    ```

## Dependencies 🔧
- A COBOL compiler that supports the `SORT` statement.
- A system that can handle file input and output operations.


## Contact 📬
For any questions or suggestions, feel free to open an issue or contact !

---

Made with ❤️ by [Tech Titains]
