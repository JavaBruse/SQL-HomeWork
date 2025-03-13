WITH RECURSIVE man_hierarchy AS (
    SELECT e.EmployeeID, e.Name, e.ManagerID, e.DepartmentID, e.RoleID
    FROM Employees e
    INNER JOIN Roles r ON e.RoleID = r.RoleID
    WHERE r.RoleName = 'Менеджер'

    UNION ALL

    SELECT e.EmployeeID, e.Name, e.ManagerID, e.DepartmentID, e.RoleID
    FROM Employees e
    INNER JOIN man_hierarchy eh ON e.ManagerID = eh.EmployeeID
)

SELECT eh.EmployeeID, eh.Name AS EmployeeName, eh.ManagerID, dep.DepartmentName, role.RoleName,
    COALESCE(
        STRING_AGG(DISTINCT proj.ProjectName, ', ' ORDER BY proj.ProjectName),
        ''
    ) AS ProjectsNames,
    COALESCE(
        STRING_AGG(DISTINCT tsk.TaskName, ', ' ORDER BY tsk.TaskName),
        ''
    ) AS TasksNames,
    COUNT(DISTINCT sub.EmployeeID) AS TotalSubordinates
FROM man_hierarchy eh
LEFT JOIN Departments dep ON eh.DepartmentID = dep.DepartmentID
LEFT JOIN Roles role ON eh.RoleID = role.RoleID
LEFT JOIN Projects proj ON eh.DepartmentID = proj.DepartmentID
LEFT JOIN Tasks tsk ON eh.EmployeeID = tsk.AssignedTo
LEFT JOIN Employees sub ON eh.EmployeeID = sub.ManagerID
GROUP BY eh.EmployeeID, eh.Name, eh.ManagerID, dep.DepartmentName, role.RoleName
HAVING COUNT(DISTINCT sub.EmployeeID) > 0
ORDER BY eh.Name;
