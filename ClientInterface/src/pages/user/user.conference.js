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
    const [count, setCount] = useState(0); 
    const [page, setPage] = useState({ page: 1, pageSize: 20 }); 
    const [sort, setSort] = useState({}); 
    const [loading, setLoading] = useState(true);
    const [viewConference, setViewConference] = useState(false)
  /** @type {import('antd').TableColumnType<any>} */
  const columns = [    
    {
      title: "Name",
      dataIndex: "name",
      sorter: true
    },
    {
      title: "Start Date",
      dataIndex: "start_date",      
      sorter: true,
    },
    {
      title: "End Date",
      dataIndex: "end_date",      
      sorter: true,
    },
    {
      title: "City",
      dataIndex: "city",
      sorter: true
    },    
    
    {
      title: "Link",
      key: 'action',      
      render: (record) => {
        return (
          <>
            <EyeOutlined
              title="Event page"
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
    setPage({...page, page: 1})
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
        setLoading(true);
        ConferenceService.conferences({name: search, ...page, ...sort}).then(
            response => {

                if (response && response.data && response.status) {

                    setConferences(response.data.conferences)
                    setDatas(response.data.conferences)
                    setCount(response.data.count)
                }
                setLoading(false);
            }, error => {
                console.log(error)
                setLoading(false);
            }
        )
      
    },[page, search, sort])
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
              pagination={{
                total: count,
                current: page.page,
                pageSizeOptions: [10, 20, 50]
              }}
              loading={loading}
              onChange={(pagination, _, sorter) => {
                console.log(sorter)
                setPage({ page: pagination.current, pageSize: pagination.pageSize })
                setSort({ orderBy: sorter.field, order: sorter.order === "ascend" ? "asc" : "desc" })
              }}
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
