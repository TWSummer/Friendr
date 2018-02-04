import { Route, Switch, Link } from 'react-router-dom';
import { Redirect } from 'react-router';
import React from 'react';
import LoggedInHomeContainer from './logged_in_home/logged_in_home_container';
import SiteHeaderContainer from './site_header/site_header_container';
import ProfileContainer from './profile/profile_container';
import ViewProfileContainer from './view_profile/view_profile_container';
import QuestionContainer from './questions/question_container';

const ProtectedRouter = (props) => {
  return (
    <div>
      <SiteHeaderContainer />
      <Switch>
        <Route exact path="/home" component={LoggedInHomeContainer} />
        <Route exact path="/profile" component={ProfileContainer} />
        <Route exact path="/profile/:username" component={ViewProfileContainer} />
        <Route exact path="/questions" component={QuestionContainer} />
        <Redirect from='/' to='/home'/>
      </Switch>
    </div>
  );
};

export default ProtectedRouter;
