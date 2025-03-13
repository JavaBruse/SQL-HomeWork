WITH RECURSIVE man_hierarchy AS (
    SELECT e.EmployeeID, e.Name, e.ManagerID, e.DepartmentID, e.RoleID
    FROM Employees e
    WHERE e.EmployeeID = 1  

    UNION ALL

	SELECT e.EmployeeID, e.Name, e.ManagerID, e.DepartmentID, e.RoleID
    FROM Employees e
    INNER JOIN man_hierarchy eh ON e.ManagerID = eh.EmployeeID
)

SELECT 
    eh.EmployeeID, 
    eh.Name AS EmployeeName, 
    eh.ManagerID, 
    dep.DepartmentName, 
    rol.RoleName,
    COALESCE(string_agg(DISTINCT proj.ProjectName, ', ' ORDER BY proj.ProjectName), '') AS ProjectsNames,
    COALESCE(string_agg(DISTINCT tsk.TaskName, ', ' ORDER BY tsk.TaskName), '') AS TasksNames,
    COUNT(DISTINCT tsk.TaskID) AS TotalTasks,
    COUNT(DISTINCT subemp.EmployeeID) AS TotalSubordinates
FROM man_hierarchy eh
LEFT JOIN Departments dep ON eh.DepartmentID = dep.DepartmentID
LEFT JOIN Roles rol ON eh.RoleID = rol.RoleID
LEFT JOIN Projects proj ON proj.DepartmentID = eh.DepartmentID
LEFT JOIN Tasks tsk ON eh.EmployeeID = tsk.AssignedTo
LEFT JOIN Employees subemp ON eh.EmployeeID = subemp.ManagerID
GROUP BY eh.EmployeeID, eh.Name, eh.ManagerID, dep.DepartmentName, rol.RoleName
ORDER BY eh.Name;
