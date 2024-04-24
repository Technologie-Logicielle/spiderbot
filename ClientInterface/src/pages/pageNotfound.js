import React ,{useEffect} from "react";

function NotFound ()  {
    useEffect(() => {
        window.location.assign('/404')
    })
    return (
        <React.Fragment>                       
            
        </React.Fragment>
    )
}

export default NotFound;