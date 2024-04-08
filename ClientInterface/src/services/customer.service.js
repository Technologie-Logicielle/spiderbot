import axios from "axios";
import header from "./header.service";


const getCustomerIdByCustomer = (id = header.getUserId()) =>(
    axios.get(`${process.env.REACT_APP_API_URL}/customer/get/${id}`,
    { 
        headers: header.authHeader() 
    })
);


const changeCustomerByCustomer = ( check, address, name ) =>(
    axios.put(`${process.env.REACT_APP_API_URL}/customer/info`,{
        id: header.getUserId(), check, address, name
    },{ 
        headers: header.authHeader() 
    })
);

const changePassByCustomer = ( check, password ) =>(
    axios.put(`${process.env.REACT_APP_API_URL}/customer/password`,{
        id: header.getUserId(), check,  password 
    },{ 
        headers: header.authHeader() 
    })
);


const customerService = {
    getCustomerIdByCustomer,
    changeCustomerByCustomer,
    changePassByCustomer
}

export default customerService