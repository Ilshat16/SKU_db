CREATE PROC dbo.usp_MakeFamilyPurchase
    @FamilySurName VARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @FamilyID INT, @BudgetValue DECIMAL(18, 2)
    IF NOT EXISTS (SELECT * FROM dbo.Family WHERE SurName = @FamilySurName)
		PRINT('Такой фамилии нет в базе данных');
    SELECT @FamilyID = ID, @BudgetValue = BudgetValue
    FROM dbo.Family
    WHERE SurName = @FamilySurName;
    UPDATE dbo.Family
		SET BudgetValue = @BudgetValue - (SELECT SUM(Value) FROM dbo.Basket WHERE ID_Family = @FamilyID)
    WHERE ID = @FamilyID
END;
GO