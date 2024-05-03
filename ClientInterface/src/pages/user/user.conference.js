import React, {useState, useEffect} from "react";
import Button from 'react-bootstrap/Button';
import {
  Row,
  Col,
  Card,
  Radio,
  Table,
  Upload,
  message,
  Progress,  
  Avatar,
  Space,
  Tag,  
  Typography,
  
  Input,
  Select
} from "antd";
import Form from 'react-bootstrap/Form';
import { EditOutlined, EyeOutlined, SearchOutlined } from "@ant-design/icons";

import ConferenceService from "../../services/conference.service";
import notification from "../../utils/notification";

export default function UserConference () {
    const [conferenceID, setConferenceID] = useState("");
    
    
    const [search, setSearch] = useState("");
    const [conferences, setConferences] = useState([]);
    const [datas, setDatas] = useState([]); 
    const [viewConference, setViewConference] = useState(false)
  const columns = [    
    {
      title: "Start Date",
      dataIndex: "start_date",      
     
    },
    {
      title: "Name",
      dataIndex: "name",
    },
  
    {
      title: "City",
      dataIndex: "city"
    },    
    
    {
      title: "Link",
      key: 'action',      
      render: (record) => {
        return (
          <>
            <EyeOutlined
            style={{ color: "red", marginLeft: 12 }}
              onClick={() => {
                onEditData(record);
              }}
            />           
          </>
        );
      },    
  
    }
    
  ];
  

  
  const handleKeyDown = (e) => {
    
    if (e.key === 'Enter') {
      const tempDataName = datas.filter(e => e.name.toLocaleLowerCase().includes(search.toLocaleLowerCase()))
      if(tempDataName.length === 0) {
        const tempDataCity = datas.filter(e => e.city.toLocaleLowerCase().includes(search.toLocaleLowerCase()))
        setConferences(tempDataCity);
      } else {
        setConferences(tempDataName)
      }     
    }
  }
  const handleChangeSearch = (event) => {    
    
    setSearch(event.target.value)
  }
  
  const onEditData = (record) => {
    
    if(record.url) {
        window.open(`${notification.URLLink}${record.url}`)
        ConferenceService.conferenceById(record.conference_id).then(
            response => {
                if (response && response.data && response.status) {
                    console.log(response.data)
                }
            }, error => {
                console.log(error.response)
            }
        )
    }
    
    
  };
    useEffect(()=>{   
        ConferenceService.conferences().then(
            response => {

                if (response && response.data && response.status) {

                    setConferences(response.data.conferences)
                    setDatas(response.data.conferences)
                }
            }, error => {
                console.log(error)
            }
        )
      
    },[])
    return(
        <React.Fragment>
        <div className="container">
        {!viewConference && (
          <>
          <header className="jumbotron">
            <h1>Conferences </h1> 
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
          </>)}
          <Card
          bordered={false}
          className="criclebox tablespace mb-24"
                    
          >
            <div className="table-responsive">
            
            <Table
              columns={columns}
              dataSource={conferences}
              pagination={true}
              rowKey="conference_id"              
              bordered
              className="ant-border-space"
            />
          </div>
        </Card> 
       
        </div>
        </React.Fragment>
    )
}