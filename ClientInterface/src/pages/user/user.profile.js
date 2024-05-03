import React, {useState, useEffect} from "react";

import {
  Card,  
} from "antd";
import { BsEye } from 'react-icons/bs';
import { BsEyeSlash } from 'react-icons/bs';
import { InputGroup } from "react-bootstrap";
import Form from 'react-bootstrap/Form';
import Row from 'react-bootstrap/Row'
import Col from "react-bootstrap/Col";
import Button from 'react-bootstrap/Button';
import Modal from 'react-bootstrap/Modal';
import userService from "../../services/user.service";
import notification from "../../utils/notification";
import header from "../../services/header.service";


export default function CustomerProfile () {
    const [isLoad, setIsLoad] = useState(false);
    const [email, setEmail] = useState("");
    const [username, setUserName] = useState("");
    const [first_name, setFirst_name] = useState("");
    const [last_name, setLast_name] = useState("");
    const [confirmPass, setConfirmPass] = useState("");
    const [showChangePass,setShowChangePass] = useState(false)
    const [password, setPassword] = useState("");
    const [new_pass, setNew_Pass] = useState("");
    const [showOldPass, setShowOldPass] = useState(false)
    const [showNewPass, setShowNewPass] = useState(false)
    const [showConfirmPass, setShowConfirmPass] = useState(false)

  const handleChangeEmail = (event) => (
    setEmail(event.target.value)
  )
  const handleChangeUserName = (event) => (
    setUserName(event.target.value)
  )
  const handleChangeFirstName = (event) => (
    setFirst_name(event.target.value)
  )
  const handleChangeLastName = (event) => (
    setLast_name(event.target.value)
  )
 
  const clearScreen = () => {
    setFirst_name("");
    setLast_name("");
    setUserName("");
    setEmail("");
    setPassword("");
  }
  
  const handleshowOldPass = () =>{
    setShowOldPass(!showOldPass)
  }
  const handleshowNewPass = () =>{
    setShowNewPass(!showNewPass)
  }
  const handleshowConfirmPass = () =>{
    setShowConfirmPass(!showConfirmPass)
  }
  const handleClickClose = () => {
    clearChangePass();
    setShowChangePass(false)
  }
  const clearChangePass = () => {
    setPassword("");
    setNew_Pass("");
    setConfirmPass("");
    setShowChangePass(false)
  }
  
  
  const handleClickSave = () => {
    if ( password && new_pass && confirmPass) {

      if (new_pass === confirmPass) {
        userService.changePass(password, new_pass).then(
          
          response => {
            
            if(response && response.status === 204 ) {
              alert(notification.CHANGE_PASSWORD_SUCCESS)
              window.location.assign('/signin')
            }
          }, error => {
            if (error.response && error.response){
              console.log(error.response)
              alert(notification.WRONG_PASSWORD)
            }            
          }
        )
      } else {
        alert(notification.PASSWORD)
      }
    } else {
      alert(notification.INPUT)
    }
  }
  const handleClickCancel = () => {
    setIsLoad(!isLoad)
  }
  const handleClickChangePass = () => {
    setShowChangePass(true);
  }
  const handleChangeOldPass = (event) => {
    setPassword(event.target.value);
  }
  const handleChangeNewPass = (event) => {
    setNew_Pass(event.target.value);
  }
  const handleChangeConfirmPass = (event) => {
    setConfirmPass(event.target.value);
  }
  
  
    useEffect(()=>{   
      setEmail(header.email())
      setFirst_name(header.firstname());
      setLast_name(header.lastname());
      setUserName(header.userName());
      
    },[])
    return(
        <React.Fragment>
        <div className="container">
          <header className="jumbotron">
            <h1>Profile </h1> 
          </header>
          <Card >
          <Row className="container">
          <Col md={{ span: 5, offset: 10 }}>
            <Button onClick={handleClickChangePass}>
              Change Pass
            </Button>
          </Col>
          </Row>
          <Row className="container">
            <Col md={{ span: 5, offset: 4 }}>
            <Form.Group className="mb-3">
            <Form.Label>Email </Form.Label>
            <Form.Control 
            disabled
            type="email"         
            value={email}
            onChange={handleChangeEmail}
             />  
                   
          </Form.Group>
            </Col>
              
          </Row>
          <Row className="container">
            <Col md={{ span: 5, offset: 4 }}>
            <Form.Group className="mb-3">
            <Form.Label>UserName </Form.Label>
            <Form.Control 
            disabled
            type="username"         
            value={username}
            onChange={handleChangeUserName}
             />  
                   
          </Form.Group>
            </Col>
              
          </Row>
          <Row className="container">
            <Col md={{ span: 5, offset: 4 }}>
            <Form.Group className="mb-3">
            <Form.Label>FirstName </Form.Label>
            <Form.Control 
            disabled
            type="firstname"         
            value={first_name}
            onChange={handleChangeFirstName}
             />  
                   
          </Form.Group>
            </Col>
              
          </Row>
          <Row className="container">
            <Col md={{ span: 5, offset: 4 }}>
            <Form.Group className="mb-3">
            <Form.Label>UserName </Form.Label>
            <Form.Control 
            disabled
            type="lastname"         
            value={last_name}
            onChange={handleChangeLastName}
             />  
                   
          </Form.Group>
            </Col>
              
          </Row>
               
          <Row className="container">
            <Col md={{ span: 1, offset: 4 }}>
            <Button className="btn btn-secondary" onClick={handleClickCancel}>
              Cancel
            </Button>
            </Col>
            <Col md={{ span: 1, offset: 2 }}>
            <Button className="btn btn-primary" >
              Update
            </Button>
            </Col>
          </Row>
          
          </Card>   
        </div>

        <Modal show={showChangePass} onHide={handleClickClose}>
        <Modal.Header closeButton>
          <Modal.Title>Change Pass</Modal.Title>
        </Modal.Header>
        <Modal.Body> 
        <Row className="container">
            <Col md={{ span: 8, offset: 2}}>
            <Form.Label>Old Password</Form.Label>
            <InputGroup className="mb-3">
            
            <Form.Control 
            placeholder="Old Password"
            type={!showOldPass ? "password" : "text"} 
            value={password}   
            onChange={(event) => {handleChangeOldPass(event)}}  
            
            />    
            <InputGroup.Text>{showOldPass ? <BsEye onClick={handleshowOldPass}/> : <BsEyeSlash onClick={handleshowOldPass}/>}</InputGroup.Text>

        </InputGroup>
            </Col>              
          </Row>  
          <Row className="container">
            <Col md={{ span: 8, offset: 2 }}>
            <Form.Label>New Password</Form.Label>
            <InputGroup className="mb-3">
            
            <Form.Control 
            placeholder="New Password"
            type={!showNewPass ? "password" : "text"} 
            value={new_pass}   
            onChange={(event) => {handleChangeNewPass(event)}}  
            
            />    
            <InputGroup.Text>{showNewPass ? <BsEye onClick={handleshowNewPass}/> : <BsEyeSlash onClick={handleshowNewPass}/>}</InputGroup.Text>
            
        </InputGroup>
            </Col>              
          </Row>
          <Row className="container">
            <Col md={{ span: 8, offset: 2 }}>
            <Form.Label>Confirm Password</Form.Label>
            <InputGroup className="mb-3">
            
            <Form.Control 
            placeholder="New Password"
            type={!showConfirmPass ? "password" : "text"} 
            value={confirmPass}   
            onChange={(event) => {handleChangeConfirmPass(event)}}  
            
            />    
            <InputGroup.Text>{showConfirmPass ? <BsEye onClick={handleshowConfirmPass}/> : <BsEyeSlash onClick={handleshowConfirmPass}/>}</InputGroup.Text>
            
        </InputGroup>
            </Col>              
          </Row>
        </Modal.Body>
        <Modal.Footer>
          <Button variant="secondary" onClick={handleClickClose}>
            Cancel
          </Button>
          <Button variant="primary" onClick={handleClickSave}>
            Save 
          </Button>
        </Modal.Footer>
      </Modal>
        </React.Fragment>
    )
}