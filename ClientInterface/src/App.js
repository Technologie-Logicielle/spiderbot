
import { Switch, Route  } from "react-router-dom";
import Home from "./pages/Home";

import AdminCustomer from "./pages/admin/admin.customer";
import AdminProfile from "./pages/admin/admin.profile";

import CustomerProfile from "./pages/customer/customer.profile";

import SignUp from "./pages/SignUp";
import SignIn from "./pages/SignIn";
import Logout from "./pages/Logout";
import Main from "./components/layout/Main";
import Page404 from "./pages/page404";
import NotFound from "./pages/pageNotfound";

import "antd/dist/antd.css";
import "./assets/styles/main.css";
import "./assets/styles/responsive.css";
import header from "./services/header.service";

function App() {
  const isUser = header.email() && header.role() 
  const isAdmin = header.email() && header.role() && header.role() === "admin";
  const isCustomer = header.email() && header.role() && header.role() === "customer";
  return (
    <div className="App">
      <Switch>
        <Route  path="/signup" exact component={SignUp} />
        <Route path="/signin" exact component={SignIn} />
        <Route path="/404" exact component={Page404} />
        <Main>  
          <Route exact path="/admincustomer" component={isAdmin ? AdminCustomer : NotFound} />          
         
          <Route exact path="/adminprofile" component={isAdmin ? AdminProfile : NotFound} /> 
         
          <Route exact path="/customerprofile" component={isCustomer ? CustomerProfile : NotFound} />
          
          <Route exact path="/signin" component={isUser ? Logout : NotFound} />
          
          <Route exact path="/*" component={Home} />
          
        </Main>
      </Switch>
    </div>
  );
}

export default App;
