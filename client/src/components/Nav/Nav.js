import { Avatar, Modal } from "@material-ui/core";
import React, { useState } from "react";
import {  FaUniversity } from "react-icons/fa";
import { Link } from "react-router-dom";
import { actionTypes } from "../../Context/reducer";
import { useStateValue } from "../../Context/StateProvider";
import AdminProfile from "../Profile/AdminProfile";
import UserProfile from "../Profile/UserProfile";
import "./Nav.css";

function Nav() {
  /* eslint-disable */
  const [{ user }, dispatchUser] = useStateValue();
  const [{ admin }, dispatchAdmin] = useStateValue();
  const [open, setOpen] = useState(false);
  const handleOpen = () => {
    setOpen(true);
  };
  const handleClose = () => {
    setOpen(false);
  };
  const logout = () => {
    dispatchUser({
      type: actionTypes.SET_USER,
      user: null,
    });
    dispatchAdmin({
      type: actionTypes.SET_ADMIN,
      admin: null,
    });
  };
  return (
    <nav className="navbar">
      <Link to="/" className="navbar_logo">
        BVICAM
        <FaUniversity style={{ color: "#f9032f", margin: "2px" }} />
      </Link>

      <li>
        <Link to="/" className="navbar_link">
          Home
        </Link>
      </li>
      {!user || user === "" ? (
        <li>
          <Link to="/students" className="navbar_link">
            Students
          </Link>
        </li>
      ) : null}
      <li>
        <Link to="/companies" className="navbar_link">
          Companies
        </Link>
      </li>

      
      <li>
        <Link to="/placements" className="navbar_link">
          Placements
        </Link>
      </li>
      <li>
        <btn className="logout-btn" onClick={logout}>
          Logout
        </btn>
      </li>

      {!user || user === "" ? (
        <>
          <Avatar
            onClick={handleOpen}
            src="https://w7.pngwing.com/pngs/81/570/png-transparent-profile-logo-computer-icons-user-user-blue-heroes-logo-thumbnail.png"/>
          <Modal
            open={open}
            onClose={handleClose}
            className="modal"
            aria-labelledby="simple-modal-title"
            aria-describedby="simple-modal-description"
          >
            <AdminProfile />
          </Modal>
        </>
      ) : (
        <>
          <Avatar
            onClick={handleOpen}
            src="https://w7.pngwing.com/pngs/81/570/png-transparent-profile-logo-computer-icons-user-user-blue-heroes-logo-thumbnail.png"/>
          <Modal
            open={open}
            onClose={handleClose}
            className="modal"
            aria-labelledby="simple-modal-title"
            aria-describedby="simple-modal-description"
          >
            <UserProfile />
          </Modal>
        </>
      )}

      <div></div>
    </nav>
  );
}

export default Nav;
