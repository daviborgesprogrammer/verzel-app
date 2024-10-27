# Verzel Challenges
![image](assets/readme/banner_verzel.png)

### Mobile Jr Practical Test

The purpose of this test is to validate technical knowledge in mobile development, programming logic and understanding of demand.

<u>**Solution Proposal**</u>

Develop an app for registering tasks.

<u>**Mandatory technologies**</u>
- [x] Flutter
- [x] SQLite

<u>**Requirements**</u>
- [x] Only logged-in users can create tasks;
- [x] Upon opening the app, a login form should be displayed;
- [x] On the login form, there should be a link to the registration form;
- [x] To register, the app should request (name, email, date of birth, CPF, ZIP code, address, number, password);
- [x] The fields name, email, date of birth, and password are mandatory, others are optional;
- [x] Only users over 12 years old can register;
- [x] The CPF field must have a mask and CPF validation;
- [x] The ZIP code must be validated and have address autocomplete;
- After logging in:
  - [x] A list of registered tasks should be displayed;
  - [x] There should be a button to create new tasks;
  - [x] Each record in the list should have actions (edit, delete, view, complete)
  - [x] The complete action should only be for open tasks (not completed), and should request confirmation to complete a task;
  - [x] It should request confirmation for the user to delete a task;
  - [x] Task creation should have the fields (name, due date, completion date);
  - [x] The name and due date fields are mandatory, others are optional;
  - [x] Each logged-in user should only see their own tasks;
  - [x] All data should be persisted locally within the app;


<u>**Differentials:**</u>
- Perform unit tests of components;

## 🎨 Proposed Layout
<p align="left">
  <img src="assets/readme/sign_up.png" width="200px">
  <img src="assets/readme/sign_in.png" width="200px">
  <img src="assets/readme/task_list.png" width="200px">
  <img src="assets/readme/create_task.png" width="200px">
  <img src="assets/readme/view_task.png" width="200px">
  
</p>

## README versions
[Português BR](./README.md) | [Ingles US](./README-en.md)