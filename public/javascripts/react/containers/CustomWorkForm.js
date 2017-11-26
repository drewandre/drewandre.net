import React from 'react';
import ReactDOM from 'react-dom';
// import TextField from '../components/TextField'
// import TextArea from '../components/TextArea'
// import Select from '../components/Select'

class CustomWorkForm extends Component {
  // constructor(props) {
  //   super(props)
  //   this.state = {
  //     errors: {},
  //     firstName: '',
  //     lastName: '',
  //     city: '',
  //     state: '',
  //     phone: '',
  //     email: '',
  //     comments: '',
  //     stateOptions: [
  //                     'Alabama',
  //                     'Alaska',
  //                     'Arizona',
  //                     'Arkansas',
  //                     'California',
  //                     'Colorado',
  //                     'Connecticut',
  //                     'Delaware',
  //                     'Florida',
  //                     'Georgia',
  //                     'Hawaii',
  //                     'Idaho',
  //                     'Illinois Indiana',
  //                     'Iowa',
  //                     'Kansas',
  //                     'Kentucky',
  //                     'Louisiana',
  //                     'Maine',
  //                     'Maryland',
  //                     'Massachusetts',
  //                     'Michigan',
  //                     'Minnesota',
  //                     'Mississippi',
  //                     'Missouri',
  //                     'Montana Nebraska',
  //                     'Nevada',
  //                     'New Hampshire',
  //                     'New Jersey',
  //                     'New Mexico',
  //                     'New York',
  //                     'North Carolina',
  //                     'North Dakota',
  //                     'Ohio',
  //                     'Oklahoma',
  //                     'Oregon',
  //                     'Pennsylvania Rhode Island',
  //                     'South Carolina',
  //                     'South Dakota',
  //                     'Tennessee',
  //                     'Texas',
  //                     'Utah',
  //                     'Vermont',
  //                     'Virginia',
  //                     'Washington',
  //                     'West Virginia',
  //                     'Wisconsin',
  //                     'Wyoming' ]
  //   }
  //
  //   this.handleFirstName = this.handleFirstName.bind(this);
  //   this.handleLastName = this.handleLastName.bind(this);
  //   this.handleCity = this.handleCity.bind(this);
  //   this.handleStateSelection = this.handleStateSelection.bind(this);
  //   this.handlePhone = this.handlePhone.bind(this);
  //   this.handleEmail = this.handleEmail.bind(this);
  //   this.handleClearForm = this.handleClearForm.bind(this);
  //   this.handleFormSubmit = this.handleFormSubmit.bind(this);
  //
  //   this.validateFirstName = this.validateFirstName.bind(this);
  //   this.validateLastName = this.validateLastName.bind(this);
  //   this.validateCity = this.validateCity.bind(this);
  //   this.validateStateSelection = this.validateStateSelection.bind(this);
  //   this.validatePhone = this.validatePhone.bind(this);
  //   this.validateEmail = this.validateEmail.bind(this);
  //   this.validateComments = this.validateComments.bind(this);
  //
  // }
  //
  // handleFormSubmit(event) {
  //   event.preventDefault();
  //   if(
  //     this.validateFirstName(this.state.firstName) &&
  //     this.validateLastName(this.state.lastName) &&
  //     this.validateCity(this.state.city) &&
  //     this.validateStateSelection(this.state.state) &&
  //     this.validatePhone(this.state.phone) &&
  //     this.validateEmail(this.state.email) &&
  //     this.validateComments(this.state.comments)
  //   ) {
  //     let formPayLoad = {
  //       firstName: this.state.firstName,
  //       lastName: this.state.lastName,
  //       city: this.state.city,
  //       state: this.state.state,
  //       phone: this.state.phone,
  //       email: this.state.email,
  //       comments: this.state.comments
  //     };
  //     this.props.addSubmissions(formPayLoad);
  //     this.handleClearForm(event);
  //   }
  // }
  //
  // handleFirstName(event) {
  //   this.validateFirstName(event.target.value)
  //   this.setState({ firstName: event.target.value })
  // }
  //
  // handleLastName(event) {
  //   this.validateLastName(event.target.value)
  //   this.setState({ lastName: event.target.value })
  // }
  //
  // handleCity(event) {
  //   this.validateCity(event.target.value)
  //   this.setState({ city: event.target.value })
  // }
  //
  // handleStateSelection(event) {
  //   this.validateStateSelection(event.target.value)
  //   this.setState({ state: event.target.value })
  // }
  //
  // handlePhone(event) {
  //   this.validatePhone(event.target.value)
  //   this.setState({ phone: event.target.value })
  // }
  //
  // handleEmail(event) {
  //   this.validateEmail(event.target.value)
  //   this.setState({ email: event.target.value })
  // }
  //
  // handleComments(event) {
  //   this.validateComments(event.target.value)
  //   this.setState({ comments: event.target.value })
  // }
  //
  // validateFirstName(firstName) {
  //   if (firstName === '') {
  //     let newError = { firstName: 'First name field may not be blank.' }
  //     this.setState({ errors: Object.assign(this.state.errors, newError) })
  //     return false
  //   } else {
  //     let errorState = this.state.errors
  //     delete errorState.firstName
  //     this.setState({ errors: errorState })
  //     return true
  //   }
  // }
  //
  // validateLastName(lastName) {
  //   if (lastName === '') {
  //     let newError = { lastName: 'Last name field may not be blank.' }
  //     this.setState({ errors: Object.assign(this.state.errors, newError) })
  //     return false
  //   } else {
  //     let errorState = this.state.errors
  //     delete errorState.lastName
  //     this.setState({ errors: errorState })
  //     return true
  //   }
  // }
  //
  // validateCity(city) {
  //   if (city === '') {
  //     let newError = { city: 'City field may not be blank.' }
  //     this.setState({ errors: Object.assign(this.state.errors, newError) })
  //     return false
  //   } else {
  //     let errorState = this.state.errors
  //     delete errorState.city
  //     this.setState({ errors: errorState })
  //     return true
  //   }
  // }
  //
  // validateStateSelection(selection) {
  //   if (selection === '') {
  //     let newError = { state: 'You must select a state.' }
  //     this.setState({ errors: Object.assign(this.state.errors, newError) })
  //     return false
  //   } else {
  //     let errorState = this.state.errors
  //     delete errorState.state
  //     this.setState({ errors: errorState })
  //     return true
  //   }
  // }
  //
  // validatePhone(phone) {
  //   if (phone === '') {
  //     let newError = { phone: 'Phone number field may not be blank.' }
  //     this.setState({ errors: Object.assign(this.state.errors, newError) })
  //     return false
  //   } else {
  //     let errorState = this.state.errors
  //     delete errorState.phone
  //     this.setState({ errors: errorState })
  //     return true
  //   }
  // }
  //
  // validateEmail(email) {
  //   if (email === '') {
  //     let newError = { email: 'Email field may not be blank.' }
  //     this.setState({ errors: Object.assign(this.state.errors, newError) })
  //     return false
  //   } else {
  //     let errorState = this.state.errors
  //     delete errorState.email
  //     this.setState({ errors: errorState })
  //     return true
  //   }
  // }
  //
  // validateCity(comments) {
  //   if (comments === '') {
  //     let newError = { comments: 'Comments field may not be blank.' }
  //     this.setState({ errors: Object.assign(this.state.errors, newError) })
  //     return false
  //   } else {
  //     let errorState = this.state.errors
  //     delete errorState.comments
  //     this.setState({ errors: errorState })
  //     return true
  //   }
  // }
  //
  // handleClearForm(event) {
  //   event.preventDefault();
  //   this.setState({
  //     errors: {},
  //     firstName: '',
  //     lastName: '',
  //     city: '',
  //     state: '',
  //     phone: '',
  //     email: '',
  //     comments: ''
  //   })
  // }

