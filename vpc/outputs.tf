output "vpc_tf_id" {
  value = aws_vpc.vpc_tf.id
}

output "vpc_tf_sn_pub_id" {
  value = aws_subnet.sn_public.id
}

output "vpc_tf_sn_priv_id" {
  value = aws_subnet.sn_private.id
}