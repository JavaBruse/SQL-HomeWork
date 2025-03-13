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
    eh.EmployeeID, eh.Name AS EmployeeName, eh.ManagerID, d.DepartmentName, r.RoleName,
    COALESCE(string_agg(DISTINCT p.ProjectName, ', ' ORDER BY p.ProjectName), '') AS ProjectsNames,
    COALESCE(string_agg(DISTINCT t.TaskName, ', ' ORDER BY t.TaskName), '') AS TasksNames
FROM man_hierarchy eh
LEFT JOIN Departments d ON eh.DepartmentID = d.DepartmentID
LEFT JOIN Roles r ON eh.RoleID = r.RoleID
LEFT JOIN Projects p ON p.DepartmentID = eh.DepartmentID
LEFT JOIN Tasks t ON eh.EmployeeID = t.AssignedTo
GROUP BY eh.EmployeeID, eh.Name, eh.ManagerID, d.DepartmentName, r.RoleName
ORDER BY eh.Name;