  render() {
    // let errorDiv;
    // let errorItems;
    // if (Object.keys(this.state.errors).length > 0) {
    //   errorItems = Object.values(this.state.errors).map(error => {
    //     return(<li key={error}>{error}</li>)
    //   })
    //   errorDiv = <div className="callout alert">{errorItems}</div>
    // }
    return(
      <h1>Hello!</h1>
      // <form className="callout" onSubmit={this.handleFormSubmit}>
      //   {errorDiv}
      //   <TextField
      //     firstName={this.state.firstName}
      //     label='First Name'
      //     name='first name'
      //     handlerFunction={this.handleFirstName}
      //   />
      //   <TextField
      //     lastName={this.state.lastName}
      //     label='Last Name'
      //     name='last name'
      //     handlerFunction={this.handleLastName}
      //   />
      //   <TextField
      //     city={this.state.city}
      //     label='City'
      //     name='city'
      //     handlerFunction={this.handleCity}
      //   />
      //   <Select
      //     handlerFunction={this.handleStateSelection}
      //     label='State'
      //     name='state'
      //     options={this.state.stateOptions}
      //     selectedOption={this.state.stateSelected}
      //   />
      //   <TextField
      //     phone={this.state.phone}
      //     label='Phone Number'
      //     name='phone number'
      //     handlerFunction={this.handlePhone}
      //   />
      //   <TextField
      //     email={this.state.email}
      //     label='Email'
      //     name='email'
      //     handlerFunction={this.handleEmail}
      //   />
      //   <TextArea
      //     email={this.state.comments}
      //     label='What did you have in mind?'
      //     name='comments'
      //     handlerFunction={this.handleComments}
      //   />
      //   <div>
      //     <button className="button" onClick={this.handleClearForm}>Clear</button>
      //     <input className="button" type="submit" value="Submit" />
      //   </div>
      // </form>
    )
  }
}

// export default CustomWorkForm

ReactDOM.render(<CustomWorkForm/>, document.getElementById('custom-work-form'));
