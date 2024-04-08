import React, {useState, useEffect} from "react";

import {
  Card,  
} from "antd";
import Form from 'react-bootstrap/Form';
import Row from 'react-bootstrap/Row'
import Col from "react-bootstrap/Col";
import Button from 'react-bootstrap/Button';
import CrawlerService from "../../services/craw.service";

export default function CustomerProfile () {
    const [urlWeb, setURLWeb] = useState("");
   
  const handleChangeURL = (event) => {
    setURLWeb(event.target.value);
  }
  const handleClickCancel =  () => {
    setURLWeb("")
  }
  const handleClickCrawl = (urlWeb) => {
    CrawlerService.getDataByURL(urlWeb).then(
        response => {
            if(response.data && response.data.success === true) {
                console.log(response.data)
            }
            
        }, error => {
            console.log(error)
        }
    )
  }
  
    useEffect(()=>{   
      
    },[])
    return(
        <React.Fragment>
        <div className="container">
          <header className="jumbotron">
            <h1>Crawl </h1> 
          </header>
          <Card >
          <Row className="container">
            <Col md={{ span: 5, offset: 4 }}>
            <Form.Group className="mb-3">
            <Form.Label>URL </Form.Label>
            <Form.Control 
            disabled
            type="url" 
            placeholder="Enter URL"        
            value={urlWeb}
            onChange={(event) => {handleChangeURL(event)}}
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
            <Button className="btn btn-primary" onClick={handleClickCrawl}>
              Crawl
            </Button>
            </Col>
          </Row>
          
          </Card>   
        </div>
        </React.Fragment>
    )
}