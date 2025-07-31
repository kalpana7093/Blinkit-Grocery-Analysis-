SELECT * FROM blinkit_data
SELECT COUNT(*) FROM blinkit_data
UPDATE blinkit_data
SET Item_Fat_Content=
CASE 
WHEN Item_Fat_Content IN ('LF','low fat') THEN 'Low Fat'
WHEN Item_Fat_Content = 'reg' THEN 'Regular'
ELSE Item_Fat_Content
END
SELECT DISTINCT(Item_Fat_Content) FROM blinkit_data


SELECT SUM(Total_Sales) AS Total_sales
FROM blinkit_data
SELECT CAST(SUM(Total_Sales)/ 1000000 AS DECIMAL(10,2)) AS Total_sales_million
FROM blinkit_data

SELECT AVG(Total_Sales) AS Avg_sales 
FROM blinkit_data
SELECT CAST(AVG(Total_Sales) AS DECIMAL(10,0)) AS Avg_sales
FROM blinkit_data

SELECT COUNT(*) AS No_of_items FROM blinkit_data

SELECT AVG(Rating) AS Avg_Rating FROM blinkit_data
SELECT CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating 
FROM blinkit_data

SELECT CAST(SUM(Total_Sales)/ 1000000 AS DECIMAL(10,2)) AS Total_sales_million
FROM blinkit_data
WHERE Item_Fat_Content='Low Fat'

SELECT CAST(AVG(Total_Sales) AS DECIMAL(10,0)) AS Avg_sales
FROM blinkit_data
WHERE Outlet_Establishment_Year = 2012

SELECT COUNT(*) AS No_of_items FROM blinkit_data
WHERE Item_Fat_Content='Low Fat'

SELECT Item_Type,
SUM(Total_Sales) AS Total_sales ,
AVG(Total_Sales) AS Avg_sales,
COUNT(*) AS No_of_items ,
AVG(Rating) AS Avg_Rating
FROM blinkit_data
WHERE Outlet_Establishment_Year= 2011
GROUP BY Item_Type
ORDER BY Total_sales


SELECT Item_Fat_Content,
SUM(Total_Sales) AS Total_sales ,
AVG(Total_Sales) AS Avg_sales,
COUNT(*) AS No_of_items ,
AVG(Rating) AS Avg_Rating
FROM blinkit_data
WHERE Outlet_Establishment_Year= 2011
GROUP BY Item_Fat_Content
ORDER BY Total_sales


SELECT Outlet_Location_Type, 
       ISNULL([Low Fat], 0) AS Low_Fat, 
       ISNULL([Regular], 0) AS Regular
FROM 
(
    SELECT Outlet_Location_Type, Item_Fat_Content, 
           CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales
    FROM blinkit_data
    GROUP BY Outlet_Location_Type, Item_Fat_Content
) AS SourceTable
PIVOT 
(
    SUM(Total_Sales) 
    FOR Item_Fat_Content IN ([Low Fat], [Regular])
) AS PivotTable
ORDER BY Outlet_Location_Type;

SELECT Outlet_Establishment_Year,
SUM(Total_Sales) AS Total_sales ,
AVG(Total_Sales) AS Avg_sales,
COUNT(*) AS No_of_items ,
AVG(Rating) AS Avg_Rating
FROM blinkit_data
GROUP BY Outlet_Establishment_Year
ORDER BY Outlet_Establishment_Year

SELECT Outlet_Size,
       CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
      CAST( SUM(Total_Sales) * 100 / SUM(SUM(Total_Sales)) OVER() AS  DECIMAL(10,2)) AS Sales_percentage
FROM blinkit_data
GROUP BY Outlet_Size
ORDER BY Total_Sales

SELECT Outlet_Location_Type,
SUM(Total_Sales) AS Total_sales ,
AVG(Total_Sales) AS Avg_sales,
COUNT(*) AS No_of_items ,
AVG(Rating) AS Avg_Rating
FROM blinkit_data
GROUP BY Outlet_Location_Type
ORDER BY  Total_sales

