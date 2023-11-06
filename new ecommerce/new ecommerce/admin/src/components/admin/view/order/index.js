import React, { Component } from 'react';
import { Switch, Route } from 'react-router-dom'
import View from './view';
import Edit from './edit';
import List from './list'
export default class Order extends Component {
    render() {
        const { match } = this.props;
        console.log(match)
        return (
            <div id="layoutSidenav_content">
                <main>
                    <Switch>
                        <Route path={[`${match.path}/list`]} component={List} />
                        <Route path={[`${match.path}/view/:id`]} component={View} />
                        <Route path={[`${match.path}/edit/:id`]} component={Edit} />
                    </Switch>
                </main>
            </div>
        );
    }
}