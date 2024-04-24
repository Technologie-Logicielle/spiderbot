
import React from "react";
import {
  Layout,
  Menu,   
  
} from "antd";

const {  Footer} = Layout;

export default function FooterPage () {
  return (
    <React.Fragment>      
        
        <Footer>
          <Menu mode="horizontal">
            <Menu.Item key="1">Company</Menu.Item>
            <Menu.Item key="2">About Us</Menu.Item>
            <Menu.Item key="3">Teams</Menu.Item>
            <Menu.Item key="4">Products</Menu.Item>
            <Menu.Item key="5">Blogs</Menu.Item>
          </Menu>
          
          <p className="copyright">              
            Copyright © 2024 Crawler
          </p>
        </Footer>
    </React.Fragment>
  );
  
}
