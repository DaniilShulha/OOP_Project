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

![DataModels](https://raw.github.com/DaniilShulha/OOP_Project/lab1/screenshot/Diagram.png)

Данное приложение использует архитектуру MVVM (Model - View - ViewModel)

# Models

![Models](https://raw.github.com/DaniilShulha/OOP_Project/lab1/screenshot/models.png)

### Модель Task

* taskID: String - уникальный идентификатор задачи.
* description: String - содержание задачи.
* dueDate: TimeInterval - дата , к которой нужно выполнить задачу.
* createdDate: TimeInterval - дата создания задачи.
* isDone: Bool - переменная для проверки выполнения задания.

### Модель User

* userID: String - уникальный идентификатор пользователя.
* username: String - имя пользователя.
* email: String - электронная почта пользователя.
* joined: TimeInterval - дата создания аккаунта.
  
# ViewModels

![ViewModels](https://raw.github.com/DaniilShulha/OOP_Project/lab1/screenshot/ViewModels.png)

### Модель отображения RegisterViewModel

* username: String - имя пользователя.
* password: String - пароль от аккаунта.
* email: String - электронная почта пользователя.

### Модель отображения LoginViewModel

* email: String - электронная почта пользователя.
* password: String - пароль от аккаунта.

### Модель отображения MainViewModel

* userID: String - уникальный идентификатор пользователя.

### Модель отображения ToDoListViewModel

* tasks: [Task] - список задач пользователя.
* userID: String - уникальный идентификатор пользователя.

### Модель отображения NewItemViewModel

* title - описание новой задачи.
* dueDate: TimeInterval - дата , к которой нужно выполнить задачу.

# Views

![Views](https://raw.github.com/DaniilShulha/OOP_Project/lab1/screenshot/Views.png)

### Отображение RegisterView

* viewModel: RegisterViewModel - переменная типа RegisterViewModel для выполнения регистрации.

### Отображение LoginView

* viewModel: LoginViewModel - переменная типа LoginViewModel для выполния входа.

### Отображеине MainView

* viewModel: MainViewModel - переменная типа MainViewModel для проверки авторизации.

### Отображение ToDoListView

* viewModel: ToDoListViewModel - переменная типа ToDoListViewModel для удаления задачи и показа всех существующих задач.

### Отображение NewItemView

* viewModel: NewItemModel - переменная типа NewItemView для создания новой задачи

### Отображение CalendarView

* viewModel: CalendarViewModel - переменная типа CalendarViewModel для проверки наличия задания в определенный день.

### Отображение TaskView

* task: Task - переменная типа Task для установки значений в элементах интерфейса.
* viewModel: TaskViewModel - переменная типа TaskViewModel для выполнения задачи.

# Методы

### Методы модели отображения RegisterViewModel

* register() - метод, осуществляющий регистрацию пользователя.
* confirm() - метод для проверки, введенных пользователем, данных.
* createUser() - метод, создающий пользователя в базе данных.

### Методы модели отображения LoginViewModel

* confirm() - метод для проверка существования данных пользователя.
* login() - метод, осуществляющий авторизацию пользователя.

### Метод модели отображения MainViewModel

* checkAuthorization() - метод, проверяющий вошел ли пользователь в аккаунт или нет.

### Методы модели отображения ToDoListViewModel

* getTasksFromDB(userID: String) - мето для получения всех задач пользователя из базы данных.
* deleteTask(taskID: String) - метод для удаления задачи по ее идентификатору.

## Метод модели отображения TaskViewModel

* setDone() - метод, который позволяет отметить задачу как выполненную.

## Методы модели отображения NewItemViewModel

* addNewTask() - метод, добавляющий новую задачу.
* checkCorrectness() - метод, проверяющий корректность данных в новой задаче.

## Метод модели отображения CalendarViewModel

* checkDate(date: Date) - метод для проверки наличия задач в определенный день.

* save() - метод для добавления и сохранения новой задачи.
* checkForCorrectness() - метод для проверки корректна ли поставлена задача.
