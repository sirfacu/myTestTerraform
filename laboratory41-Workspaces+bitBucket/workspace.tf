resource "aws_db_instance" "myFirstDB" {
  allocated_storage = 5
  storage_type = var.dbstorageType
  engine = var.dbEngine
  engine_version = var.dbEngineVersion
  instance_class = lookup(var.instanceType,terraform.workspace)
  db_name = var.dbName
  username = var.dbuser
  password = "${file("../../rds-pwd")}"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot = "true"
  tags = merge("${var.def-tags}",{Name="lab41-Workspaces+bitBucket"})
}