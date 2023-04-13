(ns tk-clojure.core-test
  (:require
    [ring.mock.request :as mock]
    [clojure.test :refer :all]
    [tk-clojure.core :refer :all]))

(deftest handle-base-route-test
  (let [request (mock/request :get "/tkclojuretemplate/")]
    (is (= {:status 200
             :headers {"Content-Type" "text/html"}
             :body "tk clojure template root!"}
           (app-handler request)))))


(deftest handle-health-route-test
  (let [request (mock/request :get "/tkclojuretemplate/health")]
    (is (= {:status 200
            :headers {"Content-Type" "text/html"}
            :body "tk clojure template health check success!"}
           (app-handler request)))))
