import json
import os

vpc_id = os.environ['VPC_ID']
subnet_ids = os.environ['SUBNET_IDS']
sg_id = os.environ['SG']

def lambda_handler(event, context):
    # TODO implement
    return {
        'statusCode': 200,
        'body': json.dumps('vpcid:' + vpc_id + ' subnetids:' + subnet_ids + ' sg:' + sg_id)
    }
