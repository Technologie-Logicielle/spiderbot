import axios from "axios";
import header from "./header.service";

const conferences = () => (
     axios.get(`${process.env.REACT_APP_API_URL}/admin/conferences`,
    { 
        headers: header.authHeader() 
    })
);

const conferenceById = (id) =>(
    axios.get(`${process.env.REACT_APP_API_URL}/admin/conferences/${id}`, { 
        headers: header.authHeader() 
    })
);


const configs = () => (
    axios.get(`${process.env.REACT_APP_API_URL}/admin/configs`, { 
       headers: header.authHeader() 
   })
);

const postconfigs = () => (
    axios.post(`${process.env.REACT_APP_API_URL}/admin/configs`,{

    } ,{ 
       headers: header.authHeader() 
   })
);

const putConfigsById = (id) => (
    axios.put(`${process.env.REACT_APP_API_URL}/admin/configs/${id}`,{

    } ,{ 
       headers: header.authHeader() 
   })
);








const AdminService = {
    conferences,
    conferenceById,
    configs,
    postconfigs,
    putConfigsById
}
export default AdminService