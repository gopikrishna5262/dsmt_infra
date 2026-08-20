resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name    = "${var.project_name}-vpc"
    Project = var.project_name
  }
}

resource "aws_subnet" "frontend" {
  count = length(var.frontend_subnet_cidrs)

  vpc_id = aws_vpc.this.id

  cidr_block = var.frontend_subnet_cidrs[count.index]

  availability_zone = var.availability_zones[count.index]

  map_public_ip_on_launch = true

  tags = {
    Name    = "${var.project_name}-frontend-${count.index + 1}"
    Project = var.project_name
    Tier    = "frontend"
  }
}

resource "aws_subnet" "backend" {
  count = length(var.backend_subnet_cidrs)

  vpc_id = aws_vpc.this.id

  cidr_block = var.backend_subnet_cidrs[count.index]

  availability_zone = var.availability_zones[count.index]

  tags = {
    Name    = "${var.project_name}-backend-${count.index + 1}"
    Project = var.project_name
    Tier    = "backend"
  }
}

resource "aws_subnet" "database" {
  count = length(var.database_subnet_cidrs)

  vpc_id = aws_vpc.this.id

  cidr_block = var.database_subnet_cidrs[count.index]

  availability_zone = var.availability_zones[count.index]

  tags = {
    Name    = "${var.project_name}-database-${count.index + 1}"
    Project = var.project_name
    Tier    = "database"
  }
}
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name    = "${var.project_name}-igw"
    Project = var.project_name
  }
}
resource "aws_route_table" "frontend" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Name    = "${var.project_name}-frontend-rt"
    Project = var.project_name
    Tier    = "frontend"
  }
}

resource "aws_route_table_association" "frontend" {
  count = length(aws_subnet.frontend)

  subnet_id = aws_subnet.frontend[count.index].id

  route_table_id = aws_route_table.frontend.id
}

resource "aws_eip" "nat" {
  domain = "vpc"

  tags = {
    Name    = "${var.project_name}-nat-eip"
    Project = var.project_name
  }
}

resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.nat.id

  subnet_id = aws_subnet.frontend[0].id

  depends_on = [
    aws_internet_gateway.this
  ]

  tags = {
    Name    = "${var.project_name}-nat"
    Project = var.project_name
  }
}

resource "aws_route_table" "backend" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.this.id
  }

  tags = {
    Name    = "${var.project_name}-backend-rt"
    Project = var.project_name
    Tier    = "backend"
  }
}

resource "aws_route_table_association" "backend" {
  count = length(aws_subnet.backend)

  subnet_id = aws_subnet.backend[count.index].id

  route_table_id = aws_route_table.backend.id
}


resource "aws_route_table" "database" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name    = "${var.project_name}-database-rt"
    Project = var.project_name
    Tier    = "database"
  }
}

resource "aws_route_table_association" "database" {
  count = length(aws_subnet.database)

  subnet_id = aws_subnet.database[count.index].id

  route_table_id = aws_route_table.database.id
}