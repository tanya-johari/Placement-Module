import React from "react";
import "./Footer.css";
function Footer() {
  return (
    <div className="footer">
      <div className="footer_wrapper">
        <div className="footer_desc">
          <h1>BVICAM</h1>
          <p>Bharati Vidyapeeth's Institute of Computer Application and Management </p>
          <p id="phone">+91 - 11 - 25275055</p>
        </div>
        <div className="footer_links">
          <h2 className="footer_title">About BVICAM</h2>
          <a
            href="http://bvicam.in/?q=faculty-information-list"
            target="blank"
            className="footer_link"
          >
            Faculty List of All Dept
          </a>
          
          <a
            href="http://bvicam.in/?q=admissions"
            target="blank"
            className="footer_link"
          >
            Admission
          </a>
        </div>
      </div>
      <div id="footer" className="footer_wrapper">
        <div className="footer_links">
          <h2 className="footer_title">Placements</h2>
          <a
            href="http://bvicam.in/Placement-History"
            target="blank"
            className="footer_link"
          >
            Placements
          </a>
         
        </div>
        <div className="footer_links">
          <h2 className="footer_title">Get in Touch</h2>
          <a
            href="http://bvicam.in/"
            target="blank"
            className="footer_link"
          >
            BVICAM
          </a>
          <a
            href="https://www.facebook.com/people/Bharati-Vidyapeeths-Institute-of-Computer-Applications-and-Management/100075781826342/"
            target="blank"
            className="footer_link"
          >
            Facebook
          </a>
          <a
            href="https://www.youtube.com/@bvicamnewdelhi6802"
            target="blank"
            className="footer_link"
          >
            Youtube
          </a>
          <a
            href="https://www.linkedin.com/company/bharati-vidyapeeth-s-institute-of-computer-applications-and-management-delhi?originalSubdomain=in"
            target="blank"
            className="footer_link"
          >
            LinkedIn
          </a>
        </div>
      </div>
    </div>
  );
}

export default Footer;
