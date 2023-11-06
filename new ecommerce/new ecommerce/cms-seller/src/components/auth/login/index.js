import React, { Component } from "react";
import { Redirect } from "react-router-dom";
import Loader from "../../loader";
import { GetUserLogin } from "../../services";
import ButtonField from "../../common/ButtonField/ButtonField";
import { getCookie } from "../../../function";

export default class Signin extends Component {
  constructor(props) {
    super(props);
    this.state = {
      email: "",
      password: "",
      role: null,
      redirectToReferrer: false,
      isloaded: false,
    };
  }
  handleChange(e) {
    this.setState({ [e.target.name]: e.target.value });
  }
  handleChangeUser(e) {
    this.setState({ [e.target.name]: e.target.value });
  }
  handleSubmit = async (event) => {
    event.preventDefault();
    this.setState({ isloaded: true });
    let data = {
      email: this.state.email,
      password: this.state.password,
      role: this.state.role,
    };
    let user = await GetUserLogin.getUserLogin(data);
    if (user) {
      GetUserLogin.authenticate(user, () => {
        this.setState({ redirectToReferrer: true, isloaded: false });
        window.location.reload();
      });
    } else {
      this.setState({ redirectToReferrer: false, isloaded: false });
    }
  };
  render() {
    const { email, password, role } = this.state;
    let disableSaveButton = !email || !password || !role;
    if (this.state.redirectToReferrer && getCookie("role") == "seller") {
      return <Redirect to={"/admin"} />;
    }
    if (this.state.redirectToReferrer && getCookie("role") == "salon") {
      return <Redirect to={"/salon"} />;
    }
    let { isloaded } = this.state;
    return (
      <div className="bg-sign">
        <div id="layoutAuthentication">
          <div id="layoutAuthentication_content">
            <main>
              <div className="container">
                {isloaded ? <Loader /> : ""}
                <div className="row justify-content-center">
                  <div className="col-lg-5">
                    <form onSubmit={this.handleSubmit}>
                      <div className="card shadow-lg border-0 rounded-lg mt-5">
                        <div className="card-header card-sign-header">
                          <div className="panel-header text-center mb-3">
                            <img
                              src="/images/logo.png"
                              className="brand_logo"
                              alt="Logo"
                            />
                            <h4 className="fs-24">Chitwashop Seller Center!</h4>
                            <p className="text-muted text-center mb-0">
                              Nice to see you! Please log in to your account.
                            </p>
                          </div>
                        </div>
                        <div className="card-body">
                          <form>
                            <div className="form-group">
                              <label
                                className="form-label"
                                htmlFor="inputEmailAddress"
                              >
                                Email*
                              </label>
                              <input
                                className="form-control py-3"
                                id="inputEmailAddress"
                                type="email"
                                placeholder="Enter email address"
                                name="email"
                                value={this.state.email}
                                onChange={(e) => this.handleChangeUser(e)}
                              />
                            </div>
                            <div className="form-group">
                              <label
                                className="form-label"
                                htmlFor="inputPassword"
                              >
                                Password*
                              </label>
                              <input
                                className="form-control py-3"
                                id="inputPassword"
                                type="password"
                                placeholder="Enter password"
                                name="password"
                                value={this.state.password}
                                onChange={(e) => this.handleChangeUser(e)}
                              />
                            </div>
                            <div className="form-group">
                              <label>Role</label>
                              <select
                                id="role"
                                className="form-control"
                                name="role"
                                defaultValue={this.state.role}
                                onChange={(e) => this.handleChange(e)}
                              >
                                <option>Select Role</option>
                                <option value="seller">Seller</option>
                                <option value="salon">Salon</option>
                              </select>
                            </div>

                            <ButtonField
                              className="theme-btn w-100"
                              variant="contained"
                              color="primary"
                              buttonText={"Login"}
                              disabled={disableSaveButton}
                              data-test="create-user-button"
                              onClick={this.handleSubmit}
                            />
                            <p className="text-muted text-center mt-3 mb-2">
                              Copyright © 2020 ChitwaShop. All Rights Reserved
                            </p>
                          </form>
                        </div>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
            </main>
          </div>
        </div>
      </div>
    );
  }
}
