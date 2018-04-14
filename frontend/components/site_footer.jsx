import React from 'react';
import { Link } from 'react-router-dom';

class SiteFooter extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <footer className="page-footer">
        <a href="http://www.theodoresummer.com/">Portfolio</a>
        <a href="https://github.com/TWSummer">Github</a>
        <a href="https://www.linkedin.com/in/twsummer/">Linked In</a>
        <a href="mailto:TWSummer@gmail.com">Email</a>
      </footer>
    );
  }
}

export default SiteFooter;
