import ballerina/http;

type User readonly & record {|
    string name;
    string id;
    string orgId;
    string orgHandle;
|};

service / on new http:Listener(9090) {
    resource function get user/[string id]() returns json {
        return users.filter(user=>user.id == id)[0];
    }

    resource function get user/orghandle/[string id]() returns json {
        string result =  users.filter(user=>user.id == id).pop().orgHandle;
        json orghandle = {orghandle: result};
        return orghandle;
    }
}
