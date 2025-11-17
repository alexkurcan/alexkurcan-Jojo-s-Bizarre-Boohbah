# alexkurcan-Jojos-Bizarre-Boohbah
To preface, any grammatical errors were not correct, sorry Mr. McCuen, and feel free to take off points becuase of it.
## Question 1.
Even though **name** was within the SELECT list it was not put in with the GROUP BY and so the SQL would throw an error (since SQL requires ALL non-aggregated columns to appear wtihin the GROUP BY). All you need to do is add **name** to the GROUP BY.

## Question 2.
The main issue for this one, even though the original gives the correct output, is the logic behind it. You would be looking at ambiguous or possibly incorrect key matches. So all you would need to do is change the join condition and from "b.boohbah_id = s.stand_id" to "b.boohbah_id = l.boohbah_id" (to join the link table) and add "l.stand_id = s.stand_id" to join the stands, then the logic should be all good and everything should run fine.

## Question 3.
**boohbah_name** was a invalid identifier, since it did not exist within the table. Once you change this to **name** then it starts working again.

## Question 4.
The error that woduld appear was saying that the certain columns that had been called had ambiguity. This was in the WHERE clause and SELECT clause. All you would need to do is change **boohbah_id** to **b.boohbah_id** (you also do this to the WHERE clause) and the same to **stand_id** to **l.stand_id**.

## Question 5.
Although it appears to work, the subquery "WHERE boohbah_id = boohbah_id
" is comparing the column to itself (which is ALWAYS going to be true). Since it needs to compute the overall energy level all you would need to is remove the subquery that was above.

## Question 6.
The main issue that was wrong with this question was that it was trying to return multiple rows when the output was only expecting one row. However, once you add the ALL keyword to compare any of the stonger Boohbah's then it should start working. But it will say "no data found" Since there is not a single Boohbah that is stronger than any Season 3 stand user.

## Question 7.
The main issue with the given query is that it creates a cartesian product, since you are selecting from boohbah b and jojo_satnd s without really specifying the realtionship between each table. But once you add the "JOIN jojo_stand s ON b.stand_id = s.stand_id" It now has an EXPLICIT (no longer implicit) join, avoiding the creation of a cartesian product.

## Question 8.
Within the query you cannot use **AVG(sync_level)** directly in the WHERE clause since the WHERE clause works row by row, and all aggregate functions need to operate on a set of rows. Otherwise this will create an error since the query is trying to compare a single row to an aggreagte WITHOUT A SUBQUERY. Now, how to fix this, just move the **AVG(sync_level)** into it's own subquery to calculate the overall average first

## Question 9.
The main issue was that the subquery swaps **stand_id** and **boohbah_id** which means that column order doesn't match the outer query. But SQL requires a tuple within the IN clause that is in order and has the same types. So all you would need to is reorder the columns to make the outer query.

## Question 10.
Within the query the ON condition was wrong "boohbah_id = stand_id" does not represent the acutal relationship. Not to mentionn that there are mismatched columns within the join that prevent any matches so the update won't affect any of the rows. All you would need to is change the ON clause to use logical matching columns rather than unrelated IDs.