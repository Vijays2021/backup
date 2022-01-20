//16,19,27

1) How many books are there in each category, in the library?
select category, count(book_id) as Book_count
from book 
group by category

2) Title wise how many copies of books are available in the ‘rdbms’ category?
select title,sum(copyno) 
from book 
where lower(category) = 'rdbms'
group by title 

3)Prepare a list of the latest edition of the books in category/title sequence,
in the following format: Category title edition
select category, title, max(edition) latest_edition 
from book 
group by title,category

4) Which publisher(s) books are the maximum available in the library?
select publisher_id,count(book_id) 
from book
group by publisher_id 
having count(book_id) >= ALL 
						(select count(book_id) 
                         from book 
                         group by publisher_id)

6) What are the categories of books published by ‘willey publications’
select category
from book 
where publisher_id = 
					(select publisher_id 
                    from publisher 
                    where lower(publisher_name) = 'willey publications')

16) How many copies of book available in each publication?
select publisher_id,count(book_id)
from book
group by publisher_id

7) Which are the categories of books that are least utilised

SELECT category, count(issue_date)
FROM book_transaction bt
JOIN book bk
ON bt.book_id = bk.book_id 
GROUP BY category 
HAVING count(issue_date) <= ALL( SELECT count(issue_date)
								  FROM book_transaction bt
                                  JOIN book bk
                                  ON bt.book_id = bk.book_id 
                                  GROUP BY category )

8) Which are the categories of books that are most utilised
SELECT category, count(issue_date)
FROM book_transaction bt
JOIN book bk
ON bt.book_id = bk.book_id 
GROUP BY category 
HAVING count(issue_date) >= ALL( SELECT count(issue_date)
								  FROM book_transaction bt
                                  JOIN book bk
                                  ON bt.book_id = bk.book_id 
                                  GROUP BY category )

19) Which is the costliest book in each publication?
Solution 1
select publisher_id,max(price)
from book
group by publisher_id

Solution 2
select publisher.publisher_name,book.publisher_id,book.title, max(price) 
from book 
join publisher
on publisher.publisher_id = book.publisher_id
group by publisher_id

27) Which is the cheapest book in each publication?
Solution 1
select publisher_id,min(price)
from book
group by publisher_id

Solution 2
select publisher.publisher_name,book.publisher_id,book.title, min(price) 
from book 
join publisher
on publisher.publisher_id = book.publisher_id
group by publisher_id

5) Prepare a list of books that are due as on date, in delay descending
sequence , in the following format: Title member name due date delay 'Need to understand the question properly'
SELECT b.title,m.member_name,bt.due_date,(bt.return_date-bt.due_date) AS delay
FROM book b JOIN book_transaction bt
ON b.book_id = bt.book_id
JOIN member m
ON bt.member_id = m.member_id
WHERE (bt.return_date-bt.due_date) >0
ORDER BY delay desc

9) Which books were not lent during the last quarter of the year(oct-dec
2003)
select book_id, issue_date 
from book_transaction
 where book_id not in ( select book_id 
						from book_transaction 
                        where quarter(issue_date) = 4)
                        
10) List the book detail taken by each member.
select b.book_id,b.title, b.category,member.member_name 
from member 
join book_transaction 
on member.member_id = book_transaction.member_id
 join book b
 ON b.book_id=book_transaction.book_id
 ORDER BY MEMBER.MEMBER_ID
													
11) Which author’s book is more in number in the library?
Solution1:
select author_id
 from book 
 having count(book_id) >= all (select count(book_id)
								from book
                                group by author_id) 
Solution2:
select author_name 
from author 
join book 
on author.author_id = book.author_id
 having count(book_id) >=all(select count(book_id) 
							 from book  
                             group by author_id) 

12) Which author’s book is costliest? 'Shouldnt check only max price alone'

select author.author_name, book.author_id from book join author on author.author_id = book.author_id
where price = ( select max(price) from book)

13) Along with member details, list the books that crossed the due date.

