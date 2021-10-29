terraform {
    backend "gcs" {
        credentials = "./vivpoc-keyfile.json"
        bucket = "vivpoc_bucket"
        prefix = "terraform/state"
    }
}
