import React, { Fragment } from 'react';
import { Grid, Row, Col, Button, Card, Typography, Select, Option, Input, InputGroup, InputGroupAddon, Icon } from '@sm/wds-react';

const CustomTitleSearch = (
  <Fragment>
    <InputGroup><InputGroupAddon><Icon>s</Icon></InputGroupAddon><Input placeholder='Search' /></InputGroup>
    <Button color='muted' className='wds-m-l-2'><Icon>ø</Icon></Button>
  </Fragment>
);

const CustomTitleSelect = (
  <Fragment>
    <Select
      id='surveys'
      value=''
    >
      <Option value='ChooseAnOption'>All Surveys</Option>
      <Option value='I like the color'>I like the color blue</Option>
      <Option value='Two'>All black on black</Option>
      <Option value='Three'>Brown is an okay color</Option>
    </Select>
    <Button color='muted' className='wds-m-l-2'><Icon>o</Icon></Button>
  </Fragment>
);

const CustomTitleText = (
  <Fragment>
    <Typography variant='sectionTitle'>All Surveys <Icon size='sm'>–</Icon></Typography>
  </Fragment>
);


export default () => (
  <Fragment>
    <Grid>
      <Row>
        <Col>
          <Card>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
          </Card>
        </Col>
      </Row>

      <br />

      <Row>
        <Col>
          <Card
            title={<Typography variant='cardTitle'>The monkey was curious.</Typography>}
          >
            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
          </Card>
        </Col>
      </Row>

      <br />

      <Row>
        <Col>
          <Fragment>
            <Card
              title={CustomTitleText}
            >
              Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
            </Card>
            <Card
              title={CustomTitleSearch}
            >
              Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
            </Card>

            <Card
              title={CustomTitleSelect}
            >
              Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
            </Card>
          </Fragment>
        </Col>
      </Row>
    </Grid>
  </Fragment>
);
