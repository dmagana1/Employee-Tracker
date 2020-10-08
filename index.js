var inquirer = require("inquirer");
var connection = require('./connection');
const viewOptions = [
    "View Departments",
    "View Roles",
    "View Employees",
    "Update Employee",
    "exit"
];

const employeeOptions = [
    "Mickey Mouse",
    "Peter Pan",
    "Anna Frozen",
    "Dory Fish",
    "Harry Potter",
    "Daisy Duck",
    "Walt Disney",
    "exit"
];

const updateOptions = [
    "First Name",
    "Last Name",
    "Role",
    "exit"
];

runSearch();

function runSearch() {
    inquirer
        .prompt({
            name: "action",
            type: "list",
            message: "Please choose one of the Following Actions",
            choices: viewOptions
        })
        .then(function (answer) {
            switch (answer.action) {
                case viewOptions[0]:
                    departmentView();
                    break;

                case viewOptions[1]:
                    roleView();
                    break;

                case viewOptions[2]:
                    employeeView();
                    break;

                case viewOptions[3]:
                    updateEmployee();

                case updateOptions[4]:
                    connection.end();
                    break
            }
        })
}



function departmentView() {
    var sqlStr = "SELECT * FROM department";
    connection.query(sqlStr, function (err, result) {
        if (err) throw err;

        console.table(result)
        runSearch();
    })
}

function employeeView() {
    var sqlStr = "SELECT first_name, last_name, title, salary FROM employee ";
    sqlStr += "LEFT JOIN role ";
    sqlStr += "ON employee.role_id = role.id"
    connection.query(sqlStr, function (err, result) {
        if (err) throw err;

        console.table(result)
        runSearch();
    })
}

function roleView() {
    var sqlStr = "SELECT * FROM role";
    connection.query(sqlStr, function (err, result) {
        if (err) throw err;

        console.table(result)
        runSearch();
    })
}


const updateEmployee = () => {

    function runUpdateSearch() {
        inquirer
            .prompt({
                name: "action",
                type: "list",
                message: "Please Choose Which Employee You want to Update",
                choices: employeeOptions
            })
           
    }
    runUpdateSearch();  
}