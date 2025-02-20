
# RnD2

## Overview
RnD2 is a Flask-based web application designed for [specific use case, e.g., CAD file processing, geometric modeling, or engineering tools]. The application uses PostgreSQL for data management and integrates libraries for advanced geometric and graphical operations.

## Features
- **User Management**: Authentication and file handling functionalities.
- **File Upload & Processing**: Supports the upload of engineering/CAD-related files for analysis.
- **Visualization**: Interactive visualizations powered by Plotly.
- **Database Integration**: Utilizes PostgreSQL to store and manage toolpaths and user feedback.

---

## Requirements

### Technologies
- **Python 3.7+**
- **PostgreSQL** (Port: 5433)
- **Flask** Framework
- **SQLAlchemy** for ORM

---

## Installation

### 1. Clone the Repository
```bash
git clone https://github.com/SreenivasuAkella/RnD2.git
cd RnD2
```

### 2. Install Dependencies
Set up a virtual environment:
```bash
python -m venv venv
source venv/bin/activate    # For Linux/Mac
venv\Scripts\activate       # For Windows
```

Install required libraries:
```bash
pip install -r requirements.txt
```

### 3. Configure PostgreSQL
- Install PostgreSQL and ensure it runs on port **5432**.
- Create a database named `toolpath_db`:
  ```sql
  CREATE DATABASE toolpath_db;
  ```
- Update the `app.py` file:
  ```python
  app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql+psycopg2://postgres:<password>@localhost:5432/toolpath_db'
  ```
  Replace `<password>` with your PostgreSQL password.

### 4. Run the Application
Start the Flask app:
```bash
python app.py
```
Access the app at [http://localhost:5000](http://localhost:5000).

---

## File Structure
- **`app.py`**: Main Flask application file.
- **`templates/`**: Contains HTML templates for the web interface.
- **`static/`**: Contains static files like CSS and JavaScript.
- **`uploads/`**: Directory for uploaded files.
- **`users/`**: Organized user data.

---

## Contributing
1. Fork the repository.
2. Create a feature branch (`git checkout -b feature-name`).
3. Commit changes (`git commit -m 'Add feature'`).
4. Push to the branch (`git push origin feature-name`).
5. Open a pull request.

---

## License
[MIT License](LICENSE)

## Contact
For questions or issues, contact [Sreenivasu Akella ](mailto:210020001@iitdh.ac.in).
