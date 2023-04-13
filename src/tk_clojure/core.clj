(ns tk-clojure.core
  (:require [ring.adapter.jetty :as jetty]
            [ring.util.response :as resp])
  (:gen-class))

(defn base-handler [request]
  {:status 200
   :headers {"Content-Type" "text/html"}
   :body "tk clojure template root!"})

(defn health-handler [request]
  {:status 200
   :headers {"Content-Type", "text/html"}
   :body "tk clojure template health check success!"})

(defn app-handler [request]
  (let [path (:uri request)]
    (cond
      (= path "/tkclojuretemplate/")       (base-handler request)
      (= path "/tkclojuretemplate/health") (health-handler request))))

(defn -main []
  (jetty/run-jetty app-handler {:port 8083}))
