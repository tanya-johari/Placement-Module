import React, { useState } from "react";
import "./Login.css";
import Axios from "axios";
import { useStateValue } from "../../Context/StateProvider";
import { actionTypes } from "../../Context/reducer";
import { ToastContainer, toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import PropTypes from "prop-types";
import { makeStyles } from "@material-ui/core/styles";
import Tabs from "@material-ui/core/Tabs";
import Tab from "@material-ui/core/Tab";
import Typography from "@material-ui/core/Typography";
import Box from "@material-ui/core/Box";
function TabPanel(props) {
  const { children, value, index, ...other } = props;

  return (
    <div
      role="tabpanel"
      hidden={value !== index}
      id={`vertical-tabpanel-${index}`}
      aria-labelledby={`vertical-tab-${index}`}
      {...other}
    >
      <br/>

      <div className="header">
      <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRMN5uL8M6kTZ2jbND8iLtcvtKPXMzGp2VfuV-IVydBQ&s"></img>
      <h1> BVICAM  PLACEMENT  PORTAL </h1>
      </div>

      {value === index && (
        <Box p={3}>
          <Typography>{children}</Typography>
        </Box>
      )}
    </div>
  );
}

TabPanel.propTypes = {
  children: PropTypes.node,
  index: PropTypes.any.isRequired,
  value: PropTypes.any.isRequired,
};

function a11yProps(index) {
  return {
    id: `vertical-tab-${index}`,
    "aria-controls": `vertical-tabpanel-${index}`,
  };
}

const useStyles = makeStyles((theme) => ({
  root: {
    flexGrow: 1,
    backgroundColor: "transparent",
    color: "#c80a0a",
    display: "flex",
  },
  tabs: {
    borderRight: `1px solid ${theme.palette.divider}`,
    marginTop: "20%",
    marginLeft: "20%",
  },
}));

function Login() {
  const [usn, setUsn] = useState("");
  const [usnError, setUsnError] = useState("");

  const [pass, setPass] = useState("");
  const [passError, setPassError] = useState("");

  
  const [adminEmail, setAdminEmail] = useState("");
  const [adminEmailError, setAdminEmailError] = useState("");

  const [adminPass, setAdminPass] = useState("");
  const [adminPassError, setAdminPassError] = useState("");

  const [usernameReg, setUsernameReg] = useState("");
  const [usernameRegError, setUsernameRegError] = useState("");

  const [passwordReg, setPasswordReg] = useState("");
  const [passwordRegError, setPasswordRegError] = useState("");

  /* eslint-disable */
  const baseUrl = "http://localhost:3001";
  const [{ userState }, dispatchUser] = useStateValue();
  const [{ adminState }, dispatchAdmin] = useStateValue();
  const classes = useStyles();
  const [value, setValue] = useState(0);

  const handleChange = (event, newValue) => {
    setValue(newValue);
  };

  const handleLogin = (event) => {
    event.preventDefault();
    if(!usn || !pass) {
      return toast("Please fill out all the fields!", {type: 'warning'});
    }

      Axios.post(`${baseUrl}/login`, {
        usn: usn,
        pass: pass,
      }).then((response) => {
        if (response.data.message) {
          return toast("Invalid Enroll No./Password", { type: "error" });
        } else {
          dispatchUser({
            type: actionTypes.SET_USER,
            user: response.data,
          });
          console.log("====================================");
          console.log(response.data);
          console.log("====================================");
        }
      });
  };

  const handleRegister = (event) => {
    event.preventDefault();
    if(!usernameReg || !passwordReg) {
      return toast("Please fill out all the fields", {type: 'warning'});
    }
    if(!isValidPasswordReg(passwordReg)) {
      return toast("Please Check your input fields", {type: 'info'});
    }

      Axios.post(`${baseUrl}/register`, {
        usn: usernameReg,
        pass: passwordReg,
      }).then((response) => {
        if (response.data.err) {
          return toast("Invalid Enroll No.", { type: "error" });
        } else if (response.data.message) {
          return toast("", { type: "error" });
        } else if (response.data) {
          console.log("====================================");
          console.log(response.data);
          console.log("====================================");
          return toast(" Succesfully Registered", { type: "success" });
        }
      });

  };

  const handleAdmin = (event) => {
    event.preventDefault();
    if(!adminEmail || !adminPass) {
      return toast("Please fill out all fields!", {type: 'warning'});
    }
      Axios.post(`${baseUrl}/admin`, {
        email: adminEmail,
        pass: adminPass,
      }).then((response) => {
        if (response.data.message) {
          return toast("Invalid Email ID/Password", { type: "error" });
        } else {
          dispatchAdmin({
            type: actionTypes.SET_ADMIN,
            admin: response.data,
          });
        }
      });
  };
  
  const handleAdminEmailChange = (e) => {
    setAdminEmail(e.target.value);
    if(!isValidAdminEmail(e.target.value)) {
      setAdminEmailError("Please enter a valid email ID!");
    }
    else {
      setAdminEmailError("");
    }
  };

  const handleAdminPassChange = (e) => {
    setAdminPass(e.target.value);
    if(!isValidAdminPass(e.target.value)) {
      setAdminPassError("Please enter password of length 4-8 characters!");
    }
    else {
      setAdminPassError("");
    }

  };

  const isValidAdminEmail = (adminEmail) => {
    const adminemailPattern = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i;
    return adminemailPattern.test(adminEmail);
  
  };

  const isValidAdminPass = (adminPass) => {
    const adminpassPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-z]{4,}$/;
    return adminpassPattern.test(adminPass);
  };

  const handleUsnChange = (e) => {
    setUsn(e.target.value);
    if(!isValidUsn(e.target.value)) {
      setUsnError("Please enter a valid 11 digits enrollment number!");
    }
    else {
      setUsnError("");
    }
  };

  const handlePassChange = (e) => {
    setPass(e.target.value);
    if(!isValidPass(e.target.value)) {
      setPassError("Please enter password of length 4-8 characters!");
    }
    else {
      setPassError("");
    }

  };

  const isValidUsn = (usn) => {
    const usnPattern = /^[0-9]{11}$/;
    return usnPattern.test(usn);
  
  };

  const isValidPass = (pass) => {
    const passPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-z]{4,}$/;
    return passPattern.test(pass);
  };

  const handleUsernameRegChange = (e) => {
    setUsernameReg(e.target.value);
    if(!isValidUsernameReg(e.target.value)) {
      setUsernameRegError("Please enter a valid 11 digits enrollment number!");
    }
    else {
      setUsernameRegError("");
    }
  };

  const handlePasswordRegChange = (e) => {
    setPasswordReg(e.target.value);
    if(!isValidPasswordReg(e.target.value)) {
      setPasswordRegError("Please enter password of length 4-8 characters! It should contain atleast one lower case, one upper case alphabet and atleast one digit!");
    }
    else {
      setPasswordRegError("");
    }

  };
  
  function handleKeyPress(event) {
    const keyCode = event.keyCode || event.which;
    const keyValue = String.fromCharCode(keyCode);

    if (
      keyCode === 37 ||
      keyCode === 38 ||
      keyCode === 39 ||
      keyCode === 40 ||
      keyCode === 8 ||
      keyCode === 9 ||
      keyCode === 187 ||
      keyCode === 189 ||
      keyCode === 190 ||
      keyCode === 191 ||
      keyCode === 192 ||
      keyCode === 220
    ) {
      return;
    }

    if (keyCode >= 96 && keyCode <= 111) {
      return;
    }

    if (keyCode >= 46 && keyCode <= 90) {
      return;
    }

    const regex = /^$/;

    if (!regex.test(keyValue)) {
      event.preventDefault();
    }
  }


  const isValidUsernameReg = (usernameReg) => {
    const usernamePattern = /^[0-9]{11}$/;
    return usernamePattern.test(usernameReg);
  
  };

  const isValidPasswordReg = (passwordReg) => {
    const passwordPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-z]{4,}$/;
    return passwordPattern.test(passwordReg);
  };



  return (
    <div className={classes.root}>
      <ToastContainer position="bottom-center" />
      <Tabs
        orientation="vertical"
        variant="scrollable"
        value={value}
        onChange={handleChange}
        aria-label="Vertical tabs example"
        className={classes.tabs}
      >
        
        {" "}
        
        <Tab label="Login" {...a11yProps(0)} />
        <Tab label="Register" {...a11yProps(1)} />
        <Tab label="Admin Login" {...a11yProps(2)} />
      </Tabs>
      <TabPanel value={value} index={0}>
      
        <div className=" login-box login-box-1">
          <h2>Student Login</h2>
          <form>
            <div className="user-box">
              <input
                type="number"
                name="usn"
                id="usn"
                value={usn}
                required="true"
                maxLength={11}
                onChange={handleUsnChange}
              />
              <label>Enrollment No.</label>
            </div>
            {usn &&<div><p style={{color:"#ee7b5c"}}>{usnError}</p></div>}
            <div className="user-box">
              <input
                type="password"
                name="pass"
                id="pass"
                value={pass}
                required="true"
                maxLength={8}
                onChange={handlePassChange}
              />
              <label>Password</label>
            </div>
            {pass &&<div><p style={{color:"#ee7b5c"}}>{passError}</p></div>}
            <btn className="login-btn" onClick={handleLogin}>
              <span></span>
              <span></span>
              <span></span>
              <span></span>
              Login
            </btn>
          </form>
        </div>
      </TabPanel>
      <TabPanel value={value} index={1}>
        <div className="login-box login-box-2">
          <h2>Register</h2>
          <form>
            <div className="user-box">
              <input
                type="number"
                name="usernameReg"
                id="usernameReg"
                value={usernameReg}
                required="true"
                maxLength={11}
                onChange={handleUsernameRegChange}
              />
              <label>Enrollment Number</label>
            </div>
            {usernameReg && <div><p style={{color:"#ee7b5c"}}>{usernameRegError}</p></div>}
            <div className="user-box">
              <input
                type="password"
                name="passwordReg"
                id="passwordReg"
                value={passwordReg}
                required="true"
                maxLength={8}
                onChange={handlePasswordRegChange}
              />
              <label>Password</label>
              
            </div>
            {passwordReg && <div><p style={{color:"#ee7b5c"}}>{passwordRegError}</p></div>}
            <btn className="login-btn" onClick={handleRegister}>
              <span></span>
              <span></span>
              <span></span>
              <span></span>
              Register
            </btn>
          </form>
        </div>
      </TabPanel>
      <TabPanel value={value} index={2}>
        <div className=" login-box login-box-3">
          <h2>Admin Login</h2>
          <form>
            <div className="user-box">
              <input
                type="text"
                required="true"
                name="adminEmail"
                id="adminEmail"
                onKeyDown={handleKeyPress}
                value={adminEmail}
                onChange={handleAdminEmailChange}
              />
              <label>Email</label>
            </div>
            {adminEmail &&<div><p style={{color:"#ee7b5c"}}>{adminEmailError}</p></div>}
            <div className="user-box">
              <input
                type="password"
                name="adminPass"
                id="adminPass"
                value={adminPass}
                required="true"
                maxLength={8}
                onChange={handleAdminPassChange}
              />
              <label>Password</label>
            </div>
            {adminPass &&<div><p style={{color:"#ee7b5c"}}>{adminPassError}</p></div>}
            <btn className="login-btn" onClick={handleAdmin}>
              <span></span>
              <span></span>
              <span></span>
              <span></span>
              Login
            </btn>
          </form>
        </div>
      </TabPanel>
    </div>
  );
}

export default Login;
