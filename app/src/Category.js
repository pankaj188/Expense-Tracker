import React, { Component } from 'react';
import AppNav from './AppNav';

class Category extends Component {
    state = { 
        isLoading : true,
        Categories : []
     }

     async componentDidMount() {

        try {
            const response = await fetch('/api/categories');
            if (!response.ok) {
              throw new Error('Network response was not ok');
            }
            const body = await response.json();
            this.setState({ Categories: body, isLoading: false });
          } catch (error) {
            // Handle the error appropriately, such as logging the error or displaying an error message.
            console.error('Error fetching data:', error);
            this.setState({ isLoading: false });
          }
        //  const response = await fetch('/api/categories');
        //  const body = await response.json();
        //  this.setState({Categories : body, isLoading : false});
     }

    render() { 
        const {Categories, isLoading} = this.state;
        if(isLoading) 
            return (<div>Loading....</div>);
        return ( 
            <div>
                <AppNav/>
                <h2>Categories</h2>
                {
                    Categories.map( category =>
                        <div id = {category.id}>
                            {category.name}
                        </div>
                    )
                }
            </div>
         );
    }
}
 
export default Category;