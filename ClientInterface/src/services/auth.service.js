import axios from "axios";

const Login = (email, password, role) => (
   axios.post(`${process.env.REACT_APP_API_URL}/user/signin`, {
        email,
        password,
        role
      })      
);
const Logout = () => (
  localStorage.removeItem("isuser")  
);

const Signup = (email,   password, name ) => (
  axios.post(`${process.env.REACT_APP_API_URL}/user/signup`, {
    email, password, name
  })
);



const Service = {
  Login, 
  Logout, 
  Signup
}

export default Service
