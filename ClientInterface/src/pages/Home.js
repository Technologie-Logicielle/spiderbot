
import React, {  useEffect } from "react";


import header from '../services/header.service'


function Home() {
  
  useEffect(() => {
    if(!(header.email() && header.userName())) {
      window.location.assign('/signin')
    }
  })

  return (
    <>
      
    </>
  );
}

export default Home;
