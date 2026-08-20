resource "aws_iam_role" "ec2" {
  name = "${var.project_name}-ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "ec2.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name    = "${var.project_name}-ec2-role"
    Project = var.project_name
  }
}

resource "aws_iam_role_policy" "s3_read" {
  name = "${var.project_name}-s3-read"
  role = aws_iam_role.ec2.id

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Action = [
          "s3:GetObject"
        ]

        Resource = "${var.s3_bucket_arn}/*"
      },
      {
        Effect = "Allow"

        Action = [
          "s3:ListBucket"
        ]

        Resource = var.s3_bucket_arn
      }
    ]
  })
}

resource "aws_iam_instance_profile" "ec2" {
  name = "${var.project_name}-ec2-profile"

  role = aws_iam_role.ec2.name

  tags = {
    Name    = "${var.project_name}-ec2-profile"
    Project = var.project_name
  }
}

resource "aws_iam_role_policy_attachment" "ssm" {
  role       = aws_iam_role.ec2.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}