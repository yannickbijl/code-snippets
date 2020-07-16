library(OpenImageR)

consistency_image_save <- function(plot_object, file, type="png", overwrite=FALSE) {
  type <- tolower(type)

  org_filepath <- file
  new_filepath <- consistent_time_stamp_file(file)

  if (!(overwrite)) {
    if(!(file.exists(filepath))) {
      make_image(plot_object, org_filepath, type)
    } else {
      make_image(plot_object, new_filepath, type)


      org_hash = create_hash(org_filepath)
      new_hash = create_hash(new_filepath)
      if(org_hash == new_hash) { file.remove(new_filepath) }
    }
  }
} else {
  make_image(plot_object, org_filepath, type)
}

create_hash <- function(filepath) {
  image = readImage(filepath)
  image= rgb_2gray(image)
  hash = phash(image, hash_size = 8, highfreq_factor = 4, MODE = 'hash')

  return(hash)
}

make_image <- function(plot_object, filepath, type) {
  switch(type,
          "bmp" = bmp(filepath, width=1280, height=720, units="px", res=200, pointsize=12),
          "jpeg" = jpeg(filepath, width=1280, height=720, units="px", res=200, pointsize=12),
          "png" = png(filepath, width=1280, height=720, units="px", res=200, pointsize=12),
          "tiff" = tiff(filepath, width=1280, height=720, units="px", res=200, pointsize=12))
  plot(plot_object)
  dev.off()
}


args = commandArgs(trailingOnly=TRUE)
if (length(args) < 2) {
  stop("At least 2 arguments need to be supplied 'plot', and 'filename'.", call.=FALSE)
} else if (length(args > 4)) {
   stop("At most 4 arguments need to be supplied 'plot', 'filename', 'type', and 'overwrite'.", call.=FALSE)
}