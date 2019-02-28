import React, { Fragment } from 'react';
import { Grid, Col, Row, Button, ButtonGroup} from '@sm/wds-react';

export default () => (
  <div className='wds-flex wds-flex--y'>
    <div className='wds-flex wds-flex--y wds-flex--x-center wds-flex--y-center'>
      <h2> Components
      </h2>
      <ButtonGroup>
        <Button size='lg' variant='ghost' href='./wds/button'>
          Button
        </Button>
        <Button size='lg' variant='ghost' href='./wds/button_group'>
          Button Group
        </Button>
        <Button size='lg' variant='ghost' href='./wds/input'>
          Input
        </Button>
        <Button size='lg' variant='ghost' href='./wds/card'>
          Card
        </Button>
        <Button size='lg' variant='ghost' href='./wds/checkbox'>
          Checkbox
        </Button>
        <Button size='lg' variant='ghost' href='./wds/modal'>
          Modal
        </Button>
        <Button size='lg' variant='ghost' href='./wds/tabs'>
          Tabs
        </Button>
      </ButtonGroup>
      <br/>
      <br/>
      <br/>
    </div>
    <div className='wds-flex wds-flex--y wds-flex--x-center wds-flex--y-center'>
      <h2> React Example Page
      </h2>
      <Button size='lg' href='/wds/react_example'>
        See Example
      </Button>
    </div>
  </div>
);