CREATE VIEW dbo.vw_SKUPrice
AS
SELECT *, dbo.udf_GetSKUPrice(ID) AS SKUPrice
FROM dbo.SKU;