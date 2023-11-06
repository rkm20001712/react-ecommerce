import React, { Component } from "react";
import { Link } from "react-router-dom";
import { connect } from "react-redux";
import GetProductDetails from "../../../services/GetProductDetails";
import { addToCart } from "../../../../store/actions/cartActions";
import CircularProgress from "@material-ui/core/CircularProgress";
import { Paper, Container, Grid, Button } from "@material-ui/core";
import LazyLoad from "react-lazyload";
import "./index.css";

class NewArrivalProduct extends Component {
  constructor(props) {
    super(props);
    this.state = {
      productlist: [],
      isloaded: false,
    };
  }
  async componentDidMount() {
    let list = await GetProductDetails.getNewArrivalProudct();
    if (list) {
      this.setState({ productlist: list.data, isloaded: true });
    }
  }
  render() {
    let list = this.state.productlist;
    return (
      <Container maxWidth="lg" className={list.length ? "" : "d-none"}>
        <section id="course-tag" className="course-area">
          <div className="course-wrapper">
            <div className=" margin-top-20px">
              <Paper className="parlour_bk">
                <div className="row">
                  <div className="col-lg-12">
                    <div className="section-heading text-center">
                      <h1 className="section__title py-3">
                        Explore New Arrival
                      </h1>
                      <span className="section-divider" />
                    </div>
                  </div>
                  {/* end col-lg-12 */}
                </div>
                {/* end row */}
                <Grid
                  className="p-3 salonchainbg"
                  item
                  xs={12}
                  sm={12}
                  md={12}
                  lg={12}
                  xl={12}
                >
                  <Grid container spacing={3}>
                    {list.length
                      ? list.slice(0, 9).map((row, index) => (
                          <Grid item xs={12} sm={6} md={6} lg={4} xl={4}>
                            <Paper key={index}>
                              <Grid container>
                                <Grid
                                  className="p-1"
                                  item
                                  xs={5}
                                  md={5}
                                  sm={5}
                                  lg={5}
                                  xl={5}
                                >
                                  <Link
                                    to={{
                                      pathname: `/p/${row.slug}/${row.id}`,
                                      state: row,
                                    }}
                                  >
                                    {row.productphotos ? (
                                      row.productphotos
                                        .slice(0, 1)
                                        .map((p, index) => (
                                          <LazyLoad key={index}>
                                            <img
                                              className="img-fluid"
                                              src={p.imgUrl}
                                              alt="product"
                                            />
                                          </LazyLoad>
                                        ))
                                    ) : (
                                      <LazyLoad>
                                        <img
                                          className="img-fluid"
                                          src="/img/opacity-loss.jpg"
                                          alt={404}
                                        />
                                      </LazyLoad>
                                    )}
                                  </Link>
                                </Grid>
                                <Grid
                                  className="details_sd pl-2"
                                  item
                                  xs={7}
                                  md={7}
                                  sm={7}
                                  lg={7}
                                  xl={7}
                                >
                                  <Grid container>
                                    <Grid
                                      item
                                      xs={12}
                                      md={12}
                                      sm={12}
                                      lg={12}
                                      xl={12}
                                    >
                                      <div className="py-2">
                                        <Link
                                          to={{
                                            pathname: `/p/${row.slug}/${row.id}`,
                                            state: row,
                                          }}
                                        >
                                          <h4 className="salon_home_title">
                                            <b>{row.name}</b>
                                          </h4>
                                        </Link>
                                        <div className="py-4">
                                          <h6 className="address-salon">
                                            Brand:{" "}
                                            {row.ch_brand_detail
                                              ? row.ch_brand_detail.name
                                              : ""}
                                          </h6>
                                          <h6 className="address-salon">
                                            Save:{" "}
                                            {row.ProductVariants
                                              ? row.ProductVariants.slice(
                                                  0,
                                                  1
                                                ).map((p) =>
                                                  p.discount ? (
                                                    <span className="badge badge-success review_card-sd">
                                                      {Math.round(
                                                        ((p.distributorPrice -
                                                          p.netPrice) *
                                                          100) /
                                                          p.distributorPrice
                                                      )}
                                                      % OFF
                                                    </span>
                                                  ) : (
                                                    ""
                                                  )
                                                )
                                              : ""}
                                          </h6>
                                          <h6>
                                            <strong>
                                              <span className="mdi mdi-approval" />{" "}
                                              Available in
                                            </strong>{" "}
                                            -
                                            {row.ProductVariants
                                              ? row.ProductVariants.slice(
                                                  0,
                                                  1
                                                ).map((p) =>
                                                  p.Available ? (
                                                    <span class="text-success">
                                                      in stock
                                                    </span>
                                                  ) : (
                                                    <span class="text-danger">
                                                      out of stock
                                                    </span>
                                                  )
                                                )
                                              : ""}
                                          </h6>
                                        </div>
                                      </div>
                                      {row.ProductVariants
                                        ? row.ProductVariants.slice(0, 1).map(
                                            (p) =>
                                              p.Available ? (
                                                <Grid
                                                  item
                                                  xs={11}
                                                  md={11}
                                                  sm={11}
                                                  lg={11}
                                                  xl={11}
                                                >
                                                  <div className="product-footer">
                                                    <button
                                                      type="button"
                                                      className="btn btn-secondary btn-sm float-right"
                                                      onClick={() =>
                                                        this.props.addToCart(
                                                          row
                                                        )
                                                      }
                                                    >
                                                      <i className="mdi mdi-cart-outline" />{" "}
                                                      Add To Cart
                                                    </button>
                                                    <p className="offer-price mb-0">
                                                      Rs.{p.netPrice}
                                                      <i className="mdi mdi-tag-outline" />
                                                      <br />
                                                      {p.discount ? (
                                                        <span className="regular-price">
                                                          Rs.
                                                          {p.distributorPrice}
                                                        </span>
                                                      ) : (
                                                        ""
                                                      )}
                                                    </p>
                                                  </div>{" "}
                                                </Grid>
                                              ) : (
                                                <Grid
                                                  item
                                                  xs={11}
                                                  md={11}
                                                  sm={11}
                                                  lg={11}
                                                  xl={11}
                                                >
                                                  <div className="product-footer">
                                                    <button
                                                      type="button"
                                                      className="btn btn-secondary btn-sm float-right"
                                                      disabled
                                                    >
                                                      <i className="mdi mdi-cart-outline" />{" "}
                                                      Out Of Stock
                                                    </button>
                                                    <p className="offer-price mb-0">
                                                      Rs.{p.netPrice}
                                                      <i className="mdi mdi-tag-outline" />
                                                      <br />
                                                      {p.discount ? (
                                                        <span className="regular-price">
                                                          Rs.
                                                          {p.distributorPrice}
                                                        </span>
                                                      ) : (
                                                        ""
                                                      )}
                                                    </p>
                                                  </div>
                                                </Grid>
                                              )
                                          )
                                        : ""}
                                    </Grid>
                                  </Grid>

                                  {/* <h5 className="price-for-cate-sdad"><b>Rs.{row.pricelist[0].GRANDTOTAL} For {(row.pricelist[0].servicelist.category.Gender === "F" ? "Female" : "Male") + " " + row.pricelist[0].servicelist.SERVICENAME}</b></h5> */}
                                </Grid>
                              </Grid>
                            </Paper>
                          </Grid>
                        ))
                      : ""}
                  </Grid>
                </Grid>
                <Grid className="text-center p-2">
                  <Button
                    className="bg-grey"
                    variant="contained"
                    color="secondary"
                    href="/product/new-arrival"
                  >
                    View All
                  </Button>
                </Grid>
              </Paper>
            </div>
            {/* end row */}
          </div>
          {/* end course-wrapper */}
        </section>
      </Container>
    );
  }
}
export default connect(null, { addToCart })(NewArrivalProduct);
