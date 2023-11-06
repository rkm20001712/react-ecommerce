import React, { Component } from "react";
import { Switch, Route } from "react-router-dom";
import Header from "./header";
import Home from "./dashboard";
import SideBar from "./sidebar";
import Shop from "./view/shop";
import Product from "./view/product";
import Profile from "./view/profile";
import Coupon from "./view/coupon";
export default class rootRoutes extends Component {
  render() {
    const { match } = this.props;
    return (
      <main>
        <Header />
        <div id="layoutSidenav">
          <SideBar />
          <Switch>
            <Route
              exact
              path={[`${match.path}/home`, `${match.path}`]}
              component={Home}
            />
            <Route path={`${match.path}/profile`} component={Profile} />
            <Route path={`${match.path}/shop`} component={Shop} />
            <Route path={`${match.path}/product`} component={Product} />
            <Route path={`${match.path}/coupon`} component={Coupon} />
          </Switch>
        </div>
      </main>
    );
  }
}
