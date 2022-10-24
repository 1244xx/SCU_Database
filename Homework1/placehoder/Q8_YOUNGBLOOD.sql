SELECT RegionDescription, FirstName, LastName, MAX(BirthDate)
FROM Employee, EmployeeTerritory, Territory, Region
WHERE Employee.Id = EmployeeId AND TerritoryId = Territory.Id AND RegionId=Region.Id
GROUP BY Region.Id
ORDER BY Region.Id;