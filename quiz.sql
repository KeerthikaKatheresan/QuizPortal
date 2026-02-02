CREATE DATABASE quizPortal;
USE quizPortal;
CREATE TABLE users (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  email VARCHAR(100) UNIQUE,
  role ENUM('ADMIN','USER') DEFAULT 'USER',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE questions (
  question_id INT AUTO_INCREMENT PRIMARY KEY,
  question_text TEXT NOT NULL,
  option_a VARCHAR(255),
  option_b VARCHAR(255),
  option_c VARCHAR(255),
  option_d VARCHAR(255),
  correct_option CHAR(1) NOT NULL,
  created_by INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (created_by) REFERENCES users(user_id) ON DELETE SET NULL
);

CREATE TABLE quizzes (
  quiz_id INT AUTO_INCREMENT PRIMARY KEY,
  quiz_name VARCHAR(150) NOT NULL,
  description TEXT,
  total_questions INT DEFAULT 0,
  created_by INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (created_by) REFERENCES users(user_id) ON DELETE SET NULL
);

CREATE TABLE quiz_questions (
  id INT AUTO_INCREMENT PRIMARY KEY,
  quiz_id INT NOT NULL,
  question_id INT NOT NULL,
  question_order INT DEFAULT 0,
  FOREIGN KEY (quiz_id) REFERENCES quizzes(quiz_id) ON DELETE CASCADE,
  FOREIGN KEY (question_id) REFERENCES questions(question_id) ON DELETE CASCADE
);

CREATE TABLE attempts (
  attempt_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  quiz_id INT,
  score INT,
  attempted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (quiz_id) REFERENCES quizzes(quiz_id)
);

INSERT INTO users (username, password, email, role)
VALUES ('admin', 'admin123', 'admin@gmail.com', 'ADMIN');

INSERT INTO users (username, password, email, role)
VALUES ('keerthi', 'keerthi123', 'keerthi@gmail.com', 'USER');

INSERT INTO questions 
(question_text, option_a, option_b, option_c, option_d, correct_option, created_by)
VALUES 
('Which keyword is used to inherit a class in Java?', 'this', 'super', 'extends', 'implements', 'C', 1);

INSERT INTO questions 
(question_text, option_a, option_b, option_c, option_d, correct_option, created_by)
VALUES 
('Which of these is a valid main method signature?', 
'public static void main(String args)', 
'public void main(String[] args)', 
'public static void main(String[] args)', 
'static public int main(String[] args)', 
'C', 1);

INSERT INTO questions 
(question_text, option_a, option_b, option_c, option_d, correct_option, created_by)
VALUES 
('Which memory area stores class-level variables in Java?', 
'Stack', 'Heap', 'Method Area', 'CPU Register', 
'C', 1);

INSERT INTO questions 
(question_text, option_a, option_b, option_c, option_d, correct_option, created_by)
VALUES 
('Which concept allows method overloading and overriding?', 
'Encapsulation', 'Polymorphism', 'Inheritance', 'Abstraction', 
'B', 1);

INSERT INTO questions 
(question_text, option_a, option_b, option_c, option_d, correct_option, created_by)
VALUES 
('Which of the following cannot be achieved using interfaces?', 
'Multiple inheritance', 'Abstraction', 'Constructor creation', 'Loose coupling', 
'C', 1);

INSERT INTO questions 
(question_text, option_a, option_b, option_c, option_d, correct_option, created_by)
VALUES 
('Which interface is used to execute SQL queries in JDBC?', 
'Statement', 'DriverManager', 'Connection', 'ResultSet', 
'A', 1);

INSERT INTO questions 
(question_text, option_a, option_b, option_c, option_d, correct_option, created_by)
VALUES 
('Which method is used to establish database connection?', 
'getConnection()', 'executeQuery()', 'prepareStatement()', 'createStatement()', 
'A', 1);

INSERT INTO questions 
(question_text, option_a, option_b, option_c, option_d, correct_option, created_by)
VALUES 
('Which method is called only once in Servlet life cycle?', 
'doGet()', 'service()', 'init()', 'destroy()', 
'C', 1);

INSERT INTO questions 
(question_text, option_a, option_b, option_c, option_d, correct_option, created_by)
VALUES 
('Which tag is used to print output in JSP?', 
'<% %>', '<%= %>', '<%! %>', '<%@ %>', 
'B', 1);

INSERT INTO questions 
(question_text, option_a, option_b, option_c, option_d, correct_option, created_by)
VALUES 
('Which SQL command is used to remove a table?', 
'DELETE', 'DROP', 'TRUNCATE', 'REMOVE', 
'B', 1);

INSERT INTO questions 
(question_text, option_a, option_b, option_c, option_d, correct_option, created_by)
VALUES 
('Which constraint ensures unique values in a column?', 
'PRIMARY KEY', 'NOT NULL', 'UNIQUE', 'FOREIGN KEY', 
'C', 1);
