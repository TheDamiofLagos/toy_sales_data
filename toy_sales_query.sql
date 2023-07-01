WITH
  sales AS (
  SELECT
    Date,
    Sale_ID AS salesID,
    Units,
    Store_ID,
    Product_ID
  FROM
    `toy_sales.sales` ),

  products AS (
  SELECT
    Product_ID,
    Product_Name,
    Product_Category,
    Product_Cost,
    Product_Price,
    Product_Price - Product_Cost AS unitProfit
  FROM
    `toy_sales.products` ),

  store AS (
  SELECT
    Store_ID,
    Store_Location
  FROM
    `toy_sales.stores` ),

  final AS (
  SELECT
    s.Date,
    s.salesID,
    p.Product_Name,
    p.Product_Category,
    p.Product_Cost,
    p.Product_Price,
    p.unitProfit * s.units AS totalProfit,
    st.Store_Location
  FROM
    sales s
  LEFT JOIN
    products p
  ON
    s.Product_ID = p.Product_ID
  LEFT JOIN
    store st
  ON
    st.Store_ID = s.Store_ID )

SELECT
  MAX(Date),
  MIN(Date)
FROM
  final
