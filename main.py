#Импорт библиотеки для работы с БД
import psycopg2
#Импорт системной библиотеки (библиотека функций для работы с операционной системой)
import os
#Импорт переменных(данных из PostgreSQL), которые нужны для подключения 
from config import user, password, host, db_name, port
#Добавление информации в каждую сущность при помощи INSERT
#Добавление информации в таблицу Sales
def InsertSales(ID_assistant, ID_product, ID_buyer, Quantity):
    with connection.cursor() as cursor:
        cursor.execute(f"INSERT INTO sales(sales_assisntant, sales_product, sales_buyer, sales_quantity) \
                       VALUES({ID_assistant}, {ID_product}, {ID_buyer}, {Quantity})")
#Добавление информации в таблицу Buyers
def InsertBuyers(Fullname):
    with connection.cursor() as cursor:
        cursor.execute(f"INSERT INTO buyers(buyers_name) \
                        VALUES('{Fullname}')")
#Добавление информации в таблицу Assistants
def InsertAssistans(Fullname, Post):
    with connection.cursor() as cursor:
        cursor.execute(f"INSERT INTO assistants(assistant_name, assistant_post) \
                       VALUES('{Fullname}', '{Post}')")
#Добавление информации в таблицу Products
def InsertProducts(Name, Price, Quantity):
    with connection.cursor() as cursor:
        cursor.execute(f"INSERT INTO products(product_name, product_price, product_quantity) \
                       VALUES('{Name}', {Price}, {Quantity})")
#Удаление информации из каждой сущности при помощи DELETE
#Удаление информации из таблицы Sales        
def DeleteSales(ID_sales):
    with connection.cursor() as cursor:
        cursor.execute(f"DELETE FROM sales \
                       WHERE sales_id = {ID_sales}")
#Удаление информации из таблицы Buyers
def DeleteBuyers(Fullname):
    with connection.cursor() as cursor:
        cursor.execute(f"DELETE FROM buyers \
                       WHERE buyers_name = '{Fullname}'")
#Удаление информации из таблицы Assistants 
def DeleteAssistants(Fullname):
    with connection.cursor() as cursor:
        cursor.execute(f"DELETE FROM assistants \
                       WHERE assistant_name = '{Fullname}'")
#Удаление информации из таблицы Products
def DeleteProducts(ID_product):
    with connection.cursor() as cursor:
        cursor.execute(f"DELETE FROM products \
                       WHERE product_id = {ID_product}")
#Изменение информации в каждой сущности при помощи UPDATE
#Обновим информацию в таблице Sales        
def UpdateSales(ID_sale, ID_assistant, ID_product, ID_buyer, Quantity):
     with connection.cursor() as cursor:
        cursor.execute(f"UPDATE sales \
                        SET sales_assistant = {ID_assistant}, \
                            sales_product = {ID_product}, \
                            sales_buyer = {ID_buyer}, \
                            sales_quantity = {Quantity} \
                        WHERE sales_id = {ID_sale}")
#Обновим информацию в таблице Buyers   
def UpdateBuyers(ID_buyer, Fullname):
     with connection.cursor() as cursor:
        cursor.execute(f"UPDATE buyers \
                        SET buyers_id = {ID_buyer}, \
                        WHERE buyers_name = '{Fullname}'")
#Обновим информацию в таблице Assistants     
def UpdateAssistants(ID_assistant, Fullname, Post):
     with connection.cursor() as cursor:
        cursor.execute(f"UPDATE assistants \
                        SET assistant_name = '{Fullname}', \
                            assistant_post = '{Post}' \
                        WHERE assistant_id = {ID_assistant}")
#Обновим информацию в таблице Products    
def UpdateProducts(ID_product, Name, Price, Quantity):
     with connection.cursor() as cursor:
        cursor.execute(f"UPDATE products \
                        SET product_name = '{Name}', \
                            product_price = {Price}, \
                            product_quantity = {Quantity} \
                        WHERE product_id = {ID_product}")
#Поиск информации в каждой сущности при помощи SELECT
#Произведем поиск по столбцу sales_id (Индивидуальный номер продажи) и выведем всю подходящую информацию             
def SearchSales(ID_sales):
    with connection.cursor() as cursor:
        cursor.execute(f"SELECT sales_id, sales_assistant, sales_product, sales_buyer, sales_quantity FROM sales \
                       WHERE sales_id = {ID_sales}")
        print(cursor.fetchone())
#Произведем поиск по столбцу buyers_name (ФИО сотрудника) и выведем всю подходящую информацию  
def SearchBuyers(Fullname):
    with connection.cursor() as cursor:
        cursor.execute(f"SELECT buyers_id, buyers_name FROM buyers \
                       WHERE buyers_name = '{Fullname}'")
        print(cursor.fetchone())
#Произведем поиск по столбцу assistant_name (ФИО сотрудника) и выведем всю подходящую информацию  
def SearchAssistants(Fullname):
    with connection.cursor() as cursor:
        cursor.execute(f"SELECT assistant_id, assistant_name, assistant_post FROM assistants \
                       WHERE assistant_name = '{Fullname}'")
        print(cursor.fetchone())
#Произведем поиск по столбцу product_id (Индивидуальный номер товара) и выведем всю подходящую информацию  
def SearchProducts(ID_product):
    with connection.cursor() as cursor:
        cursor.execute(f"SELECT product_id, product_name, product_price, product_quantity FROM products \
                       WHERE product_id = {ID_product}")
        print(cursor.fetchone())
