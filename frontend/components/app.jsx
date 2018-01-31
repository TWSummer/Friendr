import { Route, Switch, Link } from 'react-router-dom';
import { Provider } from 'react-redux';
import React from 'react';
import { AuthRoute, ProtectedRoute } from '../util/route_util';
import HomePageContainer from './home/home_page_container';
import LoggedIn from './logged_in';



const App = () => (
  <div>
    <Switch>
      <AuthRoute exact path="/" component={HomePageContainer} />
      <ProtectedRoute path="/" component={LoggedIn} />
    </Switch>
  </div>
);

export default App;
