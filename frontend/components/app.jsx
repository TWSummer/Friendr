import { Route, Switch, Link } from 'react-router-dom';
import { Provider } from 'react-redux';
import React from 'react';
import { AuthRoute, ProtectedRoute } from '../util/route_util';
import HomePageContainer from './home/home_page_container';
import LoggedInHomeContainer from './logged_in_home/logged_in_home_container';



const App = () => (
  <div>
    <Switch>
      <ProtectedRoute exact path="/home" component={LoggedInHomeContainer} />
      <AuthRoute exact path="/" component={HomePageContainer} />
    </Switch>
  </div>
);

export default App;
