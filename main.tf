provider "google" {
  project = "play-comercial-mobile-dev"
  region  = "us-central1"
  zone    = "us-central1-c"
  credentials = "${file("serviceaccount.yaml")}"
}

resource "google_folder" "Financeiro" {
  display_name = "Financeiro"
  parent       = "organizations/540829645030"
}

resource "google_folder" "Comercial" {
  display_name = "Comercial"
  parent       = google_folder.Comercial.name
}

resource "google_folder" "Desenvolvimento" {
  display_name = "Desenvolvimento"
  parent       = google_folder.Comercial.name
}

resource "google_folder" "Mobile" {
  display_name = "Mobile"
  parent       = google_folder.Comercial.name
}


resource "google_project" "play-erp--dev" {
  name       = "play-erp--devv"
  project_id = "play-erp--dev"
  folder_id  = erp.name
  auto_create_network=false
  billing_account = "018973-A8340F-83D8E5"

}

# resource "google_project" "play-erp-dev" {
#   name       = "play-erp-dev"
#   project_id = "play-erp-dev"
#   folder_id  = google_folder.Desenvolvimento.name
#   auto_create_network=false
#   billing_account = "01B2C4-70459E-F53446"
# }