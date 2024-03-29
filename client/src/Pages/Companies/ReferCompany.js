import Axios from "axios";
import React, { useState } from "react";
import { toast } from "react-toastify";
import "./ReferCompany.css";
import { useStateValue } from "../../Context/StateProvider";

function ReferCompany() {
  const [cname, setCname] = useState("");
  const [cnameError, setCnameError] = useState("");

  const [cdescription, setCdescription] = useState("");
  const [cdescriptionError, setCdescriptionError] = useState("");

  const [email, setEmail] = useState("");
  const [emailError, setEmailError] = useState("");
  
  const [phone, setPhone] = useState();
  const [phoneError, setPhoneError] = useState("");

  const [hrname, sethrname] = useState("");
  const [hrnameError, sethrnameError] = useState("");

  const baseUrl = "http://localhost:3001";

  const [user] = useStateValue();

  const handleRefer = (event) => {
    event.preventDefault();
    if(!cname || !cdescription || !email || !phone || !hrname) {
      return toast("Please fill out all the fields!", {type: 'info'});
    }
    if(!isValidEmail(email) && !isValidPhone(phone) && !isValidhrname(hrname)) {
      return toast("Please check your fields.", {type: 'info'});
    }

      Axios.post(`${baseUrl}/refercompany`, {
        cname: cname,
        cdescription: cdescription,
        email: email,
        phone: phone,
        hrname: hrname,
        usn: user.user[0].usn,
      }).then((response) => {
         //if (response.data.message) {
          //return toast(" User already exists", { type: "error" });
         //}
        if (response.data.err) {
          return toast("Some error", { type: "error" });
        } else 
        return toast("Successfully Added", { type: "success" });
    });
    
  };

  

  const handleCnameChange = (e) => {
    setCname(e.target.value);
    if(!isValidCname(e.target.value)) {
      setCnameError("Enter a valid Company Name!");
    }
    else{
      setCnameError("");
    }
  };

  const isValidCname = (cname) => {
    const cnamePattern = /^[a-zA-Z_ ]*$/;
    return cnamePattern.test(cname);
  };

  const handlehrnameChange = (e) => {
    sethrname(e.target.value);
    if(!isValidhrname(e.target.value)) {
      sethrnameError("Enter a valid HR Name!");
    }
    else{
      sethrnameError("");
    }
  };

  const isValidhrname = (hrname) => {
    const hrnamePattern = /^[a-zA-Z]{3,8}( [a-zA-Z]{2,10})+$/;
    return hrnamePattern.test(hrname);
  };

  const handleCdescriptionChange = (e) => {
    setCdescription(e.target.value);
    if(!isValidCdescription(e.target.value)) {
      setCdescriptionError("");
    }
    else{
      setCdescriptionError("");
    }
  };

  const isValidCdescription = (cdescription) => {
    const cdescriptionPattern = /^[a-zA-Z0-9]+$/;
    return cdescriptionPattern.test(cdescription);
  };

  const handlePhoneChange = (e) => {
    setPhone(e.target.value);
    if(!isValidPhone(e.target.value)) {
      setPhoneError("Please enter a 10 digit contact number!");
    }
    else {
      setPhoneError("");
    }
  };

  const isValidPhone = (phone) => {
    const phonePattern = /^[0-9]{10}$/;
    return phonePattern.test(phone);
  };

  const handleEmailChange = (e) => {
    setEmail(e.target.value);
    if(!isValidEmail(e.target.value)) {
      setEmailError("Please enter a valid email ID!");
    }
    else {
      setEmailError("");
    }
  };

  const isValidEmail = (email) => {
    const emailPattern = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i;
    return emailPattern.test(email);
  
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


  
  return (
    <div className=" add-company-box">
      
      <h2>Refer a company</h2>
      <form>
        <div className="add-company-form">
          <input
            type="text"
            required="true"
            name="cname"
            id="cname"
            value={cname}
            minLength={2}
            maxLength={15}
            onChange={handleCnameChange}
          />
          <label>Company Name</label>
        </div>
        {cname &&<div><p style={{color: "wheat"}}>{cnameError}</p></div>}
        <div className="add-company-form">
          <input
            type="text"
            required="true"
            name="cdescription"
            id="cdescription"
            value={cdescription}
            minLength={2}
            maxLength={30}
            onChange={handleCdescriptionChange}
          />
          <label>Company Info</label>
        </div>
        {cdescription &&<div><p style={{color: "wheat"}}>{cdescriptionError}</p></div>}
        <div className="add-company-form">
          <input
            type="text"
            required="true"
            name="email"
            id="email"
            onKeyDown={handleKeyPress}
            value={email}
            onChange={handleEmailChange}
          />
          <label>HR Email</label>
        </div>
        {email &&<div><p style={{color: "wheat"}}>{emailError}</p></div>}
        <div className="add-company-form">
          <input
            type="number"
            required="true"
            name="phone"
            id="phone"
            //value={phone}
            onChange={handlePhoneChange}
          />
          <label>HR Phone</label>
        </div>
        {<div><p style={{color: "wheat"}}>{phoneError}</p></div>}
        <div className="add-company-form">
          <input
            type="text"
            required="true"
            name="hrname"
            id="hrname"
            value={hrname}
            onChange={handlehrnameChange}
          />
          <label>HR NAME</label>
        </div>
        {hrname &&<div><p style={{color: "wheat"}}>{hrnameError}</p></div>}    
        <btn onClick={handleRefer}>Submit</btn>
      </form>
    </div>
  );
}

export default ReferCompany;
