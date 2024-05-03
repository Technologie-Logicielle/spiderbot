const authHeader = () => {
    const data = JSON.parse(localStorage.getItem('isuser'));
  
    if (data && data.token) {
     
      return { Authorization: data.token
    };       
    } else {
      return {};
    }
  } 
  
const  getUserId  = () => {
    const data = JSON.parse(localStorage.getItem('isuser'));

    if (data && data.id) {
      return data.id
    }else {
      return "";
    }
    
  }
  
  const userName = () => {
    const data = JSON.parse(localStorage.getItem('isuser'));
    if (data  && data.username) {
      return data.username
    } else {
      return "";
    }
  }
  const email = () => {
    const data = JSON.parse(localStorage.getItem('isuser'));
    
    if (data &&  data.email) {
      return data.email
    } else {
      return "";
    }
  }
  const firstname = () => {
    const data = JSON.parse(localStorage.getItem('isuser'));
    
    if (data &&  data.first_name) {
      return data.first_name
    } else {
      return "";
    }
  }

  const lastname = () => {
    const data = JSON.parse(localStorage.getItem('isuser'));
    
    if (data &&  data.last_name) {
      return data.last_name
    } else {
      return "";
    }
  }

  const role = () => {
    const data = JSON.parse(localStorage.getItem('isuser'));
    
    if (data &&  data.role) {
      return data.role
    } else {
      return "";
    }
  }

  const header = {
    authHeader,
    getUserId,
    userName,
    email,
    firstname,
    lastname,
    role
  }

  export default header;
  