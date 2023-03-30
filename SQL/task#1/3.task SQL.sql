1. Найти информацию о всех контрактах, связанных с сотрудниками департамента «Logistic». Вывести: contract_id, employee_name

SELECT contract_id, em.name FROM department de
JOIN employees em ON em.department_id = de.id
JOIN executor ex ON ex.tab_no = em.id
WHERE de.name = 'Logistic'

2. Найти среднюю стоимость контрактов, заключенных сотрудников Ivan Ivanov. Вывести: среднее значение amount

SELECT AVG(amount) FROM department de
JOIN employees em ON em.department_id = de.id
JOIN executor ex ON ex.tab_no = em.id
JOIN contract co ON co.id = ex.contract_id
WHERE em.name = 'Ivan Ivanov'

3. Найти самую часто встречающуюся локации среди всех заказчиков. Вывести: location, count
(Согласовано в телеграме предоставить два варианта ответа)

Вычисления произведены только по таблице 'customer' .

SELECT location, COUNT(location) FROM customer
GROUP BY location
HAVING COUNT(location) = 
(SELECT COUNT(location) FROM customer
GROUP BY location
ORDER BY COUNT(location)
DESC
LIMIT 1)

Вычисления произведены по всей БД.

SELECT location, COUNT(location) FROM department de
JOIN employees em ON em.department_id = de.id
JOIN executor ex ON ex.tab_no = em.id
JOIN contract co ON co.id = ex.contract_id
JOIN customer cu ON cu.id = co.customer_id
GROUP BY location
HAVING COUNT(location) = 
(SELECT COUNT(location) FROM department de
JOIN employees em ON em.department_id = de.id
JOIN executor ex ON ex.tab_no = em.id
JOIN contract co ON co.id = ex.contract_id
JOIN customer cu ON cu.id = co.customer_id
GROUP BY location
ORDER BY COUNT(location)
DESC
LIMIT 1)

4. Найти контракты одинаковой стоимости. Вывести count, amount

SELECT COUNT(amount), amount FROM department de
JOIN employees em ON em.department_id = de.id
JOIN executor ex ON ex.tab_no = em.id
JOIN contract co ON co.id = ex.contract_id
JOIN customer cu ON cu.id = co.customer_id
GROUP BY amount
HAVING COUNT(amount) > 1
ORDER BY COUNT(amount)

5. Найти заказчика с наименьшей средней стоимостью контрактов. Вывести customer_name, среднее значение amount

SELECT customer_name, AVG(amount) FROM department de
JOIN employees em ON em.department_id = de.id
JOIN executor ex ON ex.tab_no = em.id
JOIN contract co ON co.id = ex.contract_id
JOIN customer cu ON cu.id = co.customer_id
GROUP BY customer_name
HAVING AVG(amount) =
(SELECT AVG(amount) FROM department de
JOIN employees em ON em.department_id = de.id
JOIN executor ex ON ex.tab_no = em.id
JOIN contract co ON co.id = ex.contract_id
JOIN customer cu ON cu.id = co.customer_id
GROUP BY customer_name
ORDER BY AVG(amount)
LIMIT 1)

6.Найти отдел, заключивший контрактов на наибольшую сумму. Вывести: department_name, sum

SELECT de.name AS department_name, SUM(amount) FROM department de
JOIN employees em ON em.department_id = de.id
JOIN executor ex ON ex.tab_no = em.id
JOIN contract co ON co.id = ex.contract_id
GROUP BY department_name
HAVING SUM(amount) = 
(SELECT SUM(amount) FROM department de
JOIN employees em ON em.department_id = de.id
JOIN executor ex ON ex.tab_no = em.id
JOIN contract co ON co.id = ex.contract_id
GROUP BY de.name
ORDER BY SUM(amount)
DESC
LIMIT 1)