#Подключение к нашей БД
try:
    connection = psycopg2.connect(
        user = user,
        password = password,
        host = host,
        dbname = db_name,
        port = port
    )
    connection.autocommit = True
#Реализация меню. Сначала мы выбираем действие, а затем таблицу(сущность), с которой делаем ранее выбранное действие.
#Заранее думаем о том, что пользователь что-то может ввести с ошибкой или каких-то данных в таблицах может не оказаться.
    while True:
        print("""Меню:
              1)Добавить;
              2)Удалить;
              3)Обновить;
              4)Поиск;
              5)Выйти;""")
        number = int(input("\nВведите номер инструкции: "))
        
        match number:
            case 1:
                os.system("cls")

                while True:
                    print("""Меню таблиц:
                          1)Продажи;
                          2)Товары;
                          3)Сотрудники;
                          4)Покупатели;
                          5)Выход;""")
                    
                    table = int(input("Введите номер таблицы: "))

                    match table:
                        case 1:
                            InsertSales(input("Введите ID продавца: "),
                                        input("Введите ID товара: "),
                                        input("Введите ID покупателя: "),
                                        input("Введите количество товара: "))

                            os.system("pause")
                            os.system("cls")
                        case 2:
                            InsertProducts(input("Введите наименование товара: "),
                                           input("Введите цену товара: "),
                                           input("Введите количество товара: "))

                            os.system("pause")
                            os.system("cls")
                        case 3:
                            InsertAssistans(input("Введите ФИО сотрудника: "),
                                            input("Введите должность сотрудника: "))

                            os.system("pause")
                            os.system("cls")
                        case 4:
                            InsertBuyers(input("Введите ФИО покупателя: "))

                            os.system("pause")
                            os.system("cls")
                        case 5:
                            os.system("cls")
                            break
            case 2:
                os.system("cls")

                while True:
                    print("""Меню таблиц:
                          1)Продажи;
                          2)Товары;
                          3)Сотрудники;
                          4)Покупатели;
                          5)Выход;""")
                    
                    table = int(input("Введите номер таблицы: "))

                    match table:
                        case 1:
                            DeleteSales(input("Введите ID покупки: "))
                            
                            os.system("pause")
                            os.system("cls")
                        case 2:
                            DeleteProducts(input("Введите ID товара: "))

                            os.system("pause")
                            os.system("cls")
                        case 3:
                            DeleteAssistants(input("Введите ФИО сотрудника: "))

                            os.system("pause")
                            os.system("cls")
                        case 4:
                            DeleteBuyers(input("Введите ФИО покупателя: "))

                            os.system("pause")
                            os.system("cls")
                        case 5:
                            os.system("cls")
                            break
            case 3:
                os.system("cls")

                while True:
                    print("""Меню таблиц:
                          1)Продажи;
                          2)Товары;
                          3)Сотрудники;
                          4)Покупатели;
                          5)Выход;""")
                    
                    table = int(input("Введите номер таблицы: "))

                    match table:
                        case 1:
                            UpdateSales(input("Введите ID продажи: "),
                                        input("\nОбновим данные:\nВведите ID сотрудника: "),
                                        input("Введите ID товара: "),
                                        input("Введите ID покупателя: "),
                                        input("Введите количество проданного товара: "))
                            
                            os.system("pause")
                            os.system("cls")
                        case 2:
                            UpdateProducts(input("Введите ID товара: "),
                                           input("\nОбновим данные:\nВведите наименование товара: "),
                                           input("Введите цену товара: "),
                                           input("Введите количество: "))

                            os.system("pause")
                            os.system("cls")
                        case 3:
                            UpdateAssistants(input("Введите ID сотрудника: "),
                                            input("\nОбновим данные:\nВведите ФИО сотрудника: "),
                                            input("Введите должность сотрудника: "))

                            os.system("pause")
                            os.system("cls")
                        case 4:
                            UpdateBuyers(input("Введите ID покупателя: "),
                                        input("\nОбновим данные:\nВведите ФИО покупателя: "))

                            os.system("pause")
                            os.system("cls")
                        case 5:
                            os.system("cls")
                            break
            case 4:
                os.system("cls")

                while True:
                    print("""Меню таблиц:
                          1)Продажи;
                          2)Товары;
                          3)Сотрудники;
                          4)Покупатели;
                          5)Выход;""")
                    
                    table = int(input("Введите номер таблицы: "))

                    match table:
                        case 1:
                            SearchSales(input("Введите ID покупки: "))
                            
                            os.system("pause")
                            os.system("cls")
                        case 2:
                            SearchProducts(input("Введите ID товара: "))

                            os.system("pause")
                            os.system("cls")
                        case 3:
                            SearchAssistants(input("Введите ФИО сотрудника: "))

                            os.system("pause")
                            os.system("cls")
                        case 4:
                            SearchBuyers(input("Введите ФИО покупателя: "))

                            os.system("pause")
                            os.system("cls")
                        case 5:
                            os.system("cls")
                            break
            case 5:
                os.system("cls")
                break
except Exception as _ex:
    print("[INFO] Error while working with PostgreSQL", _ex)

finally:
    connection.close()
    print("[INFO] PostgreSQL connection closed")