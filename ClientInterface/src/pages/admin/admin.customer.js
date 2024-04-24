import React, {useState, useEffect} from "react";

import {
  Card,  
  Table  
} from "antd";
import { BsEye } from 'react-icons/bs';
import { BsEyeSlash } from 'react-icons/bs';
import { InputGroup } from "react-bootstrap";
import Form from 'react-bootstrap/Form';
import Row from 'react-bootstrap/Row'
import Col from "react-bootstrap/Col";
import Button from 'react-bootstrap/Button';
import Modal from 'react-bootstrap/Modal';
import { EditOutlined, DeleteOutlined } from "@ant-design/icons";
import notification from "../../utils/notification";
import AdminService from "../../services/admin.service";
export default function AdminCustomer () {
    const [show, setShow] = useState(false);
    const [isLoad, setIsLoad] = useState(false);
    const [userId, setUserId] = useState("");
    
    const [disabled, setDisabled] = useState(false)
    const [email, setEmail] = useState("");
    const [name, setName] = useState("");
    const [password, setPassword] = useState("");
    const [datas, setDatas] = useState([]);
    const [tempDatas, setTempDatas] = useState([]);
    const [showPass, setShowPass] = useState(false)

  const [search, setSearch] = useState("");
  
  const columns = [
        
    {
      title: "Email",
      dataIndex: "email",        
    },
    {
      title: "Name",
      dataIndex: "name",
    },
  
    {
      title: "Address",
      dataIndex: "address"      
    },
    {
      title: "Phone",
      dataIndex: "phoneNumber"      
    },
    {
      title: "CreatedAt",
      dataIndex: "createdAt",
      render: (text, record) => (
        <p>
          {record.createdAt.toString().substring(0,10)}
        </p>
       ),
    },
    {
      title: "UpdatedAt",
      dataIndex: "updatedAt",
      render: (text, record) => (
        <p>
          {record.updatedAt.toString().substring(0,10)}
        </p>
       ),
    },
   
    {
      title: "Actions",
      key: 'action',      
      render: (record) => {
        return (
          <>
            <EditOutlined
              onClick={() => {
                onEditData(record);
              }}
            />
            <DeleteOutlined
              onClick={() => {
                onDeleteData(record);
              }}
              style={{ color: "red", marginLeft: 12 }}
            />
          </>
        );
      },    
  
    }
    
  ];
  
  
  const onDeleteData = (record) => {
    
    const id = record.id
    
    
    if(window.confirm(notification.CONFIRM_DELETE)){
      
      AdminService.deleteuserIdByAdmin(id).then(
        response => {
          console.log(response.data)
          if(response.data && response.data.success) {
            alert(notification.DELETE);
            setIsLoad(!isLoad);
          }
          
        }, error => {
          console.log(error)
        }
      )     
    }
    
  };

  const handleChangeEmail = (event) => (
    setEmail(event.target.value)
  )
  const handleChangeName = (event) => (
    setName(event.target.value)
  )

  const handleChangePass = (event) => (
    setPassword(event.target.value)
  )
  const clearScreen = () => {
    setName("");
    setEmail("");
    setPassword("");
    setUserId("");
    setDisabled(false)
  }
  const handleKeyDown = (e) => {
    
    if (e.key === 'Enter') {
      const tempDataEmails = tempDatas.filter(e => e.email.toLocaleLowerCase().includes(search.toLocaleLowerCase()))
      if(tempDataEmails.length === 0) {
        const tempDataNames =  tempDatas.filter(e => e.name.toLocaleLowerCase().includes(search.toLocaleLowerCase()))
        setDatas(tempDataNames)        
        
      } else {
        setDatas(tempDataEmails)
      }     
      
    }
  }

  const handleshowPass = () =>{
    setShowPass(!showPass)
  }


  const onChange = (pagination, filters, sorter, extra) => {
    console.log('params', pagination, filters, sorter, extra);
  };
  const handleChangeSearch = (event) => { 
    setSearch(event.target.value)
  }

  const handleClickSave = () => { 
    if(email && password &&  name ) {
      AdminService.putCustomerByAdmin(userId, password, name ).then(
        response =>{
          if(response.data && response.data.success === true) {
            alert(notification.EDIT)
            setShow(false);
            setIsLoad(!isLoad)
            clearScreen();
          }            
        }
      )
    } else {
      alert(notification.INPUT);
    }    
  }
  
  const handleClickClose = () => {
    setShow(false)
    clearScreen();
  }
  const onEditData = (record) => { 
    AdminService.getCustomerIdByAdmin(record.id).then(
      response => {
        if(response.data && response.data.success) {
          console.log(response.data.data)
          const temp = response.data.data
          setEmail(temp.email)
          setName(temp.name)
          setUserId(record.id)
          setShow(true)
          setDisabled(true)
        }
      }
    )
    
    
  };
    useEffect(()=>{   
      
      AdminService.getAllCustomerByAdmin().then(
        response => {
          if (response.data && response.data.success) {
                  
            console.log(response.data.data)
            setDatas(response.data.data)
            setTempDatas(response.data.data)
          }
          
        }, error => {
          console.log(error)
        }
      )
    },[isLoad])
    return(
        <React.Fragment>
        <div className="container">
          <header className="jumbotron">
            <h1>Customers </h1> 
          </header>
          <Card>
          <Row>
          <Col md={{ span: 3, offset: 0 }}>   
              <Form.Group  >
                <Form.Control 
                value={search}
                onChange={handleChangeSearch}
                onKeyDown={handleKeyDown}
                className="header-search"
                placeholder="Type here..."
                />        
              </Form.Group>             
              
              </Col>             
            </Row>
          </Card>                 
          
          <Card
          bordered={false}
          className="criclebox tablespace mb-24"
                 
          >
            
            <div className="table-responsive">
            
            <Table
              columns={columns}
              dataSource={datas}
              pagination={true}
              onChange={onChange}
              rowKey="id"
              bordered
              className="ant-border-space"
            />
          </div>
        </Card>
          
        <Modal show={show} onHide={handleClickClose}>
        <Modal.Header closeButton>
          <Modal.Title>Customer</Modal.Title>
        </Modal.Header>
        <Modal.Body> 
          <Form.Group className="mb-3">
            <Form.Label>Email</Form.Label>
            <Form.Control 
            disabled={disabled}
            type="email"         
            value={email}
            onChange={handleChangeEmail}
            placeholder="Enter email" />        
          </Form.Group>
          <Form.Group className="mb-3" >
            <Form.Label>Name</Form.Label>
            <Form.Control placeholder="Name" 
            value={name}
            required
            onChange={handleChangeName} 
            />        
          </Form.Group>          
          
          <Form.Group className="mb-3" >
            <Form.Label>Password</Form.Label>
            <InputGroup className="mb-3">
            <Form.Control 
            placeholder="Password"
            type={!showPass ? "password" : "text"} 
            value={password}   
            onChange={(event) => {handleChangePass(event)}}  
            />     
            <InputGroup.Text>{showPass ? <BsEye onClick={handleshowPass}/> : <BsEyeSlash onClick={handleshowPass}/>}</InputGroup.Text>
            </InputGroup>   
          </Form.Group>
          
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
        </div>
        </React.Fragment>
    )
}