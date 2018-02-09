import { Route, Switch, Link } from 'react-router-dom';
import { Redirect } from 'react-router';
import React from 'react';
import LoggedInHomeContainer from './logged_in_home/logged_in_home_container';
import SiteHeaderContainer from './site_header/site_header_container';
import ProfileContainer from './profile/profile_container';
import ViewProfileContainer from './view_profile/view_profile_container';
import QuestionContainer from './questions/question_container';
import FriendSearchContainer from './search/friend_search_container';
import MessageContainer from './messages/message_container';

const ProtectedRouter = (props) => {
  return (
    <div>
      <SiteHeaderContainer />
      <Switch>
        <Route exact path="/profile" component={ProfileContainer} />
        <Route exact path="/profile/:username" component={ViewProfileContainer} />
        <Route exact path="/questions" component={QuestionContainer} />
        <Route exact path="/friends" component={FriendSearchContainer} />
        <Route exact path="/messages" component={MessageContainer} />
        <Redirect from='/' to='/profile'/>
      </Switch>
    </div>
  );
};

export default ProtectedRouter;


// <Route exact path="/home" component={LoggedInHomeContainer} />
