const checkLogin = ({ username, password }) => {
    const errors = {};
    if (!/\S+@\S+\.\S+/.test(username))
        errors.username =
            "Please enter your email in the right format (username@gmail.com)";
    if (username === "") errors.username = "Username must not be blank";
    if (password === "") errors.password = "Password must not be blank";
    if (password.length < 6)
        errors.password = "Password must be at least 6 characters";
    return errors;
};

const loginModel = document.getElementById("formLogin");

loginModel.addEventListener("submit", e => {
    e.preventDefault();
    const username = document.getElementById("uname");
    const password = document.getElementById("pwd");
    const errorUsername = document.getElementById("invalid-uname");
    const errorPassword = document.getElementById("invalid-pwd");
    const errorMessage = document.getElementById("message-error");
    if (!username) return fetch("http://localhost:57474/Account/Logout").then(data => location.reload());
    errorPassword.innerHTML = "";
    errorUsername.innerHTML = "";
    const user = {
        username: username.value,
        password: password.value
    };
    const result = checkLogin(user);
    console.log(result)
    errorUsername.style.display = !result.username ? "none" : "block";
    errorPassword.style.display = !result.password ? "none" : "block";
    if (Object.keys(result).length !== 0) {
        errorUsername.innerHTML = result.username;
        errorPassword.innerHTML = result.password;
        return null;
    }
    fetch("http://localhost:57474/Account/CheckLogin", {
        method: "POST",
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            Username: username.value,
            Password: password.value
        })
    }).then(result => result.json()).then(data => {
        if (data.status === "success") {
            return location.reload();
        }
        errorMessage.classList.remove("d-none");
        errorMessage.innerText = data.message;
    })
        .catch(err => console.log(err));
});


