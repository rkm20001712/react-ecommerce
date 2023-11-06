import React, { Component } from 'react'
import { GetLocationDetails } from '../../../../services';
import {
    Typography,Button
} from "@material-ui/core";
import Edit from '../edit';
import swal from 'sweetalert';
export default class List extends Component {
    constructor(props) {
        super(props);
        this.state = {
            getList: [],
        }
    }
    handleBack() {
        this.props.history.goBack();
    }
    async componentDidMount() {
        this.getLocation();
    }
    async getLocation() {
        let list = await GetLocationDetails.getCityList();
        this.setState({ getList: list.data })
    }
    async handlDeleteById(id) {
        swal({
            title: "Are you sure?",
            text: "You want to delete city from the List",
            icon: "warning",
            buttons: true,
            dangerMode: true,
        })
            .then(async (success) => {
                if (success) {
                    let value = await GetLocationDetails.getCityDeleteById(id);
                    if (value) {
                        this.getLocation();
                    }
                }
            });
    }
    render() {
        let self = this.state.getList;
        return (
            <div className="container-fluid">
               <div className="row">
                    <div className="col-lg-5 col-md-9 col-lg-6">
                        <h2 className="mt-30 page-title">Areas</h2>
                    </div>
                    <div className="col-lg-5 col-md-3 col-lg-6 back-btn">
                        <Button variant="contained" onClick={(e) => this.handleBack()}><i class="fas fa-arrow-left" /> Back</Button>
                    </div>
                </div>
                <ol className="breadcrumb mb-30">
                    <li className="breadcrumb-item">Dashboard</li>
                    <li className="breadcrumb-item active">City</li>
                </ol>
                <div className="row justify-content-between">
                    <div className="col-lg-12">
                        <a href="/admin/area/create" className="add-btn hover-btn">Add New</a>
                    </div>
                    <div className="col-lg-12 col-md-12">
                        <div className="card card-static-2 mt-30 mb-30">
                            <div className="card-title-2">
                                <h4>All City</h4>
                            </div>
                            <div className="card-body-table">
                                <div className="table-responsive">
                                    <table className="table ucp-table table-hover">
                                        <thead>
                                            <tr>
                                                <th style={{ width: 60 }}><input type="checkbox" className="check-all" /></th>
                                                <th style={{ width: 60 }}>ID</th>
                                                <th>City Name</th>
                                                <th>Zone</th>
                                                <th>Status</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            {
                                                self.map((row, index) => (
                                                    <tr key={index}>
                                                        <td><input type="checkbox" className="check-item" name="ids[]" defaultValue={7} /></td>
                                                        <td>{++index}</td>
                                                        <td>{row.TITLE}</td>
                                                        <td>{row.zone ? row.zone.name : ''}</td>
                                                        <td>
                                                        <button type="button" className={row.STATUS  ? "btn btn-sm btn-secondary btn-toggle active" : "btn btn-sm btn-secondary btn-toggle"} data-toggle="button" aria-pressed="true" autocomplete="off" onClick={(e) => this.handleStatus(index, e.target.value, row)}> <div className="handle"></div> </button>

                                                        </td>
                                                        <td className="action-btns">
                                                            <Edit state={row} />
                                                            <Typography className="delete-btn" onClick={(e) => this.handlDeleteById(row.id)} ><i className="fas fa-trash-alt" /></Typography>
                                                        </td>
                                                    </tr>
                                                ))
                                            }

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        )
    }
}
