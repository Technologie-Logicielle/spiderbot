import axios from "axios";

import header from "./header.service";


const signIn = (email, password) => (
     axios.post(`${process.env.REACT_APP_API_URL}/user/signin`, {
        email, password
     },  { 
        headers: header.authHeader() 
    })
);
const signUp = (username, first_name, last_name, email, password) => (
    axios.post(`${process.env.REACT_APP_API_URL}/user/signup`, {
        username, first_name, last_name, email, password
    },  { 
       headers: header.authHeader() 
   })
);

const changePass = ( password, new_password) => (
    
    axios.post(`${process.env.REACT_APP_API_URL}/user/password`, {
        password, new_password
    },  { 
       headers: header.authHeader() 
   })
);



const AdminService = {
    signIn,
    signUp,
    changePass
}
export default AdminService