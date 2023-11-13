import ballerina/http;

type User readonly & record {|
    string name;
    string id;
    string orgId;
    string orgHandle;
|};

service / on new http:Listener(9090) {
    resource function get user/[string id]() returns json {
        User[] result = users.filter(user=>user.id == id);
        return result.first();
    }
}
