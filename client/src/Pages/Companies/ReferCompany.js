import Axios from "axios";
import React, { useState } from "react";
import { toast, ToastContainer } from "react-toastify";
import "./ReferCompany.css";
import { useStateValue } from "../../Context/StateProvider";

function ReferCompany() {
  const [cname, setCname] = useState("");
  const [cdescription, setCdescription] = useState("");
  const [email, setEmail] = useState("");
  const [phone, setPhone] = useState(0);
  const [hrname, sethrname] = useState("");
  const baseUrl = "http://localhost:3001";

  const [user , dispatchUser] = useStateValue();

  const referCompany = () => {
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
        return toast(" Company already exists", { type: "error" });
      } else 
      return toast("Successfully Added", { type: "success" });
  });
  };
  return (
    <div className=" add-company-box">
      <ToastContainer position="bottom-center" />
      <h2>Refer a company</h2>
      <form>
        <div className="add-company-form">
          <input
            type="text"
            required="true"
            name=""
            onChange={(e) => setCname(e.target.value)}
          />
          <label>Company Name</label>
        </div>
        <div className="add-company-form">
          <input
            type="text"
            required="true"
            name=""
            onChange={(e) => setCdescription(e.target.value)}
          />
          <label>Company Info</label>
        </div>
        <div className="add-company-form">
          <input
            type="text"
            required="true"
            name=""
            onChange={(e) => setEmail(e.target.value)}
          />
          <label>HR Email</label>
        </div>
        <div className="add-company-form">
          <input
            type="text"
            required="true"
            name=""
            onChange={(e) => setPhone(e.target.value)}
          />
          <label>HR Phone</label>
        </div>
        <div className="add-company-form">
          <input
            type="text"
            required="true"
            name=""
            onChange={(e) => sethrname(e.target.value)}
          />
          <label>HR NAME</label>
        </div>
        
    
        <btn onClick={referCompany}>Submit</btn>
      </form>
    </div>
  );
}

export default ReferCompany;
