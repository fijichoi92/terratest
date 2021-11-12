resource "aws_placement_group" "khchoi_place" {
  name      = "khchoi-place"
  strategy  = "cluster"
}