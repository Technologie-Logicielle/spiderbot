
import { Switch, Route  } from "react-router-dom";
import Home from "./pages/Home";

import AdminCustomer from "./pages/admin/admin.customer";
import AdminProfile from "./pages/admin/admin.profile";

import UserProfile from "./pages/user/user.profile";
import UserConference from './pages/user/user.conference';

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
  const isAdmin = header.userName() && header.email();
  const isUser = header.email() && header.userName() ;
  return (
    <div className="App">
      <Switch>
        <Route  path="/signup" exact component={SignUp} />
        <Route path="/signin" exact component={SignIn} />
        <Route path="/404" exact component={Page404} />
        <Main>  
          <Switch>
          <Route exact path="/" component={UserConference } />

          <Route exact path="/admin00" component={isAdmin ? AdminCustomer : NotFound} />          

          <Route exact path="/admin01" component={isAdmin ? AdminProfile : NotFound} /> 

          <Route exact path="/userprofile" component={isUser ? UserProfile : NotFound} />
         
          <Route path="*" component={Page404} />
          </Switch>
        </Main>
      </Switch>
    </div>
  );
}

export default App;
