import { Route, Switch, Link } from 'react-router-dom';
import React from 'react';
import LoggedInHomeContainer from './logged_in_home/logged_in_home_container';
import SiteHeaderContainer from './site_header/site_header_container';

const LoggedIn = (props) => {
  console.log(props);

  return (
    <div>
      <SiteHeaderContainer />
      <Route exact path="/home" component={LoggedInHomeContainer} />
    </div>
  );
};

export default LoggedIn;
