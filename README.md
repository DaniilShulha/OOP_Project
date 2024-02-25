# To Do List Application, Шульга Даниил, гр.253504

Данный проект представляет собой приложение Todo List для iOS, разработанное на Swift с использованием принципов объектно-ориентированного программирования (ООП).

**Todo List**, или список дел, - это инструмент для управления задачами, который помогает организовать и расставить приоритеты в вашей работе, учебе или повседневной жизни.

## Зачем он нужен?

* Повышение продуктивности: Todo List помогает вам сосредоточиться на важных задачах и не забывать о них.

* Улучшение тайм-менеджмента: Todo List позволяет планировать время и расставлять приоритеты.
  
* Увеличение мотивации: Отслеживание выполнения задач и достижение целей мотивирует двигаться дальше.

## Функции Todo List

* Добавление задач: Вы можете создавать задачи с названиями, описанием, сроками выполнения и приоритетами.

* Организация задач: Вы можете группировать задачи по категориям, проектам или тегам.
  
* Напоминания: Todo List может напоминать вам о задачах, которые нужно выполнить. И др...

# Диаграмма классов

![DataModels](https://raw.github.com/DaniilShulha/OOP_Project/lab1/screenshot/models.png)

### Класс ToDoListItem

* id: String - уникальный идентификатор задачи.
* description: String - содержание задачи.
* dueDate: TimeInterval - дата , к которой нужно выполнить задачу.
* createdDate: TimeInterval - дата создания задачи.

### Класс NewItem

* description: String - содержание задачи.
* dueDate: TimeInterval - дата , к которой нужно выполнить задачу.
* alert: Bool - переменная, для установления ошибки в создании новой задачи
  
### Класс ToDoListView

* showingNewItemView: Bool - переменная для показа окна создания задачи.
* items: ToDoListItem - перемення для хранения данных о задаче.
* userID: String - переменная для указания базе данных , куда записывать информацию

### Класс User

* id: String - уникальный идентификатор пользователя
* username: String - имя пользователя
* email: String - электронная почта пользователя
* joined: TimeInterval - дата создания аккаунта

### Класс Login

* email: String - электронная почта пользователя
* password: String - пароль пользователя

### Класс Register

* username: String - имя пользователя
* password: String - пароль пользователя
* email: String - электронная почта пользователя

# Методы

### Методы класса ToDoListItem

* setDone(state: Bool) - метод для установки того выполнена задача или нет.

### Методы класса NewItem

* save() - метод для добавления и сохранения новой задачи.
* checkForCorrectness() - метод для проверки корректна ли поставлена задача.

### Методы класса ToDoListView

* fetchData(userID: string) - метод, принимающий идентификатор пользователя, для добавления информации в базу данных.
* deleteItem(itemID: string) - метод, принимающий идентификатор задачи, для удаления задачи.

### Методы класса Login

* confirm() - метод для проверки и подтверждения данных пользователя.
* login() - метод для осуществления входа пользователя в приложение.

### Методы класса Register

* confirm() - метод для проверки корректности введенных данных.
* register() - метод для осуществления регистрации пользователя.