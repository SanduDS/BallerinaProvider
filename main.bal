import ballerina/http;

type Greeting readonly & record {|
    string name;
    string greeting;
|};


service / on new http:Listener(9090) {

    resource function get hello/[string name]() returns Greeting {
        Greeting newGreeting = {
            name: name,
            greeting: "hello! " + name
        };
        return newGreeting;
    }

        resource function get hello() returns json {
        json body = {"message":"Hello world"};
        return body;
    }
}
