import React from 'react';
import { Route, Switch } from 'react-router-dom';
import LoginForm from './session/login_form_container';
import SignupForm from './session/signup_form_container';
import SpotForm from './spots/spot_form_container';
import { ProtectedRoute } from '../util/route_util';
import Navbar from './navbar_container';
import IndexPage from './index_page_container';
import ShowPage from './spots/show_page_container';
import TripsIndex from './trips/trips_index_container';
import LandingPage from './landing_page';


const App = () => {
  return (
  <div>
  <header>
    <Navbar />
      <ProtectedRoute path='/spots/new' component={SpotForm} />
      <ProtectedRoute path='/mytrips' component={TripsIndex} />
      <Route path='/spots/:id' component={ShowPage} />
      <Route exact path='/spots' component={IndexPage} />
      <Route exact path='/' component={LandingPage} />
  </header>
 </div>
 );
};

export default App;
