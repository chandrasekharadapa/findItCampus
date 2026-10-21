FINDIT CAMPUS — FLASK + MYSQL

SETUP (Windows / XAMPP)
1. Extract this folder somewhere convenient, for example: C:\FindItCampus.
2. Open XAMPP Control Panel and click Start next to Apache (optional for this app) and MySQL.
3. Open http://localhost/phpmyadmin
4. Choose Import and import schema.sql, OR open the SQL tab and run its contents.
5. Open Command Prompt in this folder.
6. Create/activate a virtual environment if desired, then install packages:
       py -m pip install -r requirements.txt
7. Run the app:
       py app.py
8. Open this exact address in your browser:
       http://127.0.0.1:5000
   Do not double-click index.html or open it as file://.

DATABASE SETTINGS
Defaults are XAMPP defaults: host 127.0.0.1, port 3306, user root, blank password, database findit_campus.
If your MySQL root account has a password, set MYSQL_PASSWORD before running app.py.

WHAT CHANGED
- Browser localStorage/sessionStorage is not used for accounts, items, notifications, or theme.
- Registration and login are handled by Flask; passwords are hashed on the server.
- Item reports and receive notifications are stored in MySQL.
- The original HTML/CSS layout is retained, with JavaScript calling Flask JSON APIs.

NOTES
- This is a college-project starter. Before public deployment, change FINDIT_SECRET_KEY, disable debug mode, use HTTPS, and add stronger server-side validation and CSRF protection.
- Existing localStorage data from the old version is not automatically migrated. New accounts and new reports are stored in MySQL.