select member.member_id, member.member_name,member.member_dept, book_id, (return_date-due_date) as delay
from book_transaction join member on member.member_id = book_transaction.member_id
where return_date>due_date

14) Who is the most delaying member in the library?

select member_id, (return_date-due_date) delay 
from book_transaction
 where (return_date-due_date) >= all (select(return_date-due_date) 
									  from book_transaction 
                                      where return_date > due_date)
               
15) Which publication is being used by most of the members?

select publisher.publisher_name,book.publisher_id, count(distinct member.member_id) 
from book 
join publisher on publisher.publisher_id =book.publisher_id 
join book_transaction on book.book_id = book_transaction.book_id 
join member on member.member_id = book_transaction.member_id 
group by publisher.publisher_id
having count(distinct member.member_id) >= all(select count(distinct member.member_id) 
											   from book 
                                               join publisher on publisher.publisher_id =book.publisher_id 
                                               join book_transaction on book.book_id = book_transaction.book_id 
                                               join member on member.member_id = book_transaction.member_id
                                               group by publisher.publisher_id)
                                               
 20) List the authors belonging to each publication.

select distinct author.author_id, author.author_name, book.publisher_id from book
join author on book.author_id = author.author_id 
join publisher on publisher.publisher_id = book.publisher_id order by publisher_id, author_id

21) Which publication’s book is most delayed in returning?

select book.publisher_id, book.book_id from book join book_transaction 
on book.book_id = book_transaction.book_id 
 where (return_date-due_date) >= all (select(return_date-due_date) 
									  from book_transaction 
                                      where return_date > due_date)

25) Find the latest edition of each book along with their authors name?
                               
select b.book_id,ar.author_name,max(Edition)
from book b join author ar 
on b.author_id=ar.author_id
group by book_id,author_name       

26) Who is the frequent accesser in each department?

select member_id from book_transaction group by member_id 
having count(member_id) >=all ( select  count(member_id) from book_transaction
group by member_id   )                 

28) How many no. Of books available for “java” in each publication?

select count(book_id) from book 
where title like '%java%'
group by publisher_id                                               
                                               
29) Count the inactive members in each department.

select count(member_id),  member_dept from member where status like '%inactive%'
group by member_dept  

30) Which book is being returned very late frequently?

SELECT title , book_id 
FROM book
WHERE book_id in (SELECT book_id 
				  FROM book_transaction
				  WHERE return_date>due_date)

32) Which books were lent during the first quarter of the year?

SELECT book_id,title 
FROM book
WHERE book_id IN(SELECT book_id 
				 FROM book_transaction 
				 GROUP BY book_id,issue_date 
				 HAVING  quarter(issue_date) = 1)

33) Who are the inactive members in each epartment?

SELECT MEMBER_NAME, MEMBER_DEPT
FROM MEMBER
WHERE STATUS like '%inactive%'
GROUP BY MEMBER_DEPT

34) Who is frequent visitor of the library?

SELECT member_name
FROM member
WHERE member_id IN (SELECT member_id
		      	      FROM book_transaction)

35) List the bookname, author_name, publisher_name for the books
     Available in rack no. 5

SELECT b.title,a.author_name,p.publisher_name 
FROM book b JOIN author a 
ON b.author_id=a.author_id 
JOIN publisher p
ON p.publisher_id=b.publisher_id 
WHERE b.rackno=101

36) Which rack of books is being accessed frequently?

select rackno from book having count(book_id) >= all
(select count(book_id) from book where book_id in (select book_id from book_transaction)
group by rackno)

37) Which rack of books is being accessed least?

select rackno from book having count(book_id) <= all
(select count(book_id) from book where book_id in (select book_id from book_transaction)
group by rackno)

38) Count the book rack wise.

SELECT COUNT(book_id) book_count,rackno
FROM book
GROUP BY rackno

39) Who is the oldest member of the library?

SELECT member_name, member_id 
FROM member
WHERE member_doj=(SELECT MIN(member_doj) 
			      FROM member)
										  
							 
                                            
                                               