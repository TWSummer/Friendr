import React from 'react';
import { Link } from 'react-router-dom';

class SiteFooter extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <footer className="page-footer">
        <a href="">About</a>
        <a href="https://github.com/TWSummer">Github</a>
        <a href="https://www.linkedin.com/in/twsummer/">Linked In</a>
        <a href="">email</a>
      </footer>
    );
  }
}

export default SiteFooter;
