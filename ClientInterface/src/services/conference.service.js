import axios from "axios";
import header from "./header.service";

const conferences = (search = {}) => {
    const searchParams = new URLSearchParams(Object.entries(search).filter(v => !!v[1]))
    return axios.get(`${process.env.REACT_APP_API_URL}/conferences`,
    { 
        headers: header.authHeader(),
        params: searchParams
    })
};

const conferenceById = (id) =>(
    axios.get(`${process.env.REACT_APP_API_URL}/conferences/${id}`, { 
        headers: header.authHeader() 
    })
);

const conferenceByIdFollow = (id) =>(
    axios.put(`${process.env.REACT_APP_API_URL}/conferences/${id}/follow`, { 
        headers: header.authHeader() 
    })
);

const conferenceByIdUnFollow = (id) =>(
    axios.put(`${process.env.REACT_APP_API_URL}/conferences/${id}/unfollow`, { 
        headers: header.authHeader() 
    })
);

const conferenceByIdPapers = (id) =>(
    axios.get(`${process.env.REACT_APP_API_URL}/conferences/papers/${id}`, { 
        headers: header.authHeader() 
    })
);

const conferenceByIdSpeakers = (id) =>(
    axios.get(`${process.env.REACT_APP_API_URL}/conferences/speakers/${id}`, { 
        headers: header.authHeader() 
    })
);


const ConferenceService = {
    conferences,
    conferenceById,
    conferenceByIdFollow,
    conferenceByIdUnFollow,
    conferenceByIdPapers,
    conferenceByIdSpeakers
}
export default ConferenceService
