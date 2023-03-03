osf_dependencies <- function(session) {
  
  # Create local_data_path`
  local_data_path <- paste0(
    "content/", session, "/data.local")
  
  # Create data directory on disk
  fs::dir_create(
    here::here(local_data_path)
  )
  
  # Create `osf_data_path`
  ## Get OSF information
  osf_node <- osfr::osf_retrieve_node(
    Sys.getenv("OSF_PATH")
  )
  
  ## Get OSF path
  osf_data_path <- osfr::osf_ls_files(
    osf_node,
    path = session)
  
  # Create list for output
  output <- list(
    local_data_path = local_data_path,
    osf_data_path = osf_data_path
  )
  
  # Return output
  return(output)
}

