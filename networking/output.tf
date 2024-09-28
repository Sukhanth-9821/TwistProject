output "tp-vpc-id" {
  value = "${aws_vpc.tp-vpc.id}"
}

output "tp-snet01a-id"{
  value = "${aws_subnet.tp-snet01a.id}"
}

output "tp-snet01b-id"{
  value = "${aws_subnet.tp-snet01b.id}"
}