
import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import {
  Layout,   
  Typography
} from "antd";
import { BsEye } from 'react-icons/bs';
import { BsEyeSlash } from 'react-icons/bs';
import {Form, Row, Col, Card, Button, InputGroup} from 'react-bootstrap'
import userService from "../services/user.service"
import notification from "../utils/notification";
import FooterPage from "../components/layout/Footer";

const { Title } = Typography;
const { Header,  Content } = Layout;

export default function SignUp () {
  const [email, setEmail] = useState("");
  const [username, setUsername] = useState("");
  const [first_name, setFirst_name] = useState("");
  const [last_name, setLast_name] = useState("");
  const [password, setPassword] = useState("");
  const [confirmPassword, setConfirmPassword] = useState("");
  const [showPass, setShowPass] = useState(false)
  const [showConfirmPass, setShowConfirmPass] = useState(false)
    
    const handleChangeEmail = (event) =>{
      setEmail(event.target.value);
    }       
    const handleChangeUserName = (event) =>{
      setUsername(event.target.value);
    }
    const handleChangeFirstName = (event) =>{
      setFirst_name(event.target.value);
    }
    const handleChangeLastName = (event) =>{
      setLast_name(event.target.value);
    }
    const handleChangePassword = (event) =>{
      setPassword(event.target.value);
    }
    const handleChangeConfirmPassword = (event) =>{
      setConfirmPassword(event.target.value);
    }
    const clearInput = () => {
      setConfirmPassword("");
      setEmail("");
      setUsername("");
      setFirst_name("");
      setLast_name("");
      setPassword("");
    }
    const handleshowPass = () =>{
      setShowPass(!showPass)
    }
    const handleshowConfirmPass = () =>{
      setShowConfirmPass(!showConfirmPass)
    }

    
  const handleOnClick = () =>{
    if (email && username && last_name && first_name &&  password && confirmPassword) {

      if(password && confirmPassword && password === confirmPassword) {
        
        userService.signUp(username, first_name, last_name, email, password).then(
          response =>{
            if(response.data) {           
              alert(notification.CREATE_ACCOUNT);
              clearInput(); 
              window.location.assign('/signin')
                         
            }
          } , error => {
            
            if(error.response && !error.response.data.success  ) {
              alert(error.response.data.message)
            }
          }
        )
      } 
      else {
        
        alert(notification.PASSWORD)
      }
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
            <a href="/">
            <h2>Crawler</h2>
            </a>
          </div>
        </Header>
        <Content className="signin">
        <Card>
          <Row gutter={[24, 0]} justify="space-around">
            <Col
              xs={{ span: 6, offset: 0 }}
              lg={{ span: 6, offset: 1 }}
              md={{ span: 6 }}
            >
              <Title className="mb-15">Sign Up</Title>
              <Row>
                <Col md={{ span: 6, offset: 0 }}>
                <Form.Group className="mb-3" controlId="formBasicEmail">
                  <Form.Label>Email </Form.Label>
                  <Form.Control type="email" placeholder="Enter email" 
                      value={email}
                      onChange = {(event) =>{handleChangeEmail(event)}} />
                  </Form.Group>
                </Col>
                
              </Row>   
              <Row>
                <Col md={{ span: 6, offset: 0 }}>
                <Form.Group className="mb-3" controlId="formBasicName">
                  <Form.Label>UserName </Form.Label>
                  <Form.Control type="text" placeholder="Enter UserName" 
                      value={username}
                      onChange = {(event) =>{handleChangeUserName(event)}} />
                  </Form.Group>
                </Col>
              </Row>  
              <Row>
                <Col md={{ span: 6, offset: 0 }}>
                <Form.Group className="mb-3" controlId="formBasicName">
                  <Form.Label>First Name </Form.Label>
                  <Form.Control type="text" placeholder="Enter FirstName" 
                      value={first_name}
                      onChange = {(event) =>{handleChangeFirstName(event)}} />
                  </Form.Group>
                </Col>
              </Row>  
              <Row>
                <Col md={{ span: 6, offset: 0 }}>
                <Form.Group className="mb-3" controlId="formBasicName">
                  <Form.Label>Last Name </Form.Label>
                  <Form.Control type="text" placeholder="Enter LastName" 
                      value={last_name}
                      onChange = {(event) =>{handleChangeLastName(event)}} />
                  </Form.Group>
                </Col>
              </Row>             
              <Row>
                <Col md={{ span: 6, offset: 0 }}>
                
                  <Form.Label>Password  </Form.Label>
                  <InputGroup className="mb-3">
                  <Form.Control   placeholder="Password" 
                      type={!showPass ? "password" : "text"} 
                      value={password}
                      onChange = {(event) =>{handleChangePassword(event)}} />
                      <InputGroup.Text>{showPass ? <BsEye onClick={handleshowPass}/> : <BsEyeSlash onClick={handleshowPass}/>}</InputGroup.Text>
                  
                  </InputGroup>                  
                 
                </Col>
                
              </Row>
              <Row>
              <Col md={{ span: 6, offset: 0 }}>
                
                <Form.Label>Confirm Password  </Form.Label>
                <InputGroup className="mb-3">
                <Form.Control   placeholder="Password" 
                    type={!showConfirmPass ? "password" : "text"}
                    value={confirmPassword}
                    onChange = {(event) =>{handleChangeConfirmPassword(event)}} />
                    <InputGroup.Text>{showConfirmPass ? <BsEye onClick={handleshowConfirmPass}/> : <BsEyeSlash onClick={handleshowConfirmPass}/>}</InputGroup.Text>
                
                </InputGroup>                
               
              </Col>
              </Row>
              <Row>
              <Col md={{ span: 6, offset: 0 }}>
              <Button
                    type="primary"
                    htmlType="submit"
                    style={{ width: "100%" }}
                    onClick={() => {
                      handleOnClick()}}
                  >
                    SIGN UP
                  </Button>
                  
                  <p className="font-semibold text-muted">
                  {" "}
                  <Link to="/signin" className="text-dark font-bold">
                    Sign In
                  </Link>
                </p>
                </Col>
              </Row>
              
              </Col>
              
              </Row>
              </Card>
          
        </Content>
        <FooterPage/>
      </Layout>
    </React.Fragment>
  );
  
}
