import Kitura
import KituraStencil
import SwiftMetrics
import SwiftMetricsDash

let router = Router()

///////////////////////////////////////
// MARK: - METRICS
// http://localhost:8080/swiftmetrics-dash/
///////////////////////////////////////

let sm = try SwiftMetrics()
let _ = try SwiftMetricsDash(swiftMetricsInstance: sm, endpoint: router)

///////////////////////////////////////
// MARK: - ROUTES
///////////////////////////////////////

// Template Engine
router.add(templateEngine: StencilTemplateEngine())

// Hello World
router.get("/") {
    request, response, next in
    response.send("Hello, World!")
    next()
}

// Parks API
router.get("/parks") { request, response, next in
    
    // Handle requests from browsers and mobile clients
    if request.accepts(type: "text/html") != nil {
        response.headers["Content-Type"] = "text/html"
        defer {
            next()
        }
        
        let parks = parkData["data"]!
        let context = ["parks": parks]
        
        try? response.render("parks.stencil", context: context).end()
        
    } else if request.accepts(type: "application/json") != nil {
        response.headers["Content-Type"] = "application/json"
        
        try? response.send(json: parkData).end()
    }
    
    next()
}

///////////////////////////////////////
// MARK: - START SERVER
///////////////////////////////////////
Kitura.addHTTPServer(onPort: 8080, with: router)
Kitura.run()
