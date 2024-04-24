
import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import {
  Layout,   
  Typography
} from "antd";
import { BsEye } from 'react-icons/bs';
import { BsEyeSlash } from 'react-icons/bs';
import {Form, Row, Col, Card, Button, InputGroup} from 'react-bootstrap'
import Service from "../services/auth.service"
import notification from "../utils/notification";
import FooterPage from "../components/layout/Footer";

const { Title } = Typography;
const { Header,  Content } = Layout;

export default function SignUp () {
  const [email, setEmail] = useState("");
  const [name, setName] = useState("");
  const [password, setPassword] = useState("");
  const [confirmPassword, setConfirmPassword] = useState("");
  const [showPass, setShowPass] = useState(false)
  const [showConfirmPass, setShowConfirmPass] = useState(false)
    
    const handleChangeEmail = (event) =>{
      setEmail(event.target.value);
    }       
    const handleChangeName = (event) =>{
      setName(event.target.value);
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
      setName("");
      setPassword("");
    }
    const handleshowPass = () =>{
      setShowPass(!showPass)
    }
    const handleshowConfirmPass = () =>{
      setShowConfirmPass(!showConfirmPass)
    }

    
  const handleOnClick = () =>{
    if (email && name &&  password && confirmPassword) {
      console.log(email , name ,  password ,  confirmPassword)
      if(password && confirmPassword && password === confirmPassword) {
        Service.Signup(email, password, name).then(
          response =>{
            if(response.data.success) {
              alert(notification.CREATE)              
              window.location.assign('/signin')
              clearInput();            
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
            <h2>Crawler</h2>
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
                  <Form.Label>Name </Form.Label>
                  <Form.Control type="text" placeholder="Enter Name" 
                      value={name}
                      onChange = {(event) =>{handleChangeName(event)}} />
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
