
import React, { useState, useEffect } from "react";

import { Link } from "react-router-dom";
import {
  Layout,
  Typography,  
  
} from "antd";
import { BsEye } from 'react-icons/bs';
import { BsEyeSlash } from 'react-icons/bs';
import { InputGroup } from "react-bootstrap";
import {Form, Row, Col, Card, Button} from 'react-bootstrap'
import Service from "../services/auth.service"

import notification from "../utils/notification";
import FooterPage from "../components/layout/Footer";

const { Title } = Typography;
const { Header, Content } = Layout;

export default function SignIn () {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");

  const [showPass, setShowPass] = useState(false)
  const [role, setRole] = useState("");

    const handleChangeEmail = (event) =>{
      setEmail(event.target.value);
    }
    const handleChangePassword = (event) =>{
      setPassword(event.target.value);
    }

  const handleChangeRole = (event) =>{
    setRole(event.target.value);
  }

  const handleshowPass = () =>{
    setShowPass(!showPass)
  }
  const handleOnClick = () =>{
    
    if(email && password && role){
      
      Service.Login(email, password, role).then(
        response =>{
          if( response.data && response.data.success ) {
            console.log(response.data)
            localStorage.setItem("isuser", JSON.stringify(response.data));
            alert(notification.SIGN_SUCCESS)
            window.location.assign('/')
            
          } 
        }, error => {
          if(error.response && error.response.data && error.response.status === 401 && !error.response.data.success) {
            alert(error.response.data.message)
          }
        }
      )
    } else {
      alert(notification.INPUT)
    }
  }
  useEffect ( () => {
   
    localStorage.clear();
  }, [])

  return (
    <React.Fragment>
      <Layout className="layout-default layout-signin">
        <Header>
          <div className="header-col header-brand">
            <h2>Crawler</h2>
          </div>
        </Header>
        <Content className="signin">
          <Card>
          <Row gutter={[24, 0]} justify="space-around">
            <Col
              xs={{ span: 4, offset: 0 }}
              lg={{ span: 4, offset: 1 }}
              md={{ span: 4 }}
            >
              <Title className="mb-15">Sign In</Title>
              
              
              <Form.Group className="mb-3" controlId="formBasicEmail">
              <Form.Label>Email </Form.Label>
              <Form.Control type="email" placeholder="Enter email" value={email}
                  onChange = {(event) =>{handleChangeEmail(event)}} />
              </Form.Group>
              <Form.Group className="mb-3" controlId="formBasicPassword">
                <Form.Label>Password</Form.Label>
                <InputGroup className="mb-3">
                <Form.Control 
                type={!showPass ? "password" : "text"} 
                placeholder="Password" value={password}
                  onChange = {(event) =>{handleChangePassword(event)}} />
                <InputGroup.Text>{showPass ? <BsEye onClick={handleshowPass}/> : <BsEyeSlash onClick={handleshowPass}/>}</InputGroup.Text>
                </InputGroup>
              </Form.Group>
              
              <Form.Group className="mb-3" controlId="formBasicPassword">
              <Form.Label>Role </Form.Label>
              <Form.Select 
              onChange={(event) => handleChangeRole(event)}
              aria-label="Default select example">
                <option>Vui lòng chọn</option>
                <option value="admin">Admin</option>
                <option value="partner">Partner</option>
                <option value="customer">Customer</option>
              </Form.Select>
              </Form.Group>
              <Button
                    type="primary"
                    htmlType="submit"
                    style={{ width: "100%" }}
                    onClick={() => {
                      handleOnClick()}}
                  >
                    SIGN IN
                  </Button>
              
                
                <p className="font-semibold text-muted">
                  Don't have an account?{" "}
                  <Link to="/signup" className="text-dark font-bold">
                    Sign Up
                  </Link>
                </p>
            </Col>
            
            
          </Row>
          </Card>
          
        </Content>
        
        <FooterPage/>
      </Layout>
    </React.Fragment>
  );
  
}
