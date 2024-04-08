import axios from "axios";
import header from "./header.service";

const getAllAdmin = () => (
     axios.get(`${process.env.REACT_APP_API_URL}/admin/account?type=admin`,
    { 
        headers: header.authHeader() 
    })
);

const changePassByAdmin = (check, password) =>(
    axios.put(`${process.env.REACT_APP_API_URL}/admin/password`,{
        id: header.getUserId(), check, password
    },
    { 
        headers: header.authHeader() 
    })
);


const getAllCustomerByAdmin = () => (
    axios.get(`${process.env.REACT_APP_API_URL}/admin/account?type=customer`, { 
       headers: header.authHeader() 
   })
);

const getCustomerIdByAdmin = (id) => (
    axios.get(`${process.env.REACT_APP_API_URL}/admin/account/${id}?type=customer`, { 
       headers: header.authHeader() 
   })
);


const putCustomerByAdmin = (id, password, name ) =>(
    axios.put(`${process.env.REACT_APP_API_URL}/admin/account`,{
        id, password, name        
    },
    { 
        headers: header.authHeader() 
    })
);


const deleteCustomerIdByAdmin = (id) =>(
    axios.delete(`${process.env.REACT_APP_API_URL}/admin/account`,{
        data: {id, type: "customer"}
    },
    { 
        headers: header.authHeader() 
    })
);



const AdminService = {
    getAllAdmin,
    changePassByAdmin,
    getCustomerIdByAdmin,    
    getAllCustomerByAdmin,
    deleteCustomerIdByAdmin,
    putCustomerByAdmin,
}
export default AdminService