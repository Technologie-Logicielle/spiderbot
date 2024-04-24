import axios from "axios";
import header from "./header.service";

const getDataByURL = (urlWeb) => (
     axios.get(`${process.env.REACT_APP_API_URL}/craw/${urlWeb}`,
    { 
        headers: header.authHeader() 
    })
);


const CrawlerService = {
    getDataByURL
}
export default CrawlerService